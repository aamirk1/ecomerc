<?php 
require('header.php');
$product_id=mysqli_real_escape_string($con,$_GET['id']);
$get_product=get_product($con,'','',$product_id);
?>
<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/44.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <a class="breadcrumb-item" href="categories.php?id=<?php echo $get_product['0']['categories_id']?>"><?php echo $get_product['0']['categories']?></a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active"><?php echo $get_product['0']['name']?></span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="htc__product__details bg__white ptb--100">
            <!-- Start Product Details Top -->
            <div class="htc__product__details__top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                            <div class="htc__product__details__tab__content">
                                <div class="product__big__images">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$get_product['0']['image']?>">
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="ht__product__dtl">
                                <h2><?php echo $get_product['0']['name']?></h2>
                                <ul  class="pro__prize">
                                    <li class="old__prize"><?php echo $get_product['0']['mrp']?></li>
                                    <li><?php echo $get_product['0']['price']?></li>
                                </ul>
                                <p class="pro__info"><?php echo $get_product['0']['short_decs']?></p>
                                <div class="ht__pro__desc">
                                    <div class="sin__desc">
                                        <?php
                                        $productSoldQtyByProductId=productSoldQtyByProductId($con,$get_product['0']['id']);
                                        
                                        $pending_qty=$get_product['0']['qty']-$productSoldQtyByProductId;

                                        $cart_show='yes';
                                        if($get_product['0']['qty']>$productSoldQtyByProductId){
                                            $stock='In Stock';
                                        }else{
                                            $stock='Out Of Stock';
                                            $cart_show='';
                                        }
                                        ?>
                                        <p><span>Availability:</span> <?php echo $stock?></p>
                                    </div>
                                    <div class="sin__desc">
                                    <?php
                                    if($cart_show!=''){
                                    ?>
                                        <p><span>Qty:</span>
                                        <select id="qty">
                                            
                                            <?php
                                            for($i=1;$i<=$pending_qty;$i++){
                                                echo "<option>$i</option>";
                                            }
                                            ?>
                                        </select>                                    
                                        </p>
                                        <?php } ?>
                                    </div>
                                    <div class="sin__desc align--left">
                                        <p><span>Categories:</span></p>
                                        <ul class="pro__cat__list">
                                            <li><a href="#"><?php echo $get_product['0']['categories']?></a></li>
                                        </ul>
                                    </div>
                                    </div>
                                </div>
                                <?php
                                if($cart_show!=''){
                                    ?>
                                <a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
                                    <?php } ?>
                            <div id="social_share_box">
                                <a href=""><img src="images\icons\WhatsApp.png"></a>
                                <a href=""><img src="images\icons\facebook.png"></a>
                                <a href=""><img src="images\icons\twitter.png"></a>
                                
                            </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="htc__produc__decription bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- Start List And Grid View -->
                        <ul class="pro__details__tab" role="tablist">
                            <li role="presentation" class="description active"><a href="#description" role="tab" data-toggle="tab">description</a></li>
                        </ul>
                        <!-- End List And Grid View -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="ht__pro__details__content">
                            <div role="tabpanel" id="description" class="pro__single__content tab-pane fade in active">
                                <div class="pro__tab__content__inner">
                                <?php echo $get_product['0']['description']?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        

<?php require('footer.inc.php')?>
        