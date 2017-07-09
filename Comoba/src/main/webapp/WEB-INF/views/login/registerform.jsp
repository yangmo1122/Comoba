<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript"	src="<%=request.getContextPath()%>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/resources/BootStrapStudy/js/bootstrap.js"></script>

<!--Common plugins-->
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/jquery/dist/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/pace/pace.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/app.js"></script>

<style>
.werror {
	color: red;
}

.wcheckdup {
	color: red;
}
</style>

<script type="text/javascript">

		$(document).ready(function(){

			$(".werror").hide(); 	// 에러창
			$(".wcheckdup").hide(); // 비교창
			
			$(".form-control").each(function(){
				
				$(this).blur(function(){
					
					var data = $(this).val().trim();
					
					if(data.length == 0){
						$(this).parent().find(".werror").show();
					    $(":input").attr('disabled', true);
					    $(this).attr('disabled', false);
					    $("#btnreg").attr('disabled', true);
					    
					    $(this).focus();
					}
					else{ 
		                $(this).next().hide(); 
		                $(":input").attr('disabled', false); 
					    $("#btnreg").attr('disabled', false);
					}
					
				});
				
			}); //$(".form-control").each()----------
			
			$("#pwd2").keydown(function(event){
								
				if(event.keyCode == 13){
					
					if(${sessionScope.loginuser != null}){
			  			 alert("이미 로그인을 하신 상태 입니다 !!");
			  			 $("#nickname").val("");
			  			 $("#email").val(""); 
						 $("#pwd").val("");
						 $("#nickname").focus();
						 event.preventDefault();
						 return; 
			  		}
					
					var nickname = $("#nickname").val();
					var email = $("#email").val(); 
					var pwd = $("#pwd").val();
					var pwd2 = $("#pwd2").val();
					
					if(nickname.trim()=="") {
						alert("이름을 입력하세요!!");
						$("#nickname").val(""); 
						$("#nickname").focus();
						event.preventDefault();
						return;
					}
					
					if(email.trim()=="") {
						alert("이메일을 입력하세요!!");
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
						alert("암호를 입력하세요!!");
						$("#pwd").val(""); 
						$("#pwd").focus();
						event.preventDefault();
						return;
					}else {
						
						var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
						var bool = pattern.test(pwd);
						
						if (!bool) {
							alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
							$("#pwd").val("");
							$("#pwd2").val("");
							$("#pwd").focus();

							event.preventDefault();
							return;
							
						} else if (pwd != pwd2) {
							alert("암호가 일치하지 않습니다.");
							$("#pwd").val("");
							$("#pwd2").val("");
							$("#pwd").focus();

							event.preventDefault();
							return;
							
						}
					}
			
					regFrm.action="/main/memberInsert.action";
					regFrm.method="post";
					regFrm.submit();
			 	}
			  
			}); // end of $("#btnreg").keydown();-----------------------
			
			$("#btnreg").click(function(event){
							
				if(${sessionScope.loginuser != null}){
		  			 alert("이미 로그인을 하신 상태 입니다 !!");
		  			 $("#nickname").val("");
		  			 $("#email").val(""); 
					 $("#pwd").val("");
					 $("#nickname").focus();
					 event.preventDefault();
					 return; 
		  		}
				
				var nickname = $("#nickname").val();
				var email = $("#email").val(); 
				var pwd = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
				
				if(nickname.trim()=="") {
					alert("이름을 입력하세요!!");
					$("#nickname").val(""); 
					$("#nickname").focus();
					event.preventDefault();
					return;
				}
				
				if(email.trim()=="") {
					alert("이메일을 입력하세요!!");
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
					alert("암호를 입력하세요!!");
					$("#pwd").val(""); 
					$("#pwd").focus();
					event.preventDefault();
					return;
				}else {
					
					var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
					var bool = pattern.test(pwd);
					
					if (!bool) {
						alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
						$("#pwd").val("");
						$("#pwd2").val("");
						$("#pwd").focus();

						event.preventDefault();
						return;
						
					} else if (pwd != pwd2) {
						alert("암호가 일치하지 않습니다.");
						$("#pwd").val("");
						$("#pwd2").val("");
						$("#pwd").focus();

						event.preventDefault();
						return;
						
					}
				}
		
				regFrm.action="/main/memberInsert.action";
				regFrm.method="post";
				regFrm.submit();

			}); // end of $("#btnreg").click();-----------------------
			
			
		}); // end of $(document).ready()-------------------
		
</script>

<body>

	<div class="page-center">
		<div class="page-center-in">
			<form class="sign-box" name=regFrm enctype="multipart/form-data">

				<div class="sign-avatar">
					<img width="120px;" height="120px;" src="<%=request.getContextPath()%>/resources/img/logo.jpg" alt="" class="img-circle">
				</div>

				<header class="sign-title">회원가입</header>

				<div class="input-group">
					<span class="input-group-addon" style="font-weight: bold;">
					<img width="14px;" height="14px" src="<%=request.getContextPath()%>/resources/images/pic.png" alt="" /></span>
					<input type="file" name="attach" />
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span>
					<input type="text" id="nickname" name="nickname" class="form-control" placeholder="Nickname" required>
					<span class="werror">NickName은 필수 입력사항 입니다.</span> <span class="wcheckdup">이미 사용 중인 NickName 입니다.</span>
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
					<input type="email" id="email" name="email" class="form-control" placeholder="example123@naver.com" required>
					<span class="werror">이메일은 필수 입력사항 입니다.</span>
					<span class="wcheckdup">사용 	중인 email입니다.</span>
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="pwd" name="pwd" class="form-control"	placeholder="PASSWORD" required>
					<span class="werror">비밀번호는 숫자, 특수문자, 영문자가 섞인 8-15자로 입력해주세요</span>
				</div>
				<br />
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="pwd2" name="pwd2" class="form-control"	placeholder="PASSWORD" required>
				</div>
				<br />				

				<button type="button" id="btnreg" class="btn btn-success rounded btn-lg">Register</button>
				<br />
				<p>
					<a href="/main/login.action">회원이신가요?</a>
				</p>
			</form>
		</div>
		<!--page center in-->
	</div>
	<!--page center-->

</body>
</html>
