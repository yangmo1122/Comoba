<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.myborder {
	border: white solid 2px;
}
</style>

</head>
<body>
<div class="divide60"></div>
	<div class="demos" id="demos">
	   <div class="container">
			
			<c:forEach var="todaynum" items="${todayno}" varStatus="status">
				<c:if test="${(todaynum.MAXNUM != null)}">
					<div class="" align="center">
						<h1>오늘의 게시글 <span style="color: red;">${(todaynum.MAXNUM)}</span>개</h1>
					</div>
				</c:if>
				<br/>	
				
				<c:if test="${(todaynum.MAXNUM == null)}">
					<div class="" align="center">
						<h1>오늘의 게시글 <span style="color: red;">0</span>개</h1>
					</div>
				</c:if>			
				<br/>
				
				<c:if test="${(todaynum.MAXNUM == null)}">
					<div class="" align="center">
						<h3>오늘의 게시글이 없습니다.</h3>
					</div>
				</c:if>
				<br/>		
			</c:forEach>
			
			<c:forEach var="today" items="${todayList}" varStatus="status">						
			
		       <div class="row" style="width: 300px; margin-left:40px; float: left;" >
		           <div class="col-sm-4" align="center" style="height: 300px; width: 300px;">
			           <c:if test="${(today.FILENAME == null)}">
			               <a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${today.STORY_NO}" target="_blank" class="demo-box">
			                   <img style="width:250px; height:250px;" src="<%= request.getContextPath() %>/resources/img/cute.jpg" alt="" class="img-responsive">
			               </a>
			           </c:if>
			           
			           <c:if test="${(today.FILENAME != null)}">
			               <a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${today.STORY_NO}" target="_blank" class="demo-box">
			                   <img style="height: 250px; width: 250px;" src="<%= request.getContextPath() %>/resources/files/${today.FILENAME}">
			               </a>
			           </c:if>
			           
		           </div><!--col end-->
		       </div>
		
			</c:forEach>

		</div>
	</div>			

	<div align="center">
		<a href="<%= request.getContextPath() %>/story/story.action"><span class="label-primary label-circle"></span></a>
	</div>	
	<br/>

    <div class="divide60"></div>

	<div class="demos" id="demos">
	   <div class="container">
			
			<c:forEach var="motivenum" items="${motiveno}" varStatus="status">
				<c:if test="${(motivenum.MAXNUM != null || motivenum.MAXNUM == null)}">
					<div class="" align="center">
						<h1>
							오늘의 <span style="color: skyblue;">자극 </span>글
						</h1>
						<h4>
							<span style="color: skyblue; font-size: x-large;">"</span>오늘도 힘내자구요<span style="color: skyblue; font-size: x-large;">"</span>
						</h4>
					</div>
					<br/>
				</c:if>
				<br/>	
								
				<c:if test="${(motivenum.MAXNUM == null)}">
					<div class="" align="center">
						<h3>오늘의 자극글이 없습니다.</h3>
					</div>
				</c:if>
				<br/>		
			</c:forEach>
			
			<c:forEach var="motivate" items="${motivateList}" varStatus="status">
					
				<div class=""  style="width: 300px; margin-left:40px; float: left;" >
					<div class="" align="center" style="height: 300px; width: 300px;">
	
						<c:if test="${(motivate.FILENAME != null)}">
							<a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${motivate.STORY_NO}">
								<img style="height: 250px; width: 250px;" src="<%= request.getContextPath() %>/resources/files/${motivate.FILENAME}">
							</a>
						</c:if>
												
						<c:if test="${(motivate.FILENAME == null)}">
	                		<a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${motivate.STORY_NO}">
	                			<img style="width:250px; height:250px;" src="<%= request.getContextPath() %>/resources/img/cute.jpg" >
	                		</a>
	                	</c:if>
								
					</div>
				</div>			
			</c:forEach>
		</div>
	</div>
	
	<div align="center">
		<a href="<%= request.getContextPath() %>/story/story.action"><span class="label-primary label-circle"></span></a>
	</div>
	<br/>
	
</body>
</html>