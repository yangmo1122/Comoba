<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
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

.werror { color : red;}

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
			    $("#btnEdit").attr('disabled', true);
			    
			    $(this).focus();
			}
			else{ 
                $(this).next().hide(); 
                $(":input").attr('disabled', false); 
			    $("#btnEdit").attr('disabled', false);
			}
			
		});
		
	}); //$(".form-control").each()----------
	
	$("#comments").keydown(function(event){
						
		if(event.keyCode == 13){
						
			var memberno = $("#memberno").val();
			var nickname = $("#nickname").val();
			var email = $("#email").val();
			var pwd = $("#pwd").val(); 
			var pwd2 = $("#pwd2").val();
			var comments = $("#comments").val();

			var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			var bool = pattern.test(pwd);
			
			if(memberno.trim()=="") {
				alert("이메일을 입력하세요!!");
				$("#memberno").val(""); 
				$("#memberno").focus();
				event.preventDefault();
				return;
			}
			
			if(email.trim()=="") {
				alert("이름을 입력하세요!!");
				$("#email").val(""); 
				$("#email").focus();
				event.preventDefault();
				return;
			}
			
			if(nickname.trim()=="") {
				alert("이름을 입력하세요!!");
				$("#nickname").val(""); 
				$("#nickname").focus();
				event.preventDefault();
				return;
			}
			
			if(comments.trim()=="") {
				alert("비밀번호를 입력하세요!!");
				$("#comments").val(""); 
				$("#comments").focus();
				event.preventDefault();
				return;
			}
			
	 		$("#orgFilename1").change(function(event){
	 			var tmppath=URL.createObjectURL(event.target.files[0]);
	 			$("#orgFilename").attr('src',tmppath);
	 		});

			
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
				
			}else {
			
			editFrm.action="/main/edituser.action";
			editFrm.method="post";
			editFrm.submit();
		 	alert("회원수정완료");
			
		 	userimage(memberno, thumbnailFileName);
			}
		}
		
	}); // end of $("#btnEdit").keydown();-----------------------
	
 	$("#btnEdit").click(function(event){
					
		var memberno = $("#memberno").val();
		var nickname = $("#nickname").val();
		var email = $("#email").val();
		var pwd = $("#pwd").val(); 
		var pwd2 = $("#pwd2").val();
		var comments = $("#comments").val();

		var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
		var bool = pattern.test(pwd);
		
		if(memberno.trim()=="") {
			alert("이메일을 입력하세요!!");
			$("#memberno").val(""); 
			$("#memberno").focus();
			event.preventDefault();
			return;
		}
		
		if(email.trim()=="") {
			alert("이름을 입력하세요!!");
			$("#email").val(""); 
			$("#email").focus();
			event.preventDefault();
			return;
		}
		
		if(nickname.trim()=="") {
			alert("이름을 입력하세요!!");
			$("#nickname").val(""); 
			$("#nickname").focus();
			event.preventDefault();
			return;
		}
		
		if(comments.trim()=="") {
			alert("비밀번호를 입력하세요!!");
			$("#comments").val(""); 
			$("#comments").focus();
			event.preventDefault();
			return;
		}
		
 		$("#orgFilename1").change(function(event){
 			var tmppath=URL.createObjectURL(event.target.files[0]);
 			$("#orgFilename").attr('src',tmppath);
 		});


		if(pwd.trim()=="") {
			alert("이름을 입력하세요!!");
			$("#pwd").val(""); 
			$("#pwd").focus();
			event.preventDefault();
			return;
		}
 		
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
			
		}else {
		
		editFrm.action="/main/edituser.action";
		editFrm.method="post";
		editFrm.submit();
	 	alert("회원수정완료");
		
	 	userimage(memberno, thumbnailFileName);
		}
	 	
	}); // end of $("#btnEdit").click();-----------------------

}); // end of $(document).ready()-------------------

function userimage(memberno, thumbnailFileName) {
	
	form_data = {memberno : memberno,
		     thumbnailFileName : thumbnailFileName};

	$.ajax({ 
		url : "/main/getuserimage.action", 	
		type : "GET",
		data : form_data,  
		dataType : "JSON",  // 응답은 JSON 타입으로 받아라.
		success: function(data) { // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
				// data 는 ajax 요청에 의해 url 페이지 getLargeImgFilename.action 으로 부터 리턴받은 데이터
		   			   
			   $("#thumbnailFileName").empty();
			   // <div id="largeImg"> 엘리먼트를 모두 비워서 새로운 데이터를 받을수 있게 해라
			   
			   var html = "";
			   html += "<img src=\"/main/resources/files/"+data.userimage+"\" "+"width='128' height='128' />";    
		   
	  	   	   $("#thumbnailFileName").html(html);   
				
			}, // end of success: function(data) ---------------------
			
			error: function(request, status, error){
		      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		  } // end of error: function(request,status,error)	
		  
	});
  
}

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
			<form class="sign-box" name=editFrm enctype="multipart/form-data">
				
				<div class="sign-avatar">
					<c:if test="${thumbnailFileName == null}">
							<img width="128px;" height="128px" src="<%= request.getContextPath() %>/resources/img/cute.jpg" alt="" class="img-circle short"/>					
					</c:if>
				</div>
				
				<div class="sign-avatar">
					<c:if test="${thumbnailFileName != null}">
							<img width="128px;" height="128px" src="<%=request.getContextPath()%>/resources/files/${thumbnailFileName}" alt="" class="img-circle short"/>					
					</c:if>
				</div>
				
				<header class="sign-title">회원정보수정</header>
				
				<div class="input-group">
					<span class="input-group-addon" style="font-weight: bold;"><img  width="14px;" height="14px" src="<%=request.getContextPath()%>/resources/images/pic.png" alt=""/></span>
					<input type="file" name="attach" />	
				</div>
				<br/>
  			
				<div class="input-group">
					<span class="input-group-addon" style="font-weight: bold;">No</span>
					<input type="text" id="memberno" name="memberno" value="${sessionScope.loginuser.memberno}" class="form-control" readonly>
				</div>
				<br/>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
					<input type="email" id="email" name="email" value="${sessionScope.loginuser.email}"  class="form-control" placeholder="example123@naver.com" readonly>
				</div>
				<br/>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span>
					<input type="text" id="nickname" name="nickname" value="${sessionScope.loginuser.nickname}" class="form-control" placeholder="Nickname" required>
					<span class="werror">NickName은 필수 입력사항 입니다.</span>
				</div>
				<br/>
								
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="pwd" name="pwd"    class="form-control" placeholder="비밀번호" required>
              		<span class="werror">비밀번호는 숫자, 특수문자, 영문자가 섞인 8-15자로 입력해주세요</span>
				</div>
				<br/>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="pwd2" name="pwd2" class="form-control"	placeholder="PASSWORD" required>
				</div>
				<br />
				
				<div class="input-group">
					<span class="input-group-addon">Comments</span>					
				</div>
				
				<div class="input-group">
					<input type="text" id="comments" name="comments" value="${sessionScope.loginuser.comments}" class="form-control"  size="50" maxlength="100" required />
					<span class="werror">메세지를 입력해주세요</span>
				</div>
				<br/>
				
				<button type="button"  id="btnEdit" class="btn btn-success rounded btn-lg">수정</button>
				<br/>		
			</form>
		</div>
		<!--page center in-->
	</div>
	<!--page center-->
</c:if>
</body>
</html>
