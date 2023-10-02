<?php
require('connection.inc.php');
require('function.inc.php');
require('add_to_cart.inc.php');
$cat_res=mysqli_query($con,"Select * from categories where header_show=1 order by categories asc");
$cat_arr=array();
while($row=mysqli_fetch_assoc($cat_res)){
   $cat_arr[]=$row;
}

$obj=new add_to_cart();
$totalProduct=$obj->totalProduct();

if(isset($_SESSION['USER_LOGIN'])){
   $uid=$_SESSION['USER_ID'];
   if(isset($_GET['wishlist_id'])){
      $wid=get_safe_value($con,$_GET['wishlist_id']);
      mysqli_query($con,"delete from wishlist where id='$wid' and user_id='$uid'");
   }
   $wishlist_count=mysqli_num_rows(mysqli_query($con,"select product.name,product.image,wishlist.id from product,wishlist where wishlist.product_id=product.id and wishlist.user_id='$uid'"));
	
}
$script_name=$_SERVER['SCRIPT_NAME'];
$script_name_arr=explode('/',$script_name);
$mypage=$script_name_arr[count($script_name_arr)-1];

$meta_title="Maasav";
$meta_desc="Maasav";
$meta_keyword="Maasav";
$meta_url=SITE_PATH;
$meta_image='';
if($mypage=='product.php'){
   $product_id=get_safe_value($con,$_GET['id']);
   $product_meta=mysqli_fetch_assoc(mysqli_query($con,"select * from product where id='$product_id'"));
   $meta_title=$product_meta['meta_title'];
   $meta_desc=$product_meta['meta_desc'];
   $meta_keyword=$product_meta['meta_keyword'];
   $meta_url=SITE_PATH."product.php?id=".$product_id;
   $meta_image=PRODUCT_IMAGE_SITE_PATH.$product_meta['image'];
}if($mypage=='contact.php'){
   $meta_title='Contact Us';
   
}
?>
<!doctype html>
<html class="no-js" lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title><?php echo $meta_title?> </title>
   <meta name="description" content="<?php echo $meta_desc?>">
   <meta name="keywords" content="<?php echo $meta_keyword?>">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <meta property="og:title" content="<?php echo $meta_title ?>"/>
   <meta property="og:image" content="<?php echo $meta_image?>"/>
   <meta property="og:url" content="<?php echo $meta_url?>"/>
   <meta property="og:site_name" content="<?php echo $SITE_PATH?>"/>

   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/owl.carousel.min.css">
   <link rel="stylesheet" href="css/owl.theme.default.min.css">
   <link rel="stylesheet" href="css/core.css">
   <link rel="stylesheet" href="css/shortcode/shortcodes.css">
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style2.css">
   <link rel="stylesheet" href="css/responsive.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="css/custom.css">
   
   
   
   
   <link rel="stylesheet" href="css/styleHeader.css">
   
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">



   <script src="js/vendor/modernizr-3.5.0.min.js"></script>
   <!-- <style>
      .htc__shopping__cart a span.htc__wishlist {
         background: #ff1493;
         border-radius: 100%;
         color: #fff;
         font-size: 9px;
         height: 17px;
         line-height: 19px;
         position: absolute;
         right: 18px;
         text-align: center;
         top: -4px;
         width: 17px;
      }
   </style> -->
</head>
<body>
<div class="off_canvars_overlay"></div>

