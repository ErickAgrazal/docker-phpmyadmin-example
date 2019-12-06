<h1>Hello World<h1>

<h2>Checking connection</h2>

<p>This is just for testing purposes, should be printing directly the credentials here.</p>

<?php
$servername = "mysql";
$username = "root";
$password = "complexpassword";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>