<?php
header("Content-Type: application/json; charset=utf-8");

// ========================
// CONFIGURATION DE LA BASE
// ========================
$host = "localhost";       // ton hôte MySQL
$dbname = "disney_stream_clone";     // remplace par ta base
$username = "";        // ton utilisateur MySQL
$password = "";            // ton mot de passe

try {
  $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  http_response_code(500);
  echo json_encode(["error" => "Erreur de connexion : " . $e->getMessage()]);
  exit;
}

// ========================
// RÉCUPÉRATION DU PARAMÈTRE ID
// ========================
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
  http_response_code(400);
  echo json_encode(["error" => "ID du film manquant ou invalide."]);
  exit;
}

$id = (int)$_GET['id'];

// ========================
// RÉCUPÉRATION DU FILM
// ========================
try {
  $stmt = $pdo->prepare("SELECT  title,original_title,release_date,synopsis,poster_url FROM movies WHERE id = ?");
  $stmt->execute([$id]);
  $movie = $stmt->fetch(PDO::FETCH_ASSOC);

  if (!$movie) {
    http_response_code(404);
    echo json_encode(["error" => "Film introuvable."]);
    exit;
  }

  // ========================
  // RÉCUPÉRATION DES PROPRIÉTAIRES
  // ========================
  $stmtOwners = $pdo->prepare("SELECT name, status FROM owners WHERE movie_id = ?");
  $stmtOwners->execute([$id]);
  $owners = $stmtOwners->fetchAll(PDO::FETCH_ASSOC);

  $movie["owners"] = $owners;

  // ========================
  // RÉPONSE JSON
  // ========================
  echo json_encode($movie, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (PDOException $e) {
  http_response_code(500);
  echo json_encode(["error" => "Erreur SQL : " . $e->getMessage()]);
  exit;
}
?>
