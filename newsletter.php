<?php
require('connection.inc.php');
require('function.inc.php');
$name=get_safe_value($con,$_POST['name']);
$email=get_safe_value($con,$_POST['email']);
$added_on=date('Y-m-d h:i:s');
mysqli_query($con,"insert into newsletter(name,email,added_on) values('$name','$email','$added_on')");
echo "Thank You";
?>