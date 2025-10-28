<?php
session_start();
header("Content-Type: application/json");
include 'config.php';

$userId = $_SESSION['user_id'] ?? null;

if (!$userId) {
    echo json_encode(["success" => false, "message" => "Non connecté"]);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);
$filmId = $data['film_id'] ?? null;
$status = $data['status'] ?? null;

if (!$filmId || !$status) {
    echo json_encode(["success" => false, "message" => "Données manquantes"]);
    exit;
}

try {
    // Supprime d'abord tout ancien statut pour ce film (même user)
    $pdo->prepare("DELETE FROM user_films WHERE user_id = ? AND film_id = ?")->execute([$userId, $filmId]);

    // Puis ajoute la nouvelle valeur
    $stmt = $pdo->prepare("INSERT INTO user_films (user_id, film_id, status) VALUES (?, ?, ?)");
    $stmt->execute([$userId, $filmId, $status]);

    echo json_encode(["success" => true, "message" => "Mise à jour réussie"]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Erreur serveur : " . $e->getMessage()]);
}
