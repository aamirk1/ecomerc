<?php require('header.php');

$resBanner=mysqli_query($con,"select * from banner where status='1' order by order_no asc")

?>
<div class="body__overlay"></div>
    <?php if(mysqli_num_rows($resBanner)>0){?>        
    <div class="slider__container slider--one bg__cat--3">
        <div class="slide__container slider__activation__wrap owl-carousel">
            <?php while($rowBanner=mysqli_fetch_assoc($resBanner)){?>
            <div class="single__slide animation__style01 slider__fixed--height">
                <div class="container">
                    <div class="slide__thumb">
                        <a href="<?php echo $rowBanner['btn_link']?>"><img src="<?php echo BANNER_IMAGE_SITE_PATH.$rowBanner['image']?>"></a>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
<section class="htc__category__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line">New Arrivals</h2>
                </div>
            </div>
        </div>
        <div class="htc__product__container">
            <div class="row">
                <div class="product__list clearfix mt--10">
                    <?php
                    $get_product=get_product($con,4);
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
                                    <li><a href="product.php?id=<?php echo $list['id']?>" ><i class="icon-handbag icons"></i></a></li>
                                </ul>
                            </div>
                            <div class="fr__product__inner">
                                <h4><a href="product-details.html"><?php echo $list['name']?></a></h4>
                                <ul class="fr__pro__prize">
                                    <li class="old__prize"><?php echo $list['mrp']?></li>
                                    <li><?php echo $list['price']?></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="ftr__product__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line">Best Seller</h2>
                </div>
            </div>
        </div>
        <div class="row">
        <div class="product__list clearfix mt--10">
            <?php
            $get_product=get_product($con,4,'','','','','yes');
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
                            <li><a href="product.php?id=<?php echo $list['id']?>" ><i class="icon-handbag icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="fr__product__inner">
                        <h4><a href="product-details.html"><?php echo $list['name']?></a></h4>
                        <ul class="fr__pro__prize">
                            <li class="old__prize"><?php echo $list['mrp']?></li>
                            <li><?php echo $list['price']?></li>
                        </ul>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php require('footer.inc.php')?>
        