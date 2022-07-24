<?php
include('vendor/autoload.php');
require('connection.inc.php');
require('function.inc.php');

if(!$_SESSION['ADMIN_LOGIN']){
    if(!isset($_SESSION['USER_ID'])){
        die();
    }
}
$order_id=get_safe_value($con,$_GET['id']);
$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];
$css=file_get_contents('css/bootstrap.min.css');
$css.=file_get_contents('style.css');

$html='<div class="wishlist-table table-responsive">

    <div class="avs">
    <h3>Masav</h3>
    </div>
    <div>

    <div>';

    if(isset($_SESSION['ADMIN_LOGIN'])){            
        $ord=mysqli_query($con,"select `order`.*, order_status.name as order_status_str from `order`,order_status where `order`.user_id='$uid' and order_status.id=`order`.order_status");       
    }else{
        $uid=$_SESSION['USER_ID'];
        $ord=mysqli_query($con,"select `order`.*, order_status.name as order_status_str from `order`,order_status where `order`.user_id='$uid' and order_status.id=`order`.order_status");

        //query problem only
    }
                                
    while ($roww=mysqli_fetch_assoc($ord)) {
        
        $html.='<div>
        
        <div>
            <span>Order Id: OD'.$roww['id'].'</span><br>
            <span>Order Date: '.$roww['added_on'].'</span>
        </div>
        <div class="mpd2">
            <strong>Shipping Details:</strong><br>
            <span class="una">Customer Name: '.$_SESSION['USER_NAME'].', </span><br>
            <span id="addr">Address: '.$roww['address'].','.$roww['city'].','.$roww['pincode'].'</span><br>            
        </div>
        
        <hr>
                                            
            
        </div>';
    }   

    $html.='</div>
    </div>


    <table>
        <thead>
            <tr>
                <th class="product-thumbnail">Product Name</th>
                <th class="product-name">Qty</th>
                <th class="product-name">Price</th>
                <th class="product-name">Total Price</th>
            </tr>
        </thead>
        <tbody>';
        
        if(isset($_SESSION['ADMIN_LOGIN'])){
            $res=mysqli_query($con,"select distinct(order_details.id), order_details.*,product.name,product.image from order_details,product, `order` where order_details.order_id='$order_id' and order_details.product_id=product.id");
        }else{
            $uid=$_SESSION['USER_ID'];
            $res=mysqli_query($con,"select distinct(order_details.id), order_details.*,product.name,product.image from order_details,product, `order` where order_details.order_id='$order_id' and `order`.user_id='$uid' and order_details.product_id=product.id");
        }
        
        $total_price=0;  
        if(mysqli_num_rows($res)==0){
            die();
        }                                  
        while ($row=mysqli_fetch_assoc($res)) {
            $total_price=$total_price+($row['qty']*$row['price']);
            $pp=$row['qty']*$row['price'];
            $html.='<tr>
                <td class="product-name"> '.$row['name'].' </td>
                <td class="product-name"> '.$row['qty'].'</td>
                <td class="product-name"> '.$row['price'].'</td>
                <td class="product-name"> '.$pp.'</td>
            </tr>';
        }   

        if($coupon_value!=''){
            $html.='<tr>
                <td colspan="2"></td>
                <td class="product-name"> Coupon Value</td>
                <td class="product-name"> '.$coupon_value.' </td>
            
            </tr>';
        }
        if($coupon_value==''){
            $coupon_value=0;
        }
        $total_price = $total_price - $coupon_value;
        $html.='<tr>
            <td colspan="2"></td>
            <td class="product-name"> Total Price</td>
            <td class="product-name"> '.$total_price.' </td>
        </tr>';

    $html.='</tbody>
    </table>
</div>';
$mpdf=new \Mpdf\Mpdf();
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html,2);
$file=time().'.pdf';
$mpdf->Output($file,'D');

?>