<?php 
require('header.php');
$str=mysqli_real_escape_string($con,$_GET['str']);
if($str!=''){
    $get_product=get_product($con,'','','',$str);
}else{
    ?>
    <script>
        window.location.href='index.php';
    </script>
    <?php
}

?>
<div class="body__overlay"></div>
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/44.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">Search</span>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active"><?php echo $str?></span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <?php if(count($get_product)>0){?>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="htc__product__rightidebar">
                            
                            <div class="row">
                                <div class="shop__grid__view__wrap">
                                    <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                    <?php
                                    foreach($get_product as $list){
                                    ?>
                                    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                        <div class="category">
                                            <div class="ht__cat__thumb">
                                                <a href="product.php?id=<?php echo $list['id']?>">
                                                    <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images">
                                                </a>
                                            </div>
                                            <div class="fr__hover__info">
                                                <ul class="product__action">
                                                    <li><a href="javascript:void(0)" onclick="wishlist_manage('<?php echo $list['id']?>','add')"><i class="icon-heart icons"></i></a></li>
                                                    <li><a href="javascript:void(0)" onclick="manage_cart('<?php echo $list['id']?>','add')"><i class="icon-handbag icons"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="fr__product__inner">
                                                <h4><a href="product-details.html"><?php echo $list['name']?></a></h4>
                                                <ul class="fr__pro__prize">
                                                    <li class="old__prize"><strike>₹ <?php echo $list['mrp']?></strike></li>
                                                    <li class="new__price">₹ <?php echo $list['price']?></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } else{
                        echo "Data Not Found";
                    }?>
                </div>
            </div>
        </section>
<?php require('footer.inc.php')?>
        