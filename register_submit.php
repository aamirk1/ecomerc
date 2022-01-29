<?php
require('connection.inc.php');
require('function.inc.php');

$name=get_safe_value($con,$_POST['name']);
$email=get_safe_value($con,$_POST['email']);
$password=get_safe_value($con,$_POST['password']);
$mobile=get_safe_value($con,$_POST['mobile']);


$check_user=mysqli_num_rows(mysqli_query($con,"select * from users where email='$email'"));
if($check_user>0){
    echo "email_present";
}else{
    $added_on=date('Y-m-d h:i:s');
    mysqli_query($con,"insert into users(name,email,password,mobile,added_on) values('$name','$email','$password','$mobile','$added_on')");
    echo "insert";
}
?>