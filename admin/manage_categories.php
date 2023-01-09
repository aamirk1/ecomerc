<?php
require('header.inc.php');
isAdmin();
$categories='';
$header_show='';
$msg='';
if(isset($_GET['id']) && $_GET['id']!=''){
	$id=get_safe_value($con,$_GET['id']);
	$res=mysqli_query($con,"select * from categories where id='$id'");
	$check=mysqli_num_rows($res);
	if($check>0){
		$row=mysqli_fetch_assoc($res);
		$categories=$row['categories'];
		$header_show=$row['header_show'];
	}else{
		redirect('categories.php');
		
	}
}

if(isset($_POST['submit'])){
	$categories=get_safe_value($con,$_POST['categories']);
	$header_show=get_safe_value($con,$_POST['header_show']);
	$res=mysqli_query($con,"select * from categories where categories='$categories'");
	$check=mysqli_num_rows($res);
	if($check>0){
		if(isset($_GET['id']) && $_GET['id']!=''){
			$getData=mysqli_fetch_assoc($res);
			if($id==$getData['id']){

			}else{
				$msg="Categories already exist";
			}
		}else{
			$msg="Categories already exist";
		}
	}
	
	if($msg==''){
		if(isset($_GET['id']) && $_GET['id']!=''){		
			mysqli_query($con,"update categories set categories='$categories',header_show='$header_show' where id='$id'");
		}else{
			mysqli_query($con,"insert into categories(categories,status,header_show) values('$categories','1','$header_show')");
		}
		redirect('categories.php');
	}
}
?>
<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header"><strong>Categories</strong><small> Form</small></div>
					<form method="post">
					<div class="card-body card-block">
						<div class="form-group">
							<label for="categories" class=" form-control-label">Categories</label>
							<input type="text" name="categories" placeholder="Enter your categories name" class="form-control" required value="<?php echo $categories?>">

							<label for="header_show" class=" form-control-label">Header Show</label>
							<input type="text" name="header_show" placeholder="Enter your header show" class="form-control" required value="<?php echo $header_show?>">
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