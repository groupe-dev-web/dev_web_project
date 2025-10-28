<?php
session_start();
header("Content-Type: application/json");
include 'config.php';

$userId = $_SESSION['user_id'] ?? null;

try {
    // Récupérer tous les films avec leur univers
    $query = "
        SELECT 
            u.id AS universe_id,
            u.name AS universe_name,
            f.id AS film_id,
            f.title,
            f.release_date,
            f.synopsis,
            f.poster_url
        FROM films f
        JOIN universes u ON f.universe_id = u.id
        ORDER BY u.id, f.release_date ASC
    ";
    $stmt = $pdo->query($query);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Si l'utilisateur est connecté, on récupère ses statuts personnels
    $userStatuses = [];
    if ($userId) {
        $statusQuery = "SELECT film_id, status FROM user_films WHERE user_id = ?";
        $s = $pdo->prepare($statusQuery);
        $s->execute([$userId]);
        foreach ($s->fetchAll(PDO::FETCH_ASSOC) as $r) {
            $userStatuses[$r['film_id']] = $r['status'];
        }
    }

    $universes = [];
    foreach ($rows as $row) {
        $uName = $row['universe_name'];
        if (!isset($universes[$uName])) {
            $universes[$uName] = [
                'universe_id' => $row['universe_id'],
                'universe_name' => $uName,
                'movies' => []
            ];
        }

        $universes[$uName]['movies'][] = [
            'id' => $row['film_id'],
            'title' => $row['title'],
            'release_date' => $row['release_date'],
            'synopsis' => $row['synopsis'],
            'poster_url' => $row['poster_url'] ?: '',
            'status' => $userStatuses[$row['film_id']] ?? ''
        ];
    }

    echo json_encode(["success" => true, "data" => array_values($universes)]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Erreur serveur : " . $e->getMessage()]);
}
