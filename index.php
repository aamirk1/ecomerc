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
    <div class="container product__container">
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
</section>
<section class="ftr__product__area ptb--100">
    <div class="container product__container">
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
                            <li class="old__prize"><strike>₹ <?php echo $list['mrp']?></strike></li>
                            <li class="new__price">₹ <?php echo $list['price']?></li>
                        </ul>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<section class="ftr__product__area msghai">
    <div class="container product__container">
        <div class="bg-textBg px-16 md:px-40 textSection py-50 mb-40 md:mb-80">
            <div class="font-normal">
                <div class="ql-container ql-bubble ql-disabled">
                    <div class="ql-editor" font-customisation="para-text" color-customisation="page-body-text" data-gramm="false" contenteditable="false">
                        <div>
                            <h1 class="ql-align-center"><span class="ql-size-large">Why Customers Love Us</span></h1><p class="ql-align-center"> </p><p class="ql-align-center"><span class="ql-size-large">Our dedication and commitment to providing the best products to our customers have made us a people’s favourite. We match our quality with the best prices and ensure our customers have a safe and smooth shopping experience with us.&nbsp;</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- <div class="w-full gray"><div class="container text-center mx-auto pt-30 pb-22 md:pb-10 md:flex justify-between px-16 md:px-0" font-customisation="para-text"><div class="md:w-1/2 mb-16 md:mb-0"><div class="inline-block"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"><path d="M15.2 11.467H8.8v4.266h6.4v-4.266zM9.867 11.467V9.333A2.134 2.134 0 0112 7.2v0a2.133 2.133 0 012.133 2.133v2.134" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M18.4 13.6a6.4 6.4 0 11-12.8 0V5.067L12 4l6.4 1.067V13.6z" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path></svg></div><br><span class="text-14" color-customisation="page-body-text">Secure Payments</span></div><div class="md:w-1/2 mb-16 md:mb-0"><div class="inline-block"><svg width="48" height="48" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M18.244 17.664H22V11.56l-3.286-.94-1.878-5.164H9.15v12.207" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><circle cx="14.019" cy="17.195" r="2.347" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></circle><path d="M12.61 7.336v3.756h3.756" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M6.39 5.457H2M6.449 9.86H3.368M6.449 14.258h-1.32" stroke="currentColor" stroke-width="1.2" stroke-miterlimit="10" stroke-linecap="round"></path></svg></div><br><span class="text-14" color-customisation="page-body-text">Shipping in India</span></div><div class="md:w-1/2 mb-16 md:mb-0"><div class="inline-block"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="#666666" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"><path d="M9.333 19.733h8a1.885 1.885 0 001.867-1.6l.8-6.4a1.572 1.572 0 00-1.6-1.6h-4.8V7.755a4.836 4.836 0 00-1.412-3.21 1.07 1.07 0 00-1.788.788v3.2l-3.2 3.734" stroke="#666666" stroke-width="1.5" stroke-miterlimit="10"></path><path d="M7.2 10.667H4v9.066h3.2v-9.066z" stroke="#666666" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="square"></path></svg></div><br><span class="text-14" color-customisation="page-body-text">Great Value &amp; Quality</span></div></div></div> -->

<!--  -->
<?php require('footer.inc.php')?>
        