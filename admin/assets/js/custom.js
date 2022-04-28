
    var attr_count=1;
    function add_more_attr(){
        attr_count++;
        
        var size_html=jQuery('#attr_1 #size_id').html();
        size_html=size_html.replace('selected','');
        
        var color_html=jQuery('#attr_1 #color_id').html();
        color_html=color_html.replace('selected','');
        
        var html='<div class="row mt20" id="attr_'+attr_count+'"> <div class="col-lg-2"><label for="categories" class=" form-control-label">MRP</label><input type="text" name="mrp[]" placeholder="MRP" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Price</label><input type="text" name="price[]" placeholder="Price" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Qty</label><input type="text" name="qty[]" placeholder="Qty" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Size</label><select class="form-control" id="size_id" name="size_id[]">'+size_html+'</select> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Color</label><select class="form-control" id="color_id" name="color_id[]">'+color_html+'</select> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">&nbsp;</label><button id="" type="button" class="btn btn-lg btn-danger btn-block" onclick=remove_attr("'+attr_count+'")><span id="payment-button-amount">Remove</span></button> </div><input type="hidden" name="attr_id[]" value=""/></div>';
        jQuery('#product_attr_box').append(html);
    }
function remove_attr(attr_count){
    jQuery('#attr_'+attr_count+).remove();
}