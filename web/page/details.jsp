<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${base }/rs/css/style.css" />
	<link rel="stylesheet" href="${base }/rs/css/lightbox.css" type="text/css" media="screen" />
	
	<script src="${base }/rs/js/prototype.js" type="text/javascript"></script>
	<script src="${base }/rs/js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="${base }/rs/js/lightbox.js" type="text/javascript"></script>
    <script src="${base }/rs/js/java.js" type="text/javascript"></script>
</head>
<body>
<div id="wrap">
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="firstPage.jsp">home</a> &gt;&gt; product name
            </div>
            <div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /></span>Product name</div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="#"><img src="${base}/rs/images/pet/prod1.gif" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="${base}/rs/images/pet/big_pic.gif" rel="lightbox"><img src="${base}/rs/images/pet/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">Details</div>
                    <p class="details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.<br />
                   Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.                    </p>
                    <div class="price"><strong>PRICE:</strong> <span class="red">100 $</span></div>
                    <div class="price"><strong>COLORS:</strong> 
                    <span class="colors"><img src="${base}/rs/images/pet/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="${base}/rs/images/pet/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="${base}/rs/images/pet/color3.gif" alt="" title="" border="0" /></span>                    </div>
                    <a href="details.jsp" class="more"><img src="${base}/rs/images/pet/order_now.gif" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
              
            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">More details</a></li>
                <li><a class="" href="#tab2">Related books</a></li>
                </ul>
    
            <div class="tabs-container">
            
                    <div style="display: block;" class="tab" id="tab1">
                                        <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                        </p>
                            <ul class="list">
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>                                          
                            </ul>
                                         <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                        </p>                           
                    </div>	
                    
                            <div style="display: none;" class="tab" id="tab2">
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>    

                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <a href="#"><img src="${base}/rs/images/pet/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>  


                   
                    <div class="clear"></div>
                            </div>	
            
            </div>


			</div>
            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        
                	<div class="languages_box">
            <span class="red">Languages:</span>
            <a href="#"><img src="${base}/rs/images/pet/gb.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${base}/rs/images/pet/fr.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${base}/rs/images/pet/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="#">GBP</a>
                <a href="#">EUR</a>
                <a href="#"><strong>USD</strong></a>
                </div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="cart.jsp" class="view_cart">view cart</a>
              
              </div>
        
             <div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet3.gif" alt="" title="" /></span>About Our Shop</div> 
             <div class="about">
             <p>
             <img src="${base}/rs/images/pet/about.gif" alt="" title="" class="right" />
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${base}/rs/images/pet/promo_icon.gif" alt="" title="" /></span>
                        <a href="#"><img src="${base}/rs/images/pet/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${base}/rs/images/pet/promo_icon.gif" alt="" title="" /></span>
                        <a href="#"><img src="${base}/rs/images/pet/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="#">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${base}/rs/images/pet/promo_icon.gif" alt="" title="" /></span>
                        <a href="#"><img src="${base}/rs/images/pet/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>               
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#"> gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#"> gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#"> gifts</a></li>
                <li><a href="#">specials</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#"> gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#"> gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>                              
                </ul>      
             
             </div>         
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              

</div>

</body>
<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>
</html>