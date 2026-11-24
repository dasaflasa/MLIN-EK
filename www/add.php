
<?php
require_once "db.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $sql = "INSERT INTO UPORABNIK
            (id_uporabnika, ime, priimek, email, geslo, telefon, naslov)
            VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        $_POST['id_uporabnika'],
        $_POST['ime'],
        $_POST['priimek'],
        $_POST['email'],
        $_POST['geslo'],
        $_POST['telefon'],
        $_POST['naslov']
    ]);

    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Person</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h1>Add New Person</h1>

<form method="POST">

    <label>id_uporabnika</label>
    <input type="text" name="id_uporabnika" required>

    <label>ime</label>
    <input type="text" name="ime" required>

    <label>priimek</label>
    <input type="text" name="priimek">

    <label>email</label>
    <input type="email" name="email">

    <label>geslo</label>
    <input type="text" name="geslo">

    <label>telefon</label>
    <input type="text" name="telefon">

    <label>naslov</label>
    <input type="text" name="naslov">

    <button type="submit">Save Person</button>

</form>

<a href="index.php">Back to persons</a>

</body>
</html>