<div class="offcanvas_menu offcanvas_two">
    <div class="canvas_open">
        <a href="javascript:void(0)"><i class="fa fa-bars"></i></a>
    </div>
    <div class="offcanvas_menu_wrapper">
        <div class="canvas_close">
            <a href="javascript:void(0)"><i class="fa fa-times"></i></a>
        </div>
        <div class="header_account">
            <ul>
                <!-- <li class="language">
                    <a href="#"><img src="img/icon/language.png" alt="English"> EN <i
                            class="fa fa-angle-down"></i></a>
                    <ul class="dropdown_language">
                        <li><a href="#">English</a></li>
                        <li><a href="#">Germany</a></li>
                        <li><a href="#">Hindi</a></li>
                    </ul>
                </li> -->
                <!-- <li class="currency">
                    <a href="#">INR <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown_currency">
                        <li><a href="#">EUR - EURO</a></li>
                        <li><a href="#">GBP - British Pound</a></li>
                        <li><a href="#">USD - US Dollar</a></li>
                    </ul>
                </li> -->
                <li class="top_links">
                    <a href="#">My Account <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown_links">
                        <li><a href="#">Checkout</a></li>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Shopping Cart</a></li>
                        <li><a href="#">Wishlist</a></li>
                    </ul>
                </li>

            </ul>
        </div>

        <div class="header_right_info">
            <ul>
                <li class="search_box">
                    <a href="javascript:void(0)"><i class="fa fa-search"></i></a>
                 
                    <div class="search_widget <?php echo $class?>">
                                            <form action="search.php" method="get">
                                                <input type="text" placeholder="Search your perfume" name="str">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </li>
                <li class="header_wishlist">
                    <a href="#"><i class="fa fa-heart-o"></i>
                        <span class="item_count">4</span>
                    </a>
                </li>
                <li class="mini_cart_wrapper">
                    <a href="javascript:void(0)">
                        <i class="fa fa-shopping-cart"></i>
                        <span class="item_count">2</span>
                    </a>
                    <div class="mini_cart mini_cart2">
                    <?php
								$cart_total=0;
								foreach($_SESSION['cart'] as $key=>$val){
								//$productArr=get_product($con,'','',$key);
								
								//prx($productArr);
								
								foreach($val as $key1=>$val1){
									
$resAttr=mysqli_fetch_assoc(mysqli_query($con,"select product_attributes.*,color_master.color,size_master.size from product_attributes 
	left join color_master on product_attributes.color_id=color_master.id and color_master.status=1 
	left join size_master on product_attributes.size_id=size_master.id and size_master.status=1
	where product_attributes.id='$key1'"));						
$productArr=get_product($con,'','',$key,'','','','',$key1);
$pname=$productArr[0]['name'];
$mrp=$productArr[0]['mrp'];
$price=$productArr[0]['price'];
$image=$productArr[0]['image'];
$qty=$val1['qty'];	
								
								$cart_total=$cart_total+($price*$qty);
								?>
                        <div class="cart_gallery">
                              <div class="cart_item">
                                 <div class="cart_img">
                                    <a href="#"><img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$image?>"
                                             alt="Perfume"></a>
                                 </div>
                                 <div class="cart_info">
                                    <a href="#"><?php echo $pname?></a>
                                    <p><span>Rs. <?php echo $price?></span> X <?php echo $qty?></p>
                                 </div>
                                 <div class="cart_remove">
                                 <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','remove')"><i class="fa fa-times"></i></a>
                                 </div>
                              </div>
                           </div>
                           <div class="mini_cart_table">
                              <div class="cart_table_border">
                                    <div class="cart_total">
                                       <span>Sub Total :</span>
                                       <span class="price">Rs. <?php echo $price*$qty?></span>
                                    </div>

                                    <div class="cart_total mt-10">
                                       <span>Total :</span>
                                       <span class="price">Rs. <?php echo $cart_total?></span>
                                    </div>

                              </div>
                           </div>
                        <div class="mini_cart_footer">
                            <div class="cart_button">
                                <a href="#">View Cart</a>
                            </div>
                            <div class="cart_button">
                                <a href="#">Checkout</a>
                            </div>
                        </div>
                    </div>
                    
								<?php } } ?>
                    <!-- mini cart ends here -->
                </li>
            </ul>
        </div>

        <div id="menu" class="text-left">
            <ul class="offcanvas_main_menu">
                <li class="menu-item-has-children active">
                    <a href="#">Home</a>
                    <ul class="sub-menu">
                        <li><a href="#">Men</a></li>
                        <li><a href="#">Women</a></li>
                        <li><a href="#">Unisex</a></li>
                        <li><a href="#">Kids</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">Brands</a>
                    <ul class="sub-menu">
                        <li class="menu-item-has-children">
                            <a href="#">Men</a>
                            <ul class="sub-menu">
                                <li><a href="#">Versace</a></li>
                                <li><a href="#">Hugo Boss</a></li>
                                <li><a href="#">Jaguar</a></li>
                                <li><a href="#">Armani</a></li>
                                <li><a href="#">Paco Rabbane</a></li>
                                <li><a href="#">Ralph Lauren</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Women</a>
                            <ul class="sub-menu">
                                <li><a href="#">Bvlgari</a></li>
                                <li><a href="#">Coach</a></li>
                                <li><a href="#">Kenzo</a></li>
                                <li><a href="#">D&G</a></li>
                                <li><a href="#">Jean Paul Gaultier</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Unisex</a>
                            <ul class="sub-menu">
                                <li><a href="#">Ajmal</a></li>
                                <li><a href="#">Calvin Klein</a></li>
                                <li><a href="#">The Body Shop</a></li>
                                <li><a href="#">Lattafa</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">Blog</a>
                    <ul class="sub-menu">
                        <li><a href="#">Newsletter</a></li>
                        <li><a href="#">Social Media</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">My Account</a>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">About Us</a>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">User</a>
                    <ul class="sub-menu">
                        <li><a href="#">Login In</a></li>
                        <li><a href="#">Sign up</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="offcanvas_footer">
            <span><a href="#"><i class="fa fa-envelope-0"></i>deo@gmail.com</a></span>
            <ul>
                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="pinterest"><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
            </ul>
        </div>
    </div>

</div>


<header>
    <div class="main_header header_transparent header-mobile-m">
        <div class="header_container sticky-header">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-lg-2">
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <!-- main-menu starts -->

                        <?php 
                              $class="mr15";
                              if(isset($_SESSION['USER_LOGIN'])){
                                 $class="";
                              }
                              ?>
                        <div class="main_menu menu_two menu_position">
                            <nav>
                                <ul>
                                    <li>
                                        <a href="index.html" class="active">Home <i
                                                class="fa fa-angle-down"></i></a>
                                        <ul class="sub_menu">
                                            <li><a href="#">Men</a></li>
                                            <li><a href="#">Women</a></li>
                                            <li><a href="#">Unisex</a></li>
                                            <li><a href="#">Kids</a></li>
                                        </ul>

                                    </li>

                                    <li class="mega_items">
                                        <a href="#">Brands <i class="fa fa-angle-down"></i></a>
                                        <div class="mega_menu">
                                            <ul class="mega_menu_inner">
                                                <li>
                                                    <a href="#">Men</a>
                                                    <ul>
                                                        <li><a href="#">Versace</a></li>
                                                        <li><a href="#">Hugo Boss</a></li>
                                                        <li><a href="#">Jaguar</a></li>
                                                        <li><a href="#">Armani</a></li>
                                                        <li><a href="#">Paco Rabbane</a></li>
                                                        <li><a href="#">Ralph Lauren</a></li>
                                                    </ul>

                                                </li>
                                                <li>
                                                    <a href="#">Women</a>
                                                    <ul>
                                                        <li><a href="#">Bvlgari</a></li>
                                                        <li><a href="#">Coach</a></li>
                                                        <li><a href="#">Kenzo</a></li>
                                                        <li><a href="#">D&G</a></li>
                                                        <li><a href="#">Jean Paul Gaultier</a></li>
                                                    </ul>

                                                </li>
                                                <li>
                                                    <a href="#">Unisex</a>
                                                    <ul>
                                                        <li><a href="#">Ajmal</a></li>
                                                        <li><a href="#">Calvin Klein</a></li>
                                                        <li><a href="#">The Body Shop</a></li>
                                                        <li><a href="#">Lattafa</a></li>
                                                    </ul>

                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">Blog <i class="fa fa-angle-down"></i></a>
                                        <ul class="sub_menu pages">
                                            <li><a href="#">Newsletter</a></li>
                                            <li><a href="#">Social Media</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <!-- <li>
                                        <a href="#">User <i class="fa fa-angle-down"></i></a>
                                        <ul class="sub_menu pages">
                                            <li><a href="#">Login In</a></li>
                                            <li><a href="#">Sign Up</a></li>
                                        </ul>
                                    </li> -->
                                </ul>
                            </nav>
                        </div>

                        <!-- main menu ends -->
                    </div>
                    <div class="col-lg-4">
                        <div class="header_top_right">
                            <div class="header_right_info">
                                <ul>
                                
                                    <li class="search_box">
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-search"></i>
                                        </a>
                                        <div class="search_widget <?php echo $class?>">
                                            <form action="search.php" method="get">
                                                <input type="text" placeholder="Search your perfume" name="str">
                                                <button type="submit"><i class="fa fa-search"></i></button>
                                            </form>
                                        </div>
                                    </li>
                                    <?php   
                                 if(isset($_SESSION['USER_ID'])){
                                 ?>
                                    <li class="header_wishlist">
                                        <a href="wishlist.php">
                                            <i class="fa fa-heart-o"></i>
                                            <span class="item_count"><?php echo $wishlist_count ?></span>
                                        </a>
                                    </li>
                                    
                                    <li class="mini_cart_wrapper">
                                        <a href="javascript:void(0)">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span class="item_count"><?php echo $totalProduct ?></span>
                                        </a>

                                        <!-- mini cart  -->
                                        <div class="mini_cart mini_cart2">
                                        <?php
								$cart_total=0;
								foreach($_SESSION['cart'] as $key=>$val){
								//$productArr=get_product($con,'','',$key);
								
								//prx($productArr);
								
								foreach($val as $key1=>$val1){
									
$resAttr=mysqli_fetch_assoc(mysqli_query($con,"select product_attributes.*,color_master.color,size_master.size from product_attributes 
	left join color_master on product_attributes.color_id=color_master.id and color_master.status=1 
	left join size_master on product_attributes.size_id=size_master.id and size_master.status=1
	where product_attributes.id='$key1'"));						
$productArr=get_product($con,'','',$key,'','','','',$key1);
$pname=$productArr[0]['name'];
$mrp=$productArr[0]['mrp'];
$price=$productArr[0]['price'];
$image=$productArr[0]['image'];
$qty=$val1['qty'];	
								
								$cart_total=$cart_total+($price*$qty);
								?>
                                            <div class="cart_gallery">
                                                <div class="cart_item">
                                                    <div class="cart_img">
                                                        <a href="#"><img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$image?>"
                                                                alt="Perfume"></a>
                                                    </div>
                                                    <div class="cart_info">
                                                        <a href="#"><?php echo $pname?></a>
                                                        <p><span>Rs. <?php echo $price?></span> X <?php echo $qty?></p>
                                                    </div>
                                                    <div class="cart_remove">
                                                    <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','remove')"><i class="fa fa-times"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mini_cart_table">
                                                <div class="cart_table_border">
                                                    <div class="cart_total">
                                                        <span>Sub Total :</span>
                                                        <span class="price">Rs. <?php echo $price*$qty?></span>
                                                    </div>

                                                    <div class="cart_total mt-10">
                                                        <span>Total :</span>
                                                        <span class="price">Rs. <?php echo $cart_total?></span>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="mini_cart_footer">
                                                <div class="cart_button">
                                                    <a href="cart.php">View Cart</a>
                                                </div>
                                                <div class="cart_button">
                                                    <a href="checkout.php">Checkout</a>
                                                </div>
                                            </div>
                                        </div>
                                        
								<?php } } ?>
                                        <!-- mini cart ends -->
                                    </li>
                                    <?php } ?>
                                </ul>
                            </div>
                            <div class="header_account">
                              <?php if(isset($_SESSION['USER_LOGIN'])){
                                    ?>
                                <ul>
                                    <li class="top_links">
                                        <a href="#">
                                            <i class="fa fa-cog"></i>
                                        </a>
                                        <ul class="dropdown_links">
                                            <li><a href="checkout.php">Checkout</a></li>
                                            <li><a href="#">My Account</a></li>
                                            <li><a href="cart.php">Shopping cart</a></li>
                                            <li><a href="#">Wishlist</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                       <?php echo $_SESSION['USER_NAME']?> </a>
                                       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                          
                                          <a class="dropdown-item" href="logout.php">Logout </a>
                                       </div>
                                    </li>
                                </ul>
                            </div>
                            <?php
                           }else{
                                    echo '<a href="login.php" class="mr15">Login/Register</a>';
                                 }
                                 ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
