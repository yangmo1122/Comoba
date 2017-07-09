<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

.input-group1{
	text-align: center;
}
</style>

<script type="text/javascript">

/* $(document).ready(function(){
	
	$("#btnedit").click(function(event){
		
		userdetailFrm.action="/main/edituser.action";
		userdetailFrm.method="post";
		userdetailFrm.submit();
		
	});
	
}); */

</script>

<body>

<c:if test="${sessionScope.loginuser == null}">		
	<div style="color: pink; font-weight: bold;"  align="center">로그인을 해주세요.</div>
	<br/>
	
	<p align="center">
		<a href="/main/login.action"><button type="button" id="btnlogin" class="btn btn-success rounded btn-lg">로그인</button></a>
	</p>
	
	<p align="center">
		<a href="/main/register.action">회원이 아니신가요?</a>
	</p>	
</c:if>

<c:if test="${sessionScope.loginuser != null}">
	<div class="page-center">
		<div class="page-center-in">
			<form class="sign-box" name="userdetailFrm">

				<div class="sign-avatar">
					<a href="/main/adduserdetail.action"><img src="<%=request.getContextPath()%>/resources/assets/images/user-add.png" alt="" class="img-circle"></a>
				</div>

				<header class="sign-title">회원 정보</header>

				<div class="input-group">
					<span class="input-group-addon">회원no</span>					
				</div>

				<div class="input-group1">				
					<span>${sessionScope.loginuser.memberno}</span>
				</div>
				
				<div class="input-group">
					<span class="input-group-addon">닉네임</span>					
				</div>
				
				<div class="input-group1">
					<span>${sessionScope.loginuser.nickname}</span>
				</div>

				<div class="input-group">
					<span class="input-group-addon">이메일</span>					
				</div>

				<div class="input-group1">
					<span>${sessionScope.loginuser.email}</span>			
				</div>
				
				
				<div class="input-group">
					<span class="input-group-addon">하고싶은말</span>					
				</div>
				
				<div class="input-group1">
					<span>${sessionScope.loginuser.comments}</span>			
				</div>
				<br/>
				
				<div>
					<a href="/main/edituser.action"><button type="button"  id="btnedit" class="btn btn-success rounded btn-lg">회원정보수정</button></a>
				</div>

			</form>
		</div>
		<!--page center in-->
	</div>
	<!--page center-->
</c:if>	
</body>
</html>
