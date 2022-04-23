<?php
session_start();
$con=mysqli_connect('localhost','root','','ecom');
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/masav/');
define('SITE_PATH','http://localhost/masav/');
define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/productimage/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/productimage/');

define('BANNER_IMAGE_SERVER_PATH',SERVER_PATH.'media/banner/');
define('BANNER_IMAGE_SITE_PATH',SITE_PATH.'media/banner/');
?>