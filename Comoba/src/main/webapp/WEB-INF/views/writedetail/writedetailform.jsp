<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/BootStrapStudy/js/bootstrap.js"></script>

<!-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head> -->
<body>

	<div class="divide80"></div>

	<div class="blog-masonary-wrapper">
		<div class="container mas-boxes" style="width: 880px; height: 480px;">
			<div class="mas-boxes-inner"
				style="width: 49.5%; height: 480px; float: left;">


				<div style="float: left;">
					<img src="<%=request.getContextPath()%>/resources/img/user.png"
						alt=""
						style="width: 40px; height: 40px; margin-top: 15px; margin-left: 15px;">
				</div>

				<div style="margin-top: 20px; float: left;">
					&nbsp;&nbsp;<span style="font-weight: bold;">양혜지</span>
				</div>
				<div style="float: right; margin-right: 5%">
					<img
						src="<%=request.getContextPath()%>/resources/img/checked.png"
						alt="" style="width: 25px; height: 25px; margin-top: 20px;">
				</div>
				<div style="margin-top: 20px; margin-right: 10px; float: right;">
					<span>팔로우</span>
				</div>


				<div class="mas-blog-inner" style="padding: 10px; margin-top: 15%">

					<img
						src="<%=request.getContextPath()%>/resources/images/intro/picture5.PNG"
						style="width: 400px; float: left;" alt="" class="img-responsive">
				</div>
				<!--blog inner-->
			</div>

			<div
				style="border: solid 1px gray; height: 480px; width: 1px; float: left;"></div>



			<div class="mas-boxes-inner"
				style="width: 49.5%; height: 480px; float: left;">

				<div class="mas-content-inner"
					style="height: 180px; margin-top: 20px; margin-left: 20px;">
					오늘도 카페에서 혼자 자바 공부할려고 <br> 노트북이랑 다들고왔어요. <br> 근데 공부할려고 하니까
					케이크가 너무 맛있어요 ㅠ _ㅠ <br> 이것만 먹고 얼른 해야지.... <br> 오늘 날씨가 너무
					더워요 ㅠ <br> 에어컨좀.....
				</div>
				<div class="mas-like-inner" style="height: 35px;">
					<div style="float: left; height: 25px;">
						<img
							src="<%=request.getContextPath()%>/resources/img/nolike.png"
							alt="" style="width: 25px; height: 25px; margin-left: 20px;">
					</div>
					<div style="float: left; height: 25px;">
						<img src="<%=request.getContextPath()%>/resources/img/write.png"
							alt="" style="width: 25px; height: 25px; margin-left: 20px;">
					</div>
				</div>

			<div class="mas-blog-inner">
				  <div class="list-inline post-detail">
				 	<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 25px; height: 25px;">
	                   &nbsp;&nbsp; by <a href="#">열공이</a>&nbsp;&nbsp; 같이해요 :)&nbsp;&nbsp;<i class="fa fa-calendar" style="text-align: right;"> 2017-06-14  </i>        
	              </div>
	              
				  <div class="list-inline post-detail">
				 	<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 25px; height: 25px;">
	                   &nbsp;&nbsp; by <a href="#">열공이2</a>&nbsp;&nbsp;의지력의 차이죠 :)&nbsp;&nbsp;<i class="fa fa-calendar" style="text-align: right;"> 2017-06-14</i>                             
	              </div>
	              
				  <div class="list-inline post-detail">
				 	<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 25px; height: 25px;">
	                   &nbsp;&nbsp; by <a href="#">열공이3</a>&nbsp;&nbsp;힘내요  :)&nbsp;&nbsp;<i class="fa fa-calendar" style="text-align: right;"> 2017-06-14</i>                             
	              </div>
	              
           </div><!--blog inner-->
			
				<div align="center" style="font-weight: bold; font-size: 14px;">
					이전페이지 [1] [2] [3] [4] [5] 다음페이지</div>

			</div>
		</div>
	</div>
</body>
</html>