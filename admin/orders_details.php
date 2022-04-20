<?php
require('header.inc.php');
isAdmin();
$order_id=get_safe_value($con,$_GET['id']);
$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value,coupon_code from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];
$coupon_code=$coupon_details['coupon_code'];
if(isset($_POST['update_order_status'])){
	$update_order_status=$_POST['update_order_status'];
	mysqli_query($con,"update `order` set order_status='$update_order_status' where id='$order_id'");
}
if($coupon_value==''){
    $coupon_value=0;
}
?>
<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
					<h4 class="box-title">Order Details </h4>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table">
								<thead>
									<tr>
										<th class="product-thumbnail">Product Name</th>
										<th class="product-thumbnail">Product Image</th>
										<th class="product-name">Qty</th>
										<th class="product-price">Price</th>
										<th class="product-price">Total Price</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$res=mysqli_query($con,"select distinct(order_details.id), order_details.*,product.name,product.image from order_details,product, `order` where order_details.order_id='$order_id' and order_details.product_id=product.id");
									$total_price=0;                                    
									while ($row=mysqli_fetch_assoc($res)) {
									$total_price=$total_price+($row['qty']*$row['price']);
									?>                                    
									<tr>
										<td class="product-name"> <?php echo $row['name']?></td>
										<td class="product-name"> <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"></td>
										<td class="product-name"> <?php echo $row['qty']?></td>
										<td class="product-price"> <?php echo $row['price']?></td>
										<td class="product-price"> <?php echo $row['qty']*$row['price']?></td>
									</tr>
									<?php } 
                                    if($coupon_value!=''){
                                    ?>
                                    <tr>
                                        <td colspan="3-name"></td>
                                        <td class="product-name"> Coupon Value</td>
                                        <td class="product-name"> <?php 
										echo $coupon_value."($coupon_code)"
										?></td>
                                    </tr>
                                    <?php } ?>
									<tr>
										<td colspan="3-name"></td>
										<td class="product-name">Total Price</td>
										<td class="product-price"><?php 
                                        echo $total_price - $coupon_value;
                                        ?></td>
									</tr>
								</tbody>
							</table>
							<div id="address_details">
								<?php
								$re=mysqli_query($con,"select distinct(order_details.id), order_details.*,`order`.address, `order`.city, `order`.pincode from order_details, `order` where order_details.order_id='$order_id'");
								while ($row=mysqli_fetch_assoc($re)) {
								$address=$row['address'];
								$city=$row['city'];
								$pincode=$row['pincode'];
								?>
								<?php } ?>
								<strong>Address:</strong>
								<?php echo $address?>, <?php echo $city?>, <?php echo $pincode?><br/><br/>
								<strong>Order Status: </strong>
								<?php
								$order_status_arr=mysqli_fetch_assoc(mysqli_query($con,"select order_status.name from order_status,`order` where `order`.id='$order_id' and `order`.order_status=order_status.id"));
								echo $order_status_arr['name'];
								?>

								<div>
									<form method="post">
										<select name="update_order_status" class="form-control">
											<option>Select Status</option>
											<?php
											$res=mysqli_query($con,"select * from order_status");
											while($row=mysqli_fetch_assoc($res)){
												if($row['id']==$categories_id){
													echo"<option selected value=".$row['id'].">".$row['name']."</option>";
												}else{
													echo"<option value=".$row['id'].">".$row['name']."</option>";
												}
											}
											?>
										</select>
										<input type="submit" class="form-control"/>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php
require('footer.inc.php');
?>