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

<script type="text/javascript">

	$(document).ready(function(){
		
$("#pwd").keydown(function(event){
 			
 			if(event.keyCode == 13){ // 엔터를 했을 경우
 			
 			var name = $("#name").val(); 
 			var tel = $("#tel").val(); 
 			var address = $("#address").val();
 			
 			if(name.trim()=="") {
 				$("#name").val(""); 
 				$("#name").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			if(tel.trim()=="") {
 				$("#tel").val(""); 
 				$("#tel").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			if(address.trim()=="") {
 				$("#address").val(""); 
 				$("#address").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			document.addFrm.action = "/main/adduserdetail2.action";
 			document.addFrm.method = "post";
 			document.addFrm.submit();
 			
 			}
 		}); // end of $("#pwd").keydown();-----------------------
		

	}); // end of $(document).ready()----------
		
</script>

<body>

	<div class="page-center">
		<div class="page-center-in">
			<form class="sign-box" name="addFrm" >
				
				<header class="sign-title">회원정보추가</header>
				
				<div class="input-group">
				  <span class="input-group-addon">성명</span>
				</div>
				
				<div class="input-group">
					<input type="text" id="name" name="name" size="50" maxlength="50"/>
				</div>
				<br/>
				
				<div class="input-group">
				  <span class="input-group-addon">연락처</span>
				</div>
				
				<div class="input-group">
					<input type="text" id="tel" name="tel" size="50" maxlength="50" />
				</div>
				<br/>
				
				<div class="input-group">
				  <span class="input-group-addon">주소</span>
				</div>
				
				<div class="input-group">
				  <input type="text" id="address" name="address" size="50" maxlength="100" />			 
				</div>
				<br/>
						
				<button type="submit"  id="btnadd" class="btn btn-success rounded btn-lg">회원정보추가</button>
				<br/>		
			</form>
		</div>
		<!--page center in-->
	</div>
	<!--page center-->

</body>
</html>
