<?php
session_start();
header("Content-Type: application/json");
include 'config.php'; // ta connexion PDO ($pdo)

// Vérifie si l’utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "Utilisateur non connecté"]);
    exit;
}

$user_id = $_SESSION['user_id'];

// Récupère les infos utilisateur
$stmt = $pdo->prepare("SELECT username, email, display_name, bio FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Récupère les films selon leur statut
$statuses = [
    "watched" => "Regardés",
    "want_to_watch" => "À regarder",
    "owned" => "Possédés",
    "want_to_sell" => "En vente"
];

$data = ["user" => $user];

foreach ($statuses as $status => $label) {
    $stmt = $pdo->prepare("
        SELECT f.id, f.title, f.poster_url, f.release_date
        FROM user_films uf
        JOIN films f ON uf.film_id = f.id
        WHERE uf.user_id = ? AND uf.status = ?
    ");
    $stmt->execute([$user_id, $status]);
    $data[$status] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

echo json_encode($data);
?>
