<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #38.  tiles 중 sideinfo 페이지 만들기 ===== --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	${demo.css}
	
	#sm_back{

		
	}
	.sm_body{
	min-height:auto;
			background-size:cover;
			background-position:center;
			background-image:url('<%= request.getContextPath() %>/resources/img/sm/index.jpeg');
			color:#fff
	}
</style>

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script>
  
  
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/highcharts.js"></script>        <!-- 차트그리기 --> 
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modules/data.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modules/drilldown.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		loopshowNowTime();
	
	}); // end of ready(); ---------------------------------

	function showNowTime() {
		
		var now = new Date();
	
		var strNow = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		
		var hour = "";
		if(now.getHours() > 12) {
			hour = " 오후 " + (now.getHours() - 12);
		} else if(now.getHours() < 12) {
			hour = " 오전 " + now.getHours();
		} else {
			hour = " 정오 " + now.getHours();
		}
		
		var minute = "";
		if(now.getMinutes() < 10) {
			minute = "0"+now.getMinutes();
		} else {
			minute = ""+now.getMinutes();
		}
		
		var second = "";
		if(now.getSeconds() < 10) {
			second = "0"+now.getSeconds();
		} else {
			second = ""+now.getSeconds();
		}
		
		strNow += hour + ":" + minute + ":" + second;
		
		$("#clock").html("<span style='color:green; font-weight:bold;'>"+strNow+"</span>");
	
	}// end of function showNowTime() -----------------------------


	function loopshowNowTime() {
		showNowTime();
		
		var timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		
		setTimeout(function() {
						loopshowNowTime();	
					}, timejugi);
		
	}// end of loopshowNowTime() --------------------------
	
</script>


<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#btnINTRO").click(function(event){
    		 

 			 document.IntroFrm.action = "/main/intro.action";
 			 document.IntroFrm.method = "get";
 			 document.IntroFrm.submit();
 		}); // end of $("#btnLOGIN").click();-----------------------
 		
 		
 	
    	 
    });  	 

 	
		
</script>


<body id="sm_body" class = "sm_body">

<form name="IntroFrm"  >
<div style="height: 100%; width: auto">
<div  >
<div  style="top: 63%; left:55%; position: absolute; ">
<div style=" vertical-align: middle; text-align: center;">
	현재시각 :&nbsp; 
	<div id="clock" style="display:inline;"></div>
	<br><br>
	<button  type="button" class="btn btn-theme-bg" id="btnINTRO" style="font-size: 13pt;">공쓰로 가기</button>
	
	
</div>
</div>
</div>
</div>
</form>

</body>
	
	</html>
	
	