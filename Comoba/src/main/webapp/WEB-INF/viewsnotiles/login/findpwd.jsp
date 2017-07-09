<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
	<!-- Bootstrap -->
	<link href="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!--side menu plugin-->
	<link href="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.css" rel="stylesheet">
	<!-- icons-->
	<link href="<%=request.getContextPath()%>/resources/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!--template custom css file-->
	<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
	<!--Common plugins-->
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery/dist/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/plugins/pace/pace.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/app.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/modernizr.js"></script>
	
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
		
		var method = "${method}";
		var email = "${email}";
		var n = "${n}";
		var certificationCode = "${certificationCode}";
				
		if(method == "POST" && email != "" ) {
			$("#email").val("${email}");
		}
		
		$("#btnConfirmCode").click(function(){
			var findpwdFrm = document.findpwdFrm;
				findpwdFrm.action = "/main/findpwd.action";
				findpwdFrm.method = "POST";
				findpwdFrm.submit();
		});
		
		if(method=="POST" && n==1){
			$(".page-center-in").hide();
		}
		else if(method=="POST" && (n==-1 || n==0) ) {
			$(".div_findResult").show();
		}
		
		
		$("#btnConfirmCode").click(function(){
					
			var email = "${email}";
						
			if( "${certificationCode}" == $("#input_confirmCode").val() ) {
				alert("인증성공 되었습니다.");
				
				var findpwdFrm = document.findpwdFrm;
					findpwdFrm.action = "/main/pwdConfirm.action";
					findpwdFrm.method = "post";   // 단순하게 폼만 띄워주는 것이므로
					findpwdFrm.submit();
			}
			else {
				alert("인증코드값을 다시 입력하세요.");
				$("#btnConfirmCode").val("");
			}
 
		});		
		
	});

</script>

<body>
<form class="sign-box" name="findpwdFrm" method="post" >
	<div class="page-center">
		<div class="page-center-in">
			<h4>암호 찾기</h4>
			<p>이메일주소를 입력하면 패스워드관련 이메일을 보냅니다.</p>
			<div class="form-group">
				<input type="text" id="email" name="email" class="form-control" placeholder="example123@gmail.com" required>
			</div>
			
			<div id="div_btnFind" align="center">
				<button type="button" id="btnfind" class="btn btn-success rounded btn-lg">찾기</button>
			</div>				
		</div>
		
		<div id="div_findResult" align="center">
			<c:if test="${n == 1}">
				<h4>인증코드 입력</h4>
				<div id="pwdConfirmCodeDiv">
					인증코드가 ${email}로 발송되었습니다.<br/>
					인증코드를 입력해주세요<br/>
					<input type="text" id="input_confirmCode" name="input_confirmCode" required />
					<br/><br/>
					<button type="button" class="btn btn-info" id="btnConfirmCode">인증하기</button>
				</div>
			</c:if>
			
			<c:if test="${n == 0}">
				<span style="color: red;">사용자 정보가 없습니다.</span>
			</c:if>
			
			<c:if test="${n == -1}">
				<span style="color: red;">${sendFailmsg}</span>
			</c:if>		
		</div>	
	</div>
</form>

</body>
</html>
