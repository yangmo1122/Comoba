<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	$(document).ready(function(){
		
		var mthd = "${method}";
		
		if(mthd == "POST") {
			$("#pwd").val("${pwd}");
			$("#pwd2").val("${pwd2}");
		}
		
		
		$("#btnUpdate").click(function(event){
			
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			
			var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
    		// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
    		
			var bool = pattern.test(pwd);
    		
    		if(!bool) {
    			alert("암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합되어야 합니다.");
    			$("#pwd").val("");
    			$("#pwd2").val("");
    			$("#pwd").focus();
    			
    			event.preventDefault();
    			return;
    		}
    		else if(pwd != pwd2) {
    			alert("암호가 일치하지 않습니다.");
    			$("#pwd").val("");
    			$("#pwd2").val("");
    			$("#pwd").focus();
    			
    			event.preventDefault();
    			return;
    		}
    		else {
    			var pwdConfirmFrm = document.pwdConfirmFrm;
    			pwdConfirmFrm.action = "/main/pwdConfirm.action";
    			pwdConfirmFrm.method = "POST";
    			pwdConfirmFrm.submit();
    		}
			
		});
		
	});

</script>

<form name="pwdConfirmFrm">
	<div>
	<input type="text" name="nickname" value="${session.loginuser.nickname}" readonly />
	</div>
	
	<div id="div_pwd" align="center">
		<span style="color: blue; font-size: 12pt;">새암호</span><br/>
		<input type="password" id="pwd" name="pwd" size="15" placeholder="PASSWORD" required /> 
	</div>
	
	<div id="div_pwd2" align="center">
		<span style="color: blue; font-size: 12pt;">새암호확인</span><br/>
		<input type="password" id="pwd2" name="pwd2" size="15" placeholder="PASSWORD" required /> 
	</div>
		
	<c:if test="${method.equals('POST') && n==1}">
		<div id="div_confirmResult" align="center">
			 ${session.loginuser.nickname} 님의 암호가 새로이 변경되었습니다.<br/>
		</div>
	</c:if>
	
	<c:if test="${method.equals('GET')}">
		<div id="div_btnUpdate" align="center">
			<button type="button" class="btn btn-success" id="btnUpdate">암호변경하기</button> 
		</div>
	</c:if>

</form>





