<?php
try {
    $pdo = new PDO("mysql:host=db;dbname=demo", "root", "root");
    
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("SELECT text FROM message LIMIT 1");

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        echo $row['text'];
    } else {
        echo "No message found.";
    }
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>

