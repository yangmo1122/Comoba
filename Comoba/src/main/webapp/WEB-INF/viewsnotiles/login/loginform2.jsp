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
		
	}); // end of $("#myCheckbox").click();-----------------------
	
	//페북 로그인
	function statusChangeCallback(response) {
	  console.log('statusChangeCallback');
	  console.log(response);

	  if (response.status === 'connected') {
	    // Logged into your app and Facebook.
	    facebookLoginAPI();
	  } else if (response.status === 'not_authorized') {
	    // The person is logged into Facebook, but not your app.
	    document.getElementById('status').innerHTML = 'Please log ' +
	      'into this app.';
	  } else {
	    // The person is not logged into Facebook, so we're not sure if
	    // they are logged into this app or not.
	    document.getElementById('status').innerHTML = 'Please log ' +
	      'into Facebook.';
	  }
	}

	function checkLoginState() {
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });
	}

	window.fbAsyncInit = function() {
	FB.init({
	  appId      : '627341004142761',
	  cookie     : true,  // enable cookies to allow the server to access
	                      // the session
	  xfbml      : true,  // parse social plugins on this page
	  version    : 'v2.5' // use graph api version 2.5
	});

	// 주석 풀면 자동 로그인 해버림
	FB.getLoginStatus(function(response) {
	   statusChangeCallback(response);
	});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function testAPI() {
	  console.log('Welcome!  Fetching your information.... ');
	  FB.api('/me', function(response) {
	    console.log('Successful login for: ' + response.name);
	    document.getElementById('status').innerHTML =
	      'Thanks for logging in, ' + response.name + '!';
	  });
	}

	function facebookLoginAPI() {
	  alert('fff');
	  FB.api('/me?locale=en_US&fields=name,email', function(response) {
	  console.log(JSON.stringify(response));
	  alert('ddd');

	    $.ajax({
	        url: "/main/loginEnd.action",
	        type: 'POST',
	        dataType: 'json',
	        async: true,
	        data: {
	                "member_id":response.email,
	                "member_name":response.name,
	              },
	        success: function(dom){
	          if(dom =='0'){ // join
	            alert("실패하였습니다.");
	          }else if(dom =='1'){ // login
	            location.href="<%=request.getContextPath()%>/intro.action";
	          }
	        }
	      });
	  });
	}

	function facebookLoginAction(member_id) {
	  console.log(member_id);
	  $.ajax({
	      url: "/main/loginEnd.action",
	      type: 'POST',
	      dataType: 'json',
	      async: true,
	      data: {
	              "member_id" : member_id
	            },
	      success: function(dom){
	        console.log(dom);
	        if(dom =="0"){
	          alert('로그인에 실패 하였습니다.\n 다시 시도해주세요.');
	        }else if(dom =="1"){
	      	alert('로그인에 성공하였습니다.');
	          location.href="<%=request.getContextPath()%>/intro.action";
	        }
	      }
	    });
	}

	function facebookJoinAction(email,name) {
	  $.ajax({
	      url: "/main/loginEnd.action",
	      type: 'POST',
	      dataType: 'json',
	      async: false,
	      data: {
	              "member_id":email,
	              "member_name":name
	            },
	      success: function(dom){

	        if(dom =="0"){
	          alert('로그인에 실패 하였습니다.\n 다시 시도해주세요.');
	        }else if(dom =="1"){
	          alert('로그인에 성공하였습니다.');
	          location.href="/main"
	        }
	      }
	    });
	}

	function facebookLogout () {
	  FB.logout(function() {
	    alert('로그아웃');
	  });
	}

	
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



