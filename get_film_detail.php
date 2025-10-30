<?php
header("Content-Type: application/json; charset=utf-8");
include 'config.php';

$film_id = $_GET['id'] ?? null;
if (!$film_id || !is_numeric($film_id)) {
    echo json_encode(["success" => false, "message" => "ID du film invalide"]);
    exit;
}

try {
    // Récupération des informations du film
    $stmt = $pdo->prepare("
        SELECT f.id, f.title, f.original_title, f.release_date, f.synopsis, f.poster_url, 
               u.name AS universe_name
        FROM films f
        JOIN universes u ON f.universe_id = u.id
        WHERE f.id = ?
    ");
    $stmt->execute([$film_id]);
    $film = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$film) {
        echo json_encode(["success" => false, "message" => "Film introuvable"]);
        exit;
    }

    // Récupération des utilisateurs liés à ce film
    $ownersStmt = $pdo->prepare("
        SELECT users.username, users.email, uf.status
        FROM user_films uf
        JOIN users ON uf.user_id = users.id
        WHERE uf.film_id = ? AND (uf.status = 'owned' OR uf.status = 'want_to_sell')
    ");
    $ownersStmt->execute([$film_id]);
    $owners = $ownersStmt->fetchAll(PDO::FETCH_ASSOC);

    // Si l'utilisateur est connecté, récupérer son statut pour ce film
    session_start();
    $user_status = null;
    if (isset($_SESSION['user_id'])) {
        $statusStmt = $pdo->prepare("SELECT status FROM user_films WHERE user_id = ? AND film_id = ?");
        $statusStmt->execute([$_SESSION['user_id'], $film_id]);
        $statusRow = $statusStmt->fetch(PDO::FETCH_ASSOC);
        if ($statusRow) $user_status = $statusRow['status'];
    }

    echo json_encode([
        "success" => true,
        "film" => $film,
        "owners" => $owners,
        "user_status" => $user_status
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
