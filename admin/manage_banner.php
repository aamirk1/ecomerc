<?php
require('header.inc.php');
isAdmin();
$btn_link='';
$image='';
$msg='';
$order_no=0;
$image_required='required';
if(isset($_GET['id']) && $_GET['id']!=''){
	$id=get_safe_value($con,$_GET['id']);
	$image_required='';
	$res=mysqli_query($con,"select * from banner where id='$id'");
	$check=mysqli_num_rows($res);
	if($check>0){
		$row=mysqli_fetch_assoc($res);
		$btn_link=$row['btn_link'];
		$image=$row['image'];
		$order_no=$row['order_no'];
		
	}else{
		redirect('banner.php');
	}
}

if(isset($_POST['submit'])){
	$btn_link=get_safe_value($con,$_POST['btn_link']);
	$order_no=get_safe_value($con,$_POST['order_no']);

	if(isset($_GET['id']) && $_GET['id']==0){
		if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
			$msg="Please Select Only png,jpg and jpeg image formate";
		}
	}else{
		if($_FILES['image']['type']!=''){
				if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
				$msg="Please select only png,jpg and jpeg image formate";
			}
		}
	}
	
	$msg='';
	if($msg==''){
		if(isset($_GET['id']) && $_GET['id']!=''){	
			if($_FILES['image']['name']!=''){
				$image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
				move_uploaded_file($_FILES['image']['tmp_name'],BANNER_IMAGE_SERVER_PATH.$image);
				//imageCompress($_FILES['image']['tmp_name'],BANNER_IMAGE_SERVER_PATH.$image);
				mysqli_query($con,"update banner set btn_link='$btn_link',image='$image',order_no='$order_no' where id='$id'");
			}else{
				
				mysqli_query($con,"update banner set btn_link='$btn_link',order_no='$order_no' where id='$id'");
			}	
		}else{
			$image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
			move_uploaded_file($_FILES['image']['tmp_name'],BANNER_IMAGE_SERVER_PATH.$image);
			//imageCompress($_FILES['image']['tmp_name'],BANNER_IMAGE_SERVER_PATH.$image);
			mysqli_query($con,"insert into banner(btn_link,image,order_no,status) values('$btn_link','$image','$order_no','1')");
		}
		redirect('banner.php');
	}
}
?>
<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header"><strong>Banner</strong><small> Form</small></div>
					<form method="post" enctype="multipart/form-data">
					<div class="card-body card-block">
						<div class="form-group">
							<label for="btn_link" class=" form-control-label">Button Link</label>
							<input type="text" name="btn_link" placeholder="Enter your Button Link" class="form-control" value="<?php echo $btn_link?>">
						</div>
						<div class="form-group">
							<label for="categories" class=" form-control-label">Image</label>
							<input type="file" name="image" placeholder="Enter your image name" class="form-control" <?php echo $image_required?> value="<?php echo $image?>">
							<?php
							if($image!=''){
								echo "<a target='_blank' href='".BANNER_IMAGE_SITE_PATH.$image."'><img width='150px' src='".BANNER_IMAGE_SITE_PATH.$image."'/></a>";
							}
							?>
							<h5 style="color:red"><span>Image Size </span>width: 1200px; height: 284px;</h5>
						</div>
						<div class="form-group">
							<label for="btn_link" class=" form-control-label">Order No.</label>
							<input type="text" name="order_no" placeholder="Enter your Order No." class="form-control" value="<?php echo $order_no?>">
						</div>
						<button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
							<span id="payment-button-amount" name="submit">Submit</span>
						</button>
						<div class="field_error"><?php echo $msg?></div>
					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
    </div>
<?php
require('footer.inc.php');
?>