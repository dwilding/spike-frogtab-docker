<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <p>
      Hello World!
    </p>
    <p>
      <?php echo file_get_contents('/var/www/internal/test.txt') ?>
    </p>
  </body>
</html>
