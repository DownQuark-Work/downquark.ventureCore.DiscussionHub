<!DOCTYPE html>
<html>
<body>

<h1>My first PHP page</h1>

<?= "Hello World!" ?>

Go <a href="http://dq.local:1003/qore/tiki-wizard_admin.php?&stepNr=0&url=tiki-index.php%3Fpage%3DHomePage">HERE</a>: http://dq.local:1003/qore/tiki-wizard_admin.php?&stepNr=0&url=tiki-index.php%3Fpage%3DHomePage

</body>
<?php

  echo "Uncomment the below code for mysqli reference:";

  // echo $MYSQL_USER;
  //Step1
  // with docker we can connect to the service or network name: `mariadb` or `TEMP-db-relational`
  // $db = mysqli_connect('mariadb:3313','root','root','dq_discussion_hub')
  // or die('Error connecting to MySQL server.');

  // echo 'connected!';

  // if($_GET['insert']==1){
  //   echo('inserting!');
  //   $sql = "INSERT INTO members (username) VALUES('Lil')";
  //   $result = $db->query($sql);
  //   $sql = "INSERT INTO members (username) VALUES('Nick')";
  //   $result = $db->query($sql);
  //   $sql = "INSERT INTO members (username) VALUES('Maroon')";
  //   $result = $db->query($sql);
  //   $sql = "INSERT INTO members (username) VALUES('Tommy')";
  //   $result = $db->query($sql);
  // }


// $sql = 'SELECT * FROM members';

// if ($result = $db->query($sql)) {
//     while ($data = $result->fetch_object()) {
//         $members[] = $data;
//     }
// }

// foreach ($members as $member) {
//     echo "<br>";
//     echo $member->username . " ?!";
//     // echo "<br>";
// }

?> 


</html>