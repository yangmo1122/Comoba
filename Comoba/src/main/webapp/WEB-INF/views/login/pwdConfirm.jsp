<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<!-- Bootstrap -->
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--side menu plugin-->
<link href="assets/plugins/hoe-nav/hoe.css" rel="stylesheet">
<!-- icons-->
<link href="assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!--template custom css file-->
<link href="assets/css/style.css" rel="stylesheet">
<!--Common plugins-->
<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/hoe-nav/hoe.js"></script>
<script src="assets/plugins/pace/pace.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/modernizr.js"></script>
</head>
<style type="text/css">
#div_email {
	width: 70%;
	height: 15%;
	margin-bottom: 5%;
	margin-left: 10%;
	position: relative;
}

#div_findResult {
	width: 70%;
	height: 15%;
	margin-bottom: 5%;
	margin-left: 10%;
	position: relative;
}

#div_btnFind {
	width: 70%;
	height: 15%;
	margin-bottom: 5%;
	margin-left: 10%;
	position: relative;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$(".werror").hide(); 	// 에러창
		
		var mthd = "${method}";
	
		if (mthd == "POST") {
			$("#pwd").val("${email}");
			$("#pwd").val("${pwd}");
			$("#pwd2").val("${pwd2}");
		}
	
		$("#btnconfirm").click(function(event) {
	
			var email = $("#email").val();
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
						
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
			} else {
				var pwdConfirmFrm = document.pwdConfirmFrm;
				pwdConfirmFrm.action = "/main/changepwd.action";
				pwdConfirmFrm.method = "POST";
				pwdConfirmFrm.submit();
			}
	
		});
		
		$("#pwd2").keydown(function(event){
			
			if(event.keyCode == 13){

				var email = $("#email").val();
				var pwd = $("#pwd").val();
				var pwd2 = $("#pwd2").val();
							
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
				} else {
					var pwdConfirmFrm = document.pwdConfirmFrm;
					pwdConfirmFrm.action = "/main/changepwd.action";
					pwdConfirmFrm.method = "POST";
					pwdConfirmFrm.submit();
				}
		  	}
		}); // end of $("#btnreg").keydown();-----------------------
	
	});
</script>

<body>
	<div class="page-center">
		<div class="page-center-in">
			<form class="sign-box" name="pwdConfirmFrm">
				<div class="page-center">
					<div class="page-center-in">
						<h4>암호 변경</h4>

						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input type="email" id="email" name="email" class="form-control" value="${email}" readonly>
						</div>
						<br/>
						
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

						<button type="button" id="btnconfirm" class="btn btn-success rounded btn-lg">암호변경</button>
						<br />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
