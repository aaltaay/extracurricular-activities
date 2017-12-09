<?php
require_once('database.php');

// Get IDs
$key = filter_input(INPUT_POST, 'key', FILTER_VALIDATE_INT);

// Delete the product from the database
    $query = 'SET foreign_key_checks = 0; 
             DELETE FROM event WHERE eventID = :key;
             SET foreign_key_checks = 1;';
    $queryExec = $db->prepare($query);
    $queryExec->bindValue(':key', $key);
    $queryExec->execute();
    $queryExec->closeCursor(); 

// Display the Product List page
include('index.php');

?>