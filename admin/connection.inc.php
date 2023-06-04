<?php
session_start();
$con=mysqli_connect('localhost','root','','ecom');
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/masav/');
define('SITE_PATH','http://localhost/masav/');

define('INSTAMOJO_REDIRECT',SITE_PATH.'payment_complete.php');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/productimage/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/productimage/');


define('CATEGORIES_IMAGE_SERVER_PATH',SERVER_PATH.'media/categories_img/');
define('CATEGORIES_IMAGE_SITE_PATH',SITE_PATH.'media/categories_img/');

define('PRODUCT_MULTIPLE_IMAGE_SERVER_PATH',SERVER_PATH.'media/product_multi_images/');
define('PRODUCT_MULTIPLE_IMAGE_SITE_PATH',SITE_PATH.'media/product_multi_images/');

define('BANNER_IMAGE_SERVER_PATH',SERVER_PATH.'media/banner/');
define('BANNER_IMAGE_SITE_PATH',SITE_PATH.'media/banner/');


define('INSTAMOJO_KEY','test_8562c45715cf38cd874db22d0f1');
define('INSTAMOJO_TOKEN','test_e2f2c1b3d165a58c1e2ecb6e2b2');
//https://www.youtube.com/watch?v=zWLKQ_loJqI&list=PLWCLxMult9xfYlDRir2OGRZFK397f3Yeb&index=24


define('SMTP_EMAIL','mak1311178@gmail.com');
define('SMTP_PASSWORD','A@mir1311178');
//https://www.youtube.com/watch?v=aBbmo1pi5B0&list=PLWCLxMult9xfY_dsYicKGcCLhlZ6YXFMh&index=1


define('SMS_KEY','sms_key');
//https://www.youtube.com/watch?v=_XaaIJlkNV4&list=PLWCLxMult9xfYlDRir2OGRZFK397f3Yeb&index=27
?>

