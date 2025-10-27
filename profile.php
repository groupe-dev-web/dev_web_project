<?php
session_start();
header("Content-Type: application/json");
include 'config.php';

// Vérifie si l’utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "Not logged in"]);
    exit;
}

$user_id = $_SESSION['user_id'];

// Récupère les infos utilisateur
$stmt = $pdo->prepare("SELECT id, username, email FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Récupère les films selon leur statut
$stmt = $pdo->prepare("
    SELECT f.id, f.title, f.poster_url, uf.status, uf.note
    FROM user_film uf
    JOIN movies f ON uf.movie_id = f.id
    WHERE uf.user_id = ?
");
$stmt->execute([$user_id]);
$films = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Regroupe les films par statut
$grouped = [
    "vu" => [],
    "envie" => [],
    "possede" => [],
    "separer" => []
];

foreach ($films as $film) {
    $statut = strtolower($film['status']);
    if (isset($grouped[$statut])) {
        $grouped[$statut][] = $film;
    }
}

// Envoi du JSON complet
echo json_encode([
    "user" => $user,
    "films" => $grouped
]);
?>
