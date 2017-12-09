<?php
// Get the product data
$ticket_cost = filter_input(INPUT_POST, 'ticket_cost', FILTER_VALIDATE_FLOAT);
$length = filter_input(INPUT_POST, 'length');
$location_description = filter_input(INPUT_POST, 'location_description');
$event_description = filter_input(INPUT_POST, 'event_description');
$title = filter_input(INPUT_POST, 'title');
$date = filter_input(INPUT_POST, 'date');
$sponsor_id = filter_input(INPUT_POST, 'sponsor_id', FILTER_VALIDATE_INT);

// Validate inputs
if ($ticket_cost == null || 
        $length == null || 
        $location_description == null || 
        $event_description == null || 
        $title == null || 
        $date == null|| 
        $sponsor_id == null) {

    $error = "Invalid event data. Check all fields and try again.";
    include('error.php');
} else {
    require_once('database.php');

    // Add the product to the database  
    $query = 'INSERT INTO event
                 (ticket_Cost, length, 
                 location_Description, event_Description, title,
                 `date/time`, sponsorID)
              VALUES
                 (:ticket_cost, :length, :location_description, 
                 :event_description, :title, :date, :sponsor_id)';
    $queryExec = $db->prepare($query);
    $queryExec->bindValue(':sponsor_id', $sponsor_id);
    $queryExec->bindValue(':ticket_cost', $ticket_cost);
    $queryExec->bindValue(':length', $length);
    $queryExec->bindValue(':location_description', $location_description);
    $queryExec->bindValue(':event_description', $event_description);
    $queryExec->bindValue(':title', $title);
    $queryExec->bindValue(':date', $date);
    $queryExec->execute();
    $queryExec->closeCursor();

    // Display the Product List page
    include('index.php');
}
?>