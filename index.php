<?php
require_once('database.php');

// Get products for selected category
$query = 'SELECT * FROM event
ORDER BY eventID';
$queryExec = $db->prepare($query);
$queryExec->execute();
$events = $queryExec->fetchAll();
$queryExec->closeCursor();

include "Templates/header.php";
?>

<div class="container">
    <form id="add_event" action="./add_event_form.php" method="post">
        <input class="buttons" type="submit" value="Add Event">
    </form>
    <fieldset id="fieldset">
                <legend>
                    Update Event
                </legend>
    <table>
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

        <?php foreach ($events as $event) : ?>
        <tr>
            <td>$
                <?php echo $event['ticket_Cost']; ?>
            </td>
            <td>
                <?php echo $event['length']; ?>
            </td>
            <td>
                <?php echo $event['location_Description']; ?>
            </td>

            <td>
                <?php echo $event['event_Description']; ?>
            </td>
            <td>
                <?php echo $event['title']; ?>
            </td>
            <td>
                <?php echo $event['date/time']; ?>
            </td>
            <td>
                <?php echo $event['sponsorID']; ?>
            </td>

            <td>
                <form action="update_event_form.php" method="post">
                    <input type="hidden" name="key" value="<?php echo $event['eventID'];?>">
                    <input id="updateBtn" type="submit" value="Update">
                </form>
            </td>

            <td>
                <form action="delete_event.php" method="post">
                    <input type="hidden" name="key" value="<?php echo $event['eventID']; ?>">
                    <input id="destroyBtn" type="submit" value="Destroy">
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</fieldset>

<?php include "Templates/footer.php"; ?>