<?php include "Templates/header.php"; ?>

<div class="container">
    <fieldset id="fieldset">
        <legend>
            Invalid Input!
        </legend>

        <p>[
            <?php echo $error; ?>]</p>

    </fieldset>
    <br>

    <div class="view_events">
        <a href="./index.php">
            <input class="buttons" type="submit" value="View Event List">
        </a>
    </div>

    <?php include "Templates/footer.php"; ?>