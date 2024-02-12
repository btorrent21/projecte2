<?php
// Conexión a la base de datos (ajusta los detalles según tu configuración)
$servername = "db";
$username = "sergibernat";
$password = "projecte2";
$dbname = "bbdduniversitat";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . mysqli_connect_error);
}

// Consulta 1: Mostrar profesores con nombre de 7 letras o más
$query_professors = "SELECT * FROM professor WHERE LENGTH(nom) >= 7";
$result_professors = $conn->query($query_professors);

// Consulta 2: Mostrar alumnos mayores de 30 años, ordenados de menor a mayor
$query_students = "SELECT * FROM estudiant WHERE DATEDIFF(CURDATE(), data_neixament) / 365.25 > 30 ORDER BY data_neixament DESC";
$result_students = $conn->query($query_students);

// Consulta 3: Mostrar estudiantes que van en bicicleta
$query_bike_students = "SELECT * FROM estudiant WHERE ID_bicicleta IS NOT NULL";
$result_bike_students = $conn->query($query_bike_students);

// Manejar la eliminación de un alumno
if (isset($_GET['delete_student'])) {
    $student_id = $_GET['delete_student'];
    $delete_student_query = "DELETE FROM estudiant WHERE DNI = '$student_id'";
    $conn->query($delete_student_query);
    header("Location: index.php"); // Redirigir para evitar reenviar el formulario
}

// Manejar la eliminación de un profesor
if (isset($_GET['delete_professor'])) {
    $professor_id = $_GET['delete_professor'];
    $delete_professor_query = "DELETE FROM professor WHERE DNI = '$professor_id'";
    $conn->query($delete_professor_query);
    header("Location: index.php"); // Redirigir para evitar reenviar el formulario
}

// Cerrar la conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Universidad</title>
    <link rel="stylesheet" href="diseno.css">
    <link rel="stylesheet" href="design.css">
</head>
<body>

<h2>Profesores con nombre de 7 letras o más:</h2>
<table>
    <tr>
        <th>DNI</th>
        <th>Nombre</th>
        <!-- Agrega más columnas según las necesidades -->
    </tr>
    <?php while ($row = $result_professors->fetch_assoc()): ?>
        <tr>
            <td><?= $row['DNI'] ?></td>
            <td><?= $row['nom'] ?></td>
            <!-- Agrega más celdas según las necesidades -->
        </tr>
    <?php endwhile; ?>
</table>

<h2>Alumnos mayores de 30 años:</h2>
<table>
    <tr>
        <th>DNI</th>
        <th>Nombre</th>
        <th>Fecha Naixement</th>
        <!-- Agrega más columnas según las necesidades -->
    </tr>
    <?php while ($row = $result_students->fetch_assoc()): ?>
        <tr>
            <td><?= $row['DNI'] ?></td>
            <td><?= $row['nom'] ?></td>
	    <td><?= $row['data_neixament'] ?></td>
            <!-- Agrega más celdas según las necesidades -->
        </tr>
    <?php endwhile; ?>
</table>

<h2>Estudiantes que van en bicicleta:</h2>
<table>
    <tr>
        <th>DNI</th>
        <th>Nombre</th>
        <!-- Agrega más columnas según las necesidades -->
    </tr>
    <?php while ($row = $result_bike_students->fetch_assoc()): ?>
        <tr>
            <td><?= $row['DNI'] ?></td>
            <td><?= $row['nom'] ?></td>
            <!-- Agrega más celdas según las necesidades -->
        </tr>
    <?php endwhile; ?>
</table>

<h2>Eliminar Alumno o Profesor:</h2>
<div style="display:flex;">
    <form action="index.php" style="margin: 0% 20% 0% 5%" method="get">
        <label for="delete_student">Eliminar Alumno (DNI):</label>
        <input type="text" name="delete_student">
        <input type="submit" value="Eliminar Alumno">
    </form>

    <form action="index.php" method="get">
        <label for="delete_professor">Eliminar Profesor (DNI):</label>
        <input type="text" name="delete_professor">
        <input type="submit" value="Eliminar Profesor">
    </form>
</div>

</body>

</html>
