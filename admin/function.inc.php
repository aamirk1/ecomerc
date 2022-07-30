<?php
function pr($arr){
    echo '<pre>';
    print_r($arr);
}
function prx($arr){
    echo '<pre>';
    print_r($arr);
    die();
}
function get_safe_value($con,$str){
    if($str!=''){
        $str=trim($str);
        return strip_tags(mysqli_real_escape_string($con,$str));
    }
}

function redirect($url){
    ?>
    <script>
        window.location.href="<?php echo $url ?>";
    </script>
    <?php
}

function productSoldQtyByProductId($con,$pid){
    $sql="select sum(order_details.qty) as qty from order_details, `order` where `order`.id=order_details.order_id and order_details.product_id=$pid and `order`.order_status!=4";
    $res=mysqli_query($con,$sql);
    $row=mysqli_fetch_assoc($res);
    return $row['qty'];
}


function isAdmin(){
    if(!isset($_SESSION['ADMIN_LOGIN'])){
        ?>
        <script>
            window.location.href='login.php';
        </script>
        <?php
    }
    if($_SESSION['ADMIN_ROLE']==1){
        ?>
        <script>
            window.location.href='product.php';
        </script>
        <?php
    }
}

// function imageCompress($source,$path,$quality=60){
// 	$arr=getimagesize($source);
// 	if($arr['mime']=="image/png"){
// 		$i=imagecreatefrompng($source);
// 	}else{
// 		$i=imagecreatefromjpeg($source);
// 	}
// 	imagejpeg($i,$path,$quality);
// }
?>