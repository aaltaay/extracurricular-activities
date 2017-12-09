<?php

require('database.php');
$query = 'SELECT * FROM person ORDER BY PersonID';
$queryExec = $db->prepare($query);
$queryExec->execute();
$sponsorNames = $queryExec->fetchAll();
$queryExec->closeCursor();
?>
    <?php include "Templates/header.php"; ?>
    <div class="container">
        <form action="add_event.php" method="post">
            <fieldset id="fieldset">
                <legend>
                Add New Event
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
                            <input type="text" name="ticket_cost">
                        </td>
                        <td>
                            <input type="text" name="length">
                        </td>
                        <td>
                            <input type="text" name="location_description">
                        </td>
                        <td>
                            <input type="text" name="event_description">
                        </td>
                        <td>
                            <input type="text" name="title">
                        </td>
                        <td>
                            <input type="text" name="date">
                        </td>
                        <td>
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
                <input class="buttons" type="submit" value="Add Event">
        </form>
        </fieldset>
        <br>
        <div class="view_events">
            <a href="index.php">
            <input class="buttons" type="submit" value="View Event List">
            </a>
        </div>

    <?php include "Templates/footer.php"; ?>