<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/BootStrapStudy/js/bootstrap.js"></script>
<!--Common plugins-->
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/jquery/dist/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/pace/pace.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/app.js"></script>

<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--side menu plugin-->
<link href="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.css" rel="stylesheet">
<!-- icons-->
<link href="<%=request.getContextPath()%>/resources/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/plugins/iCheck/custom.css" rel="stylesheet">
<!--template custom css file-->
<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
<script src="assets/js/modernizr.js"></script>

<script>

</script>

<script type="text/javascript">

$(document).ready(function(){

	$("#pwd").keydown(function(event){
						
		if(event.keyCode == 13){
			
			if(${sessionScope.loginuser != null}){
	  			 alert("이미 로그인을 하신 상태 입니다 !!");
				 $("#email").val(""); 
				 $("#pwd").val("");
				 $("#email").focus();
				 event.preventDefault();
				 return; 
	  		}
			
			var email = $("#email").val(); 
			var pwd = $("#pwd").val(); 
						
			if(email.trim()=="") {
				alert("이메일를 입력하세요!!");
				$("#email").val(""); 
				$("#email").focus();
				event.preventDefault();
				return;
			}else{
				var pattern = new RegExp(/^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g);
				var bool = pattern.test(email);
				
				if (!bool) {
					alert("이메일 형식에 맞게 입력하세요!!");
					$("#email").val("");
					$("#email").focus();

					event.preventDefault();
					return;
				}	
			}
			
			if(pwd.trim()=="") {
				alert("비밀번호를 입력하세요!!");
				$("#pwd").val(""); 
				$("#pwd").focus();
				event.preventDefault();
				return;
			}else{
				var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
				var bool = pattern.test(pwd);					
				
				if (!bool) {
					alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
					$("#pwd").val("");
					$("#pwd").focus();

					event.preventDefault();
					return;
				}	
			}
		
			if(!$("#myCheckbox").is(":checked")) {  
				event.preventDefault(); 
			}
			else {			
				loginFrm.action="/main/loginEnd.action";
				loginFrm.method="post";
				loginFrm.submit();
			}
	 	}
		
	}); // end of $("#btnlogin").keydown();-----------------------
	
	$("#btnlogin").click(function(event){
				
		if(${sessionScope.loginuser != null}){
 			 alert("이미 로그인을 하신 상태 입니다 !!");
			 $("#email").val(""); 
			 $("#pwd").val("");
			 $("#email").focus();
			 event.preventDefault();
			 return; 
 		}
		
		var email = $("#email").val(); 
		var pwd = $("#pwd").val(); 
					
		if(email.trim()=="") {
			alert("이메일를 입력하세요!!");
			$("#email").val(""); 
			$("#email").focus();
			event.preventDefault();
			return;
		}else{
			var pattern = new RegExp(/^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g);
			var bool = pattern.test(email);
			
			if (!bool) {
				alert("이메일 형식에 맞게 입력하세요!!");
				$("#email").val("");
				$("#email").focus();

				event.preventDefault();
				return;
			}	
		}
/* 		
		if(pwd.trim()=="") {
			alert("비밀번호를 입력하세요!!");
			$("#pwd").val(""); 
			$("#pwd").focus();
			event.preventDefault();
			return;
		}else{
			var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			var bool = pattern.test(pwd);					
			
			if (!bool) {
				alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
				$("#pwd").val("");
				$("#pwd").focus();

				event.preventDefault();
				return;
			}	
		}
*/
		if(!$("#myCheckbox").is(":checked")) {  
			event.preventDefault(); 
		}
		else {			
			loginFrm.action="/main/loginEnd.action";
			loginFrm.method="post";
			loginFrm.submit();
		}
		
	}); // end of $("#myCheckbox").click();----------------------
	
}); // end of $(document).ready()-------------------

</script>

<body>
	<div class="page-center">
		<div class="page-center-in">
			<form class="sign-box" name="loginFrm">
				
				<div class="sign-avatar">
					<img width="120px;" height="120px;" src="<%=request.getContextPath()%>/resources/img/logo.jpg" alt="" class="img-circle">
				</div>
				
				<header class="sign-title">Sign In</header>
				
				<!-- 이메일 -->
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
					<input type="email" id="email" name="email" class="form-control" placeholder="example123@email.com">
				</div>
				<br />

				<!-- 암호 -->
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password">
				</div>
				<br />

				<div class="form-group clearfix">
					<div class="checkbox pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"id="myCheckbox">
					<label for="myCheckbox">Remember Me</label>
					</div>
					<div class="pull-right">
						<p>
							<a href="/main/findpwd.action"><i class="fa fa-lock">비밀번호 찾기</i></a>
						</p>
					</div>
				</div>
	
				<!-- 로그인버튼 -->
				<button type="button" id="btnlogin" class="btn btn-success rounded btn-lg">Sign in</button>
				<br/>
	
				<div>
					<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
					</fb:login-button>
				</div>
				
				<div id="status">
				</div>
				
				<p>
				<a href="/main/register.action">회원이 아니신가요?</a>
				</p>
			</form>
		</div>
		<!--page center in-->
	</div>
	<!--page center-->
		
</body>
</html>



