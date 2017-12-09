<?php

$key = filter_input(INPUT_POST, 'key');

// Get the event values the user wants to update
require('database.php');
$query = 'SELECT *
FROM event
WHERE eventID = :key';
$queryExec = $db->prepare($query);
$queryExec->bindValue(':key', $key);
$queryExec->execute();
$selectedEvent = $queryExec->fetch();
$queryExec->closeCursor();


// Get IDs
$key = $selectedEvent['eventID'];
$ticket_cost = $selectedEvent['ticket_Cost'];
$length = $selectedEvent['length'];
$location_description = $selectedEvent['location_Description'];
$event_description = $selectedEvent['event_Description'];
$title = $selectedEvent['title'];
$date = $selectedEvent['date/time'];
$sponsor_id = $selectedEvent['sponsorID'];

// get the person table values
require('database.php');
$query = 'SELECT *
           FROM person
           ORDER BY PersonID';
$queryExec = $db->prepare($query);
$queryExec->execute();
$sponsorNames = $queryExec->fetchAll();
$queryExec->closeCursor();

include "Templates/header.php";
?>

    <div class="container">
        <form action="update_event.php" method="post">
        <input type="hidden" name="key" value="<?php echo $selectedEvent['eventID']; ?>">
            <fieldset id="fieldset">
                <legend>
                    Update Event
                </legend>
                <table style="color: rgb(49, 49, 49)">
                    <tr>
                        <th>
                            <h1>Ticket Cost</h1>
                        </th>
                        <th>
                            <h1>Duration</h1>
                        </th>
                        <th>
                            <h1>Event Title</h1>
                        </th>
                        <th>
                            <h1>Event Description</h1>
                        </th>
                        <th>
                            <h1>Title</h1>
                        </th>
                        <th>
                            <h1>Date</h1>
                        </th>
                        <th>
                            <h1>Sponsor ID</h1>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="ticket_cost" value="<?php echo $ticket_cost; ?>">
                        </td>
                        <td class="wider_row">
                            <input type="text" name="length" value="<?php echo $length; ?>">
                        </td>
                        <td class="wider_row">
                            <input type="text" name="location_description" value="<?php echo $location_description; ?>">
                        </td>
                        <td class="wider_row">
                            <input type="text" name="event_description" value="<?php echo $event_description; ?>">
                        </td>
                        <td class="wider_row">
                            <input type="text" name="title" value="<?php echo $title; ?>">
                        </td>
                        <td class="wider_row">
                            <input type="text" name="date" value="<?php echo $date; ?>">
                        </td>
                        <td class="wider_row">
                            <select name="sponsor_id">
                                <?php foreach ($sponsorNames as $sponsorName) : ?>
                                <option value="<?php echo $sponsorName['PersonID']; ?>">
                                    <?php echo $sponsorName['lName']; ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                </table>
                <br>
                
                <input class="buttons" type="submit" value="Update Event">
        </form>
        </fieldset>
        <br>
        <div class="view_events">
            <a href="index.php">
                <input class="buttons" type="submit" value="View Event List">
            </a>
        </div>

    <?php include "Templates/footer.php"; ?>