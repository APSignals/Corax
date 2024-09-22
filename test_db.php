<?php
$servername = "localhost";
$username = "bani";  // Replace with your username
$password = "000333soundwin";  // Replace with your password
$dbname = "moodle";  // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

// Optionally, you can query the database to see if the connection works properly
$result = $conn->query("SHOW TABLES");
if ($result) {
    echo "<br>Tables in the database:<br>";
    while ($row = $result->fetch_assoc()) {
        echo $row['Tables_in_' . $dbname] . "<br>";
    }
} else {
    echo "Error running query: " . $conn->error;
}

$conn->close();
?>
