<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${STUDYROOM_NAME}의상세페이지</title>

 <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      
      height: 400px;
      margin: auto;
  }
  </style>


</head>
<body>
	<div class="divide80"></div>
	<div class="container">

		<!--  -->


		<%--    <c:forEach var="list" items="${imglist}">
									<img src="<%=request.getContextPath() %>/resources/files/${list.IMAGEFILENAME}"   class="img-responsive" alt="" style=" width: 100%; height:300px; margin-top: 5%; margin-left: 22.5%" >
					   </c:forEach> --%>



		<div style="height: 60px;">
			<span
				style="color: #FA5882; font-weight: bold; font-size: 25px; display: inline-block; width: 200px; float: left; margin-left: 60px;">${map.STUDYROOM_NAME}</span>
		</div>


		<div align="center">

			<div class="container">

				<div id="myCarousel" class="carousel slide">
					<!-- Indicators -->
					<ol class="carousel-indicators">


						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>


						<c:forEach var="list" begin="1" items="${imglist}"
							varStatus="status">

							<li data-target="#myCarousel" data-slide-to="${list.status}"></li>


						</c:forEach>



					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img
								src="<%=request.getContextPath() %>/resources/files/${imglist[0].IMAGEFILENAME}"
								alt="" width="600" height="200">
							<div class="carousel-caption"></div>
						</div>

						<c:forEach var="list" begin="1" items="${imglist}"
							varStatus="status">

							<div class="item">
								<img
									src="<%=request.getContextPath() %>/resources/files/${list.IMAGEFILENAME}"
									alt="" width="600" height="200">
								<div class="carousel-caption"></div>
							</div>


						</c:forEach>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>



			<!-- 

			<div style="height: 40px;">
				<span
					style="font-weight: bold; font-size: 15px; text-align: left; display: inline-block; width: 200px; float: left; margin-top: 4%; margin-left: 90px;">스터디룸
					소개</span>
			</div>
 -->
			<div class="divide60"></div>

			<div
				style="width: 980px; text-align: left; font-weight: bold; font-size: 14px; display: inline-block; background-color: #f2fffd;">
				<span
					style="text-align: left; font-weight: bold; font-size: 19px; display: inline-block; background-color: #f2fffd; margin-top: 10px; padding-left: 5%; padding-bottom: 5%; padding-top: 5%;">

					&nbsp;&nbsp;주소&nbsp;&nbsp;:&nbsp;&nbsp;${map.ADDR1} ${map.ADDR2} <br>
					<br> &nbsp;&nbsp;가격&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatNumber
						value="${map.COST}" pattern="#,###" /> 원 <span
					style="font-size: 15px; color: red;">(1인당 1시간)</span> <br> <br>
					&nbsp;&nbsp;문의번호&nbsp;&nbsp;:&nbsp;&nbsp;${map.HP} <br> <br>
					&nbsp;&nbsp;<span style="color: navy;">${map.STUDYROOM_CONTENTS}</span>
					<br> <br>


				</span>
			</div>
			<div
				style="width: 980px; text-align: left; font-weight: bold; font-size: 14px; display: inline-block; background-color: white;">


			</div>

		</div>



	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			// Activate Carousel
			$("#myCarousel").carousel();

			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#myCarousel").carousel(0);
			});
			$(".item2").click(function() {
				$("#myCarousel").carousel(1);
			});
			$(".item3").click(function() {
				$("#myCarousel").carousel(2);
			});
			$(".item4").click(function() {
				$("#myCarousel").carousel(3);
			});

			// Enable Carousel Controls
			$(".left").click(function() {
				$("#myCarousel").carousel("prev");
			});
			$(".right").click(function() {
				$("#myCarousel").carousel("next");
			});
		});
	</script>







</body>
</html>