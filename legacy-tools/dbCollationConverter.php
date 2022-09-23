<?php
    $dbh = new PDO('mysql:dbname=talokuntoon;host=localhost:3306','root','root');
    if(!$dbh) { echo "Cannot connect to the database"; die(); }
    $tablesStmt = $dbh->prepare('SHOW TABLES');
    $tablesStmt->execute();
    $tables = $tablesStmt->fetchAll(PDO::FETCH_COLUMN);

    $alerterDbStmt = $dbh->prepare("ALTER DATABASE `talokuntoon` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
    $alerterDbStmt->execute();

    foreach($tables as $table) {
      $alerterStmt = $dbh->prepare("ALTER TABLE $table CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
      $alerterStmt->execute();
    }

    echo "The collation of your database has been successfully changed!";
?>