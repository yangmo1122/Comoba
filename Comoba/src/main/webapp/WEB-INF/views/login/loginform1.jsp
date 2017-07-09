<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
  
<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#btnLOGIN").click(function(event){
    		 
    		 if(${sessionScope.loginuser != null}) {
    			 alert("이미 로그인을 하신 상태 입니다 !!");
 				 $("#userid").val(""); 
 				 $("#pwd").val("");
 				 $("#userid").focus();
 				 event.preventDefault();
 				 return; 
    		 }
 			 
    		 var userid = $("#userid").val(); 
 			 var pwd = $("#pwd").val(); 
 			
 			 if(userid.trim()=="") {
 			 	 alert("아이디를 입력하세요!!");
 				 $("#userid").val(""); 
 				 $("#userid").focus();
 				 event.preventDefault();
 				 return;
 			 }
 			
 			 if(pwd.trim()=="") {
 				 alert("비밀번호를 입력하세요!!");
 				 $("#pwd").val(""); 
 				 $("#pwd").focus();
 				 event.preventDefault();
 				 return;
 			 }

 			 document.loginFrm.action = "/main/loginEnd.action";
 			 document.loginFrm.method = "post";
 			 document.loginFrm.submit();
 		}); // end of $("#btnLOGIN").click();-----------------------
 		
 		
 		$("#pwd").keydown(function(event){
 			
 			if(event.keyCode == 13) { // 엔터를 했을 경우
 			
			if(${sessionScope.loginuser != null}) {
    			 alert("이미 로그인을 하신 상태 입니다 !!");
 				 $("#userid").val(""); 
 				 $("#pwd").val("");
 				 $("#userid").focus();
 				 event.preventDefault();
 				 return; 
    		 }	
 				
 			var userid = $("#userid").val(); 
 			var pwd = $("#pwd").val(); 
 			
 			if(userid.trim()=="") {
 				alert("아이디를 입력하세요!!");
 				$("#userid").val(""); 
 				$("#userid").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			if(pwd.trim()=="") {
 				alert("비밀번호를 입력하세요!!");
 				$("#pwd").val(""); 
 				$("#pwd").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			document.loginFrm.action = "/main/loginEnd.action";
			document.loginFrm.method = "post";
			document.loginFrm.submit();
 			
 			}
 		}); // end of $("#pwd").keydown();-----------------------
    	 
    });  	 

</script>


        <div class="breadcrumb-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>Sign in or Sign up</h4>
                    </div>
                    <div class="col-sm-6 hidden-xs text-right">
                        <ol class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div><!--breadcrumbs-->
        <div class="divide80"></div>
        <div class="container">
            <div class="row">  
                <div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                    <div class="login-form">
                        <h3>Sign In <span>Or Sign Up</span></h3>
                         <form name="loginFrm" role="form">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="text"  class="form-control" id="userid" name="userid" placeholder="example123@email.com">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">암호</label>
                            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
                        </div>                   
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember Me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-theme-bg" id="btnLOGIN">Login</button>
                        <a href="#" class="btn btn-fb-login"><i class="fa fa-facebook"></i> Login With Facebook</a>
                        <a href="#">Forget Password?</a>
                    </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="divide60"></div>
          
       <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>        
        <!--bootstrap js plugin-->
        <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="<%=request.getContextPath() %>/resources/text/javascript" src="js/jquery.sticky.js"></script>
        <!--flex slider plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--parallax background plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.stellar.min.js" type="text/javascript"></script>
        
        
        <!--digit countdown plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/waypoints.min.js"></script>
        <!--digit countdown plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.counterup.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="<%=request.getContextPath() %>/resources/js/wow.min.js" type="text/javascript"></script> 
        <!--owl carousel slider-->
        <script src="<%=request.getContextPath() %>/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <!--popup js-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        
        
        
        <!--customizable plugin edit according to your needs-->
        <script src="<%=request.getContextPath() %>/resources/js/custom.js" type="text/javascript"></script>



    </body>
</html>
