<?php 
require('header.php');
if(!isset($_SESSION['USER_LOGIN'])){
    ?>
    <script>
        window.location.href='index.php';
    </script>
    <?php
}
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
                                <span class="breadcrumb-item active">Profile</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="htc__contact__area ptb--100 bg__white">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="contact-form-wrap mt--60">
                        <div class="col-xs-12">
                            <div class="contact-title">
                                <h2 class="title__line--6">Update Name</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <form id="login-form" method="post">
                                <div class="single-contact-form">
                                    <div class="contact-box name">
                                        <input type="text" name="name" id="name" placeholder="Your Name*" style="width:100%" value="<?php echo $_SESSION['USER_NAME']?>">
                                    </div>
                                    <span class="field_error" id="name_error"></span>
                                </div>
                                
                                
                                <div class="contact-btn">
                                    <button type="button" class="fv-btn" onclick="update_profile()" id="btn_submit">Update</button>
                                </div>
                            </form>
                           
                        </div>
                    </div> 
            
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="contact-form-wrap mt--60">
                        <div class="col-xs-12">
                            <div class="contact-title">
                                <h2 class="title__line--6">Update Password</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <form method="post" id=frmPassword>
                                <div class="single-contact-form">
                                <label class="password_label">Current Password</label>
                                    <div class="contact-box name">
                                        <input type="password" name="current_password" id="current_password" style="width:100%">
                                    </div>
                                    <span class="field_error" id="current_password_error"></span>
                                </div>
                                <div class="single-contact-form">
                                <label class="password_label">New Password</label>
                                    <div class="contact-box name">
                                        <input type="password" name="new_password" id="new_password" style="width:100%">
                                    </div>
                                    <span class="field_error" id="new_password_error"></span>
                                </div>
                                <div class="single-contact-form">
                                    <label class="password_label">Confirm Password</label>
                                    <div class="contact-box name">
                                        <input type="password" name="confirm_password" id="confirm_password" style="width:100%">
                                    </div>
                                    <span class="field_error" id="confirm_password_error"></span>
                                </div>
                                
                                
                                <div class="contact-btn">
                                    <button type="button" class="fv-btn" onclick="update_password()" id="btn_update_password">Update</button>
                                </div>
                            </form>
                            <div class="form-output login_msg">
                                <p class="form-messege field_error"></p>
                            </div>
                        </div>
                    </div> 
            
            </div>
        </div>
    </section>
<script>
    function update_profile() {
        jQuery('.field_error').html('');
        var name=jQuery('#name').val();
        if(name==''){
            jQuery('#name_error').html('Please Enter Your Name');
        }else{
            jQuery('#btn_submit').html('Please Wait...');
            jQuery('#btn_submit').attr('disabled',true);
            jQuery.ajax({
                url:'update_profile.php',
                type:'post',
                data:'name='+name,
                success:function(result){
                    jQuery('#name_error').html(result);
                    jQuery('#btn_submit').html('Update');
                    jQuery('#btn_submit').attr('disabled',false);
                }
            })
        }
    }

    function update_password() {
        jQuery('.field_error').html('');
        var current_password=jQuery('#current_password').val();
        var new_password=jQuery('#new_password').val();
        var confirm_password=jQuery('#confirm_password').val();
        var is_error='';
        if(current_password==''){
            jQuery('#current_password_error').html('Please Enter Your Password');
            var is_error='yes';
        }if(new_password==''){
            jQuery('#new_password_error').html('Please Enter Your New Password');
            var is_error='yes';
        }if(confirm_password==''){
            jQuery('#confirm_password_error').html('Please Enter Your Confirm Password');
            var is_error='yes';
        }

        if(new_password!='' && confirm_password!='' && new_password!=confirm_password){
            jQuery('#confirm_password_error').html('Please Enter Same Password');
            var is_error='yes';
        }

        if(is_error==''){
            jQuery('#btn_update_password').html('Please Wait...');
            jQuery('#btn_update_password').attr('disabled',true);
            jQuery.ajax({
                url:'update_password.php',
                type:'post',
                data:'current_password='+current_password+'&new_password='+new_password,
                success:function(result){
                    jQuery('#current_password_error').html(result);
                    jQuery('#btn_update_password').html('Update');
                    jQuery('#btn_update_password').attr('disabled',false);
                    jQuery('#frmPassword')[0].reset();
                }
            })
        }
    }
</script>

<?php require('footer.inc.php')?>
        