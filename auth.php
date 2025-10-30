<?php
session_start();
header("Content-Type: application/json");
include 'config.php';

$action = $_GET['action'] ?? '';

if ($action === 'login') {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = trim($data['email'] ?? '');
    $password = trim($data['password'] ?? '');

    if (!$email || !$password) {
        echo json_encode(["success" => false, "message" => "Champs manquants"]);
        exit;
    }

    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Vérifie le mot de passe en clair
    if ($user && $password === $user['password_hash']) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['email'] = $user['email'];

        echo json_encode([
            "success" => true,
            "message" => "Connexion réussie",
            "user" => [
                "id" => $user['id'],
                "username" => $user['username'],
                "email" => $user['email']
            ]
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Email ou mot de passe incorrect"]);
    }
}

elseif ($action === 'register') {
    $data = json_decode(file_get_contents("php://input"), true);
    $username = trim($data['username'] ?? '');
    $email = trim($data['email'] ?? '');
    $password = trim($data['password'] ?? '');

    if (!$username || !$email || !$password) {
        echo json_encode(["success" => false, "message" => "Champs manquants"]);
        exit;
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)");
        $stmt->execute([$username, $email, $password]);

        // Récupère l’utilisateur après inscription
        $user_id = $pdo->lastInsertId();
        $_SESSION['user_id'] = $user_id;
        $_SESSION['username'] = $username;
        $_SESSION['email'] = $email;

        echo json_encode(["success" => true, "message" => "Inscription réussie"]);
    } catch (PDOException $e) {
        echo json_encode(["success" => false, "message" => "Cet email est déjà utilisé"]);
    }
}

elseif ($action === 'logout') {
    session_destroy();
    echo json_encode(["success" => true]);
}
elseif ($action === 'status') {
    if (isset($_SESSION['user_id'])) {
        echo json_encode([
            "loggedIn" => true,
            "user" => [
                "id" => $_SESSION['user_id'],
                "username" => $_SESSION['username'],
                "email" => $_SESSION['email']
            ]
        ]);
    } else {
        echo json_encode(["loggedIn" => false]);
    }
}

else {
    echo json_encode(["success" => false, "message" => "Action invalide"]);
}
?>
