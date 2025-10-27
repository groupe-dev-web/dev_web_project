<?php
$host = "localhost";       // adresse du serveur MySQL
$dbname = "disney_stream_clone";  // nom de ta base
$username = "root";        // utilisateur MySQL (souvent "root" en local)
$password = "";            // mot de passe MySQL (vide sur XAMPP/WAMP)

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die(json_encode(["error" => "Database connection failed: " . $e->getMessage()]));
}
?>
