<?php
$database_host = "dbhost.cs.man.ac.uk";
$database_user = "s56124at";
$database_pass = "Aish-Database123";
$database_name = "s56124at";

$conn = mysqli_connect($database_host,$database_user,$database_pass);
if (!$conn)
    die("connection failed".mysqli_connect_error());
mysqli_select_db($conn,"s56124at");

?>