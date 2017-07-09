<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript"vsrc="<%=request.getContextPath()%>/resources/BootStrapStudy/js/bootstrap.js"></script>

<!--Common plugins-->
<script src="<%=request.getContextPath()%>/resources/assets/plugins/jquery/dist/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/hoe-nav/hoe.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/pace/pace.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/app.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.knob.js"></script>

<head>

<style type="text/css">

.circle {
	width: 170px;
	height: 170px;
	display: inline-block;
	vertical-align: middle;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-ms-border-radius: 50%;
	border-radius: 50%;
	background-color: darkyellow;
}

.circle1 {
	width: 170px;
	height: 170px;
	display: inline-block;
	vertical-align: middle;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-ms-border-radius: 50%;
	border-radius: 50%;
	background-color: pink;
}

.circle2 {
	width: 170px;
	height: 170px;
	display: inline-block;
	vertical-align: middle;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-ms-border-radius: 50%;
	border-radius: 50%;
	background-color: grey;
}
</style>

<script type="text/javascript">

    $(function() {
        $(".knob").knob();
     });
    
    function checkattandance(){
    
    	if(${date} >= 1){
    		
    		alert("이미 오늘 출책을 하셨습니다.");
    		
    	}else {
	     	attandanceFrm.action = "/main/attandance.action";
	    	attandanceFrm.method = "post";
	    	attandanceFrm.submit(); 
		 }
    }
    
</script>

</head>
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
<form name="attandanceFrm">
	<div class="divide30"></div>
	<div class="container" >
		
		  <input type="hidden" id="year"  name="year" value="안녕" />
		  <input type="hidden" id="month" name="month" />
		  <input type="hidden" id="day"   name="day" />
			
		  <div class="ui-buttons" style="float:center;" >
				<button type="button" class="btn btn-primary" onClick="checkattandance();" >출석하기</button>
		  </div>	
	
	      <div style="float:left;width:300px;height:320px;padding:20px; margin-left:150px;" >
	           <c:if test="${remaindate != null && not empty remaindate}">
	           		<input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="${remaindate}일">	           		
	           </c:if>
	           
	           <c:if test="${remaindate == null || empty remaindate}">
	           		<input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="0일">	           		
	           </c:if>
	           
	           <button type="button" class="btn-lg" style="margin-left: 50px;" >D-DAY</button>
	      </div>
	      
	      <div style="float:left;width:300px;height:320px;padding:20px">
	      	
	      	<c:if test="${attandedno != null && not empty attandedno}">
	           <input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="${attandedno}일">
	        </c:if> 
	        
	      	<c:if test="${attandedno == null || empty attandedno}">
	           <input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="0일">
	        </c:if>  	          
	        
	           <button type="button" class="btn-lg" style="margin-left: 50px;" >출석 현황</button>
	      </div>
	      
	      <div style="float:left;width:300px;height:320px;padding:20px">
	           
	        <c:if test="${missionrate > 0 && not empty missionrate}">   
	           <input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="${missionrate}%">
	        </c:if>
	        
   	        <c:if test="${missionrate <= 0 && empty missionrate}">   
	           <input class="knob" data-fgColor="chartreuse" data-thickness=".3" data-readOnly=true value="0%">
	        </c:if>
	        
	           <button type="button" class="btn-lg" style="margin-left: 50px;" >미션 현황</button>
	      </div>
	</div>
      
</form>
	   <div class="divide30"></div>
<form>
	<div class="container" align="center">
		<div class="row">
		<div class="ui-buttons" >
			<button type="button" class="btn btn-primary rounded">Follower</button>
		</div>		

		<div class="divide30"></div>

		<div class="col-md-6">
			<div class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">출석율 랭킹</h2>
				</header>
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>랭크</th>
								<th>이름</th>
								<th>출석률</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${attandanceList != null && not empty attandanceList}">
							<c:forEach var="list" items="${attandanceList}" varStatus="status">
								<tr>
									<th scope="row">${list.RANK}</th>
									<td>${list.NAME_FK}</td>
									<td>${list.ATTANDANCERATE}</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<!--col end-->

		<div class="col-md-6">
			<div class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">미션 달성율 랭킹</h2>
				</header>
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>랭크</th>
								<th>이름</th>
								<th>미션 달성률</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${missionrateList != null && not empty missionrateList}">
								<c:forEach var="list" items="${missionrateList}" varStatus="status">
									<tr>
										<th scope="row">${list.RANK}</th>
										<td>${list.NICKNAME}</td>
										<td>${list.MISSIONRATE}</td>
									</tr>
								</c:forEach>
							</c:if>					
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<!--col end-->
		</div>
	</div>
	<!--container end-->
</form>
</c:if>
</body>
</html>
