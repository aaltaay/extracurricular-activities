<?php
// Get the product data

$key = filter_input(INPUT_POST, 'key', FILTER_VALIDATE_INT);
$ticket_cost = filter_input(INPUT_POST, 'ticket_cost', FILTER_VALIDATE_FLOAT);
$length = filter_input(INPUT_POST, 'length');
$location_description = filter_input(INPUT_POST, 'location_description');
$event_description = filter_input(INPUT_POST, 'event_description');
$title = filter_input(INPUT_POST, 'title');
$date = filter_input(INPUT_POST, 'date');
$sponsor_id = filter_input(INPUT_POST, 'sponsor_id', FILTER_VALIDATE_INT);

// Validate inputs
if ($key == null ||
        $ticket_cost == null || 
        $length == null || 
        $location_description == null || 
        $event_description == null || 
        $title == null || 
        $date == null|| 
        $sponsor_id == null) {

    $error = "Invalid event data. Check all fields and try again.";
    include('error.php');
} else {
    require('database.php');
    $query = 'SET foreign_key_checks = 0;';
    $queryExec = $db->prepare($query);
    $queryExec->execute();
    $queryExec->closeCursor();

    $query = 'UPDATE event SET ticket_Cost = :ticket_cost, length = :length, 
    location_Description = :location_description, 
    event_Description = :event_description,
    title = :title, `date/time` = :date, sponsorID = :sponsor_id
    WHERE eventID = :key;';
    $queryExec = $db->prepare($query);
    $queryExec->bindValue(':key', $key);
    $queryExec->bindValue(':ticket_cost', $ticket_cost);
    $queryExec->bindValue(':length', $length);
    $queryExec->bindValue(':location_description', $location_description);
    $queryExec->bindValue(':event_description', $event_description);
    $queryExec->bindValue(':title', $title);
    $queryExec->bindValue(':date', $date);
    $queryExec->bindValue(':sponsor_id', $sponsor_id);
    $queryExec->execute();
    $events = $queryExec->fetchAll();
    $queryExec->closeCursor();

    $query = 'SET foreign_key_checks = 1;';
    $queryExec = $db->prepare($query);
    $queryExec->execute();
    $queryExec->closeCursor();

    // Display the Product List page
    include('./index.php');
}
?>
