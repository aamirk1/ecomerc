<?php require('header.php');
$cat_res=mysqli_query($con,"Select * from categories where status=1 order by categories asc");
$cat_arr=array();
while($row=mysqli_fetch_assoc($cat_res)){
   $cat_arr[]=$row;
}
$resBanner=mysqli_query($con,"select * from banner where status='1' order by order_no asc")

?>
    <section class="slider_section slider_section2 mb-66">
        <?php if(mysqli_num_rows($resBanner)>0){?>    
        <div class="slider_area owl-carousel">
            
            <?php while($rowBanner=mysqli_fetch_assoc($resBanner)){?>
                <div class="single_slider d-flex align-items-center" data-bgimg="<?php echo BANNER_IMAGE_SITE_PATH.$rowBanner['image']?>">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6">
                                <div class="slider_content slider_content2 content_right">
                                    <h1>Men's Collection</h1>
                                    <h2>Wild Stone</h2>
                                
                                    <a href="<?php echo $rowBanner['btn_link']?>" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                
            <?php } ?>
            </div>
        <?php } ?> 
    </section>
    <div class="container-fluid product__container">
    <div class="row pt--100">
        <div class="col-xs-12">
            <div class="section__title--2 text-center">
                <h2 class="title__line">New Arrivals</h2>
            </div>
        </div>
    </div>
    <div class="htc__product__container">
        <!-- <div class="row ptb--50"> -->
            <div class="product__list clearfix mt--10">
                <?php
                $get_product=get_product($con,5);
                foreach($get_product as $list){
                ?>
                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-6">
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
                            <h4><a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a></h4>
                            <ul class="fr__pro__prize">
                                <li class="old__prize"><s>₹ <?php echo $list['mrp']?></s></li>
                                <li class="new__price">₹ <?php echo $list['price']?></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        <!-- </div> -->
    </div>
</div>

<div class="container-fluid product__container">
    <div class="row pt--100">
        <div class="col-xs-12">
            <div class="section__title--2 text-center">
                <h2 class="title__line">Best Seller</h2>
            </div>
        </div>
    </div>
    <!-- <div class="row ptb--50"> -->
        <div class="product__list clearfix mt--10">
            <?php
            $get_product=get_product($con,5,'','','','','yes');
            foreach($get_product as $list){
            ?>
            <div class="col-md-4 col-lg-3 col-sm-4 col-xs-6">
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
                        <h4><a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a></h4>
                        <ul class="fr__pro__prize">
                            <li class="old__prize"><s>₹ <?php echo $list['mrp']?></s></li>
                            <li class="new__price">₹ <?php echo $list['price']?></li>
                        </ul>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    <!-- </div> -->
</div>
<?php include 'footer.inc.php'; ?> 