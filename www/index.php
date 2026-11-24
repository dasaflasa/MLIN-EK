
<?php
require_once "db.php";

$stmt = $pdo->query(
    "SELECT * FROM UPORABNIK ORDER BY id_uporabnika"
);

$UPORABNIK = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Persons Database</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h1>Persons Database</h1>

<a href="add.php" class="button">Add Person</a>

<table>
    <tr>
        <th>id_uporabnika</th>
        <th>ime</th>
        <th>priimek</th>
        <th>email</th>
        <th>geslo</th>
        <th>telefon</th>
        <th>naslov</th>    
    </tr>

    <?php foreach ($UPORABNIK as $UPORAKNIKI): ?>
    <tr>
        <td><?= htmlspecialchars($UPORAKNIKI['id_uporabnika']) ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['ime']) ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['priimek']) ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['email'] ?? '') ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['geslo'] ?? '') ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['telefon'] ?? '') ?></td>
        <td><?= htmlspecialchars($UPORAKNIKI['naslov'] ?? '') ?></td>
    </tr>
    <?php endforeach; ?>

</table>

</body>
</html>
