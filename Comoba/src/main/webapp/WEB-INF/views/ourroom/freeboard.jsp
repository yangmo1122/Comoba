<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>One page Video</title>
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/song/index-video/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
        <!--plugins-->
        <link href="<%=request.getContextPath() %>/resources/song/index-video/css/animate.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/css/flexslider.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/owl-carousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/owl-carousel/assets/owl.theme.default.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/themify-icons/themify-icons.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/css/jasny-bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/index-video/video-background/background.css" rel="stylesheet" type="text/css">
        <!--cube css-->
        <link href="<%=request.getContextPath() %>/resources/song/index-video/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css">
        <!--custom css (comile from one-page.scss)-->
        <link href="<%=request.getContextPath() %>/resources/song/index-video/css/one-page.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
<style type="text/css">
	table, th, td {border: solid wh 1px;}
	#table {border-collapse: collapse; width: 820px;} 
	#table th, #table td {padding: 5px;}
	#table th {background-color: #ffffff;}
	
	a{text-decoration: none;} 
	    
</style>
   </head>
      <body>  


 <script type="text/javascript">
   	 
	 function goSearch(){
			
			var searchFrm = document.searchFrm;
			
			var sh_search = $("#sh_search").val();
			
			if(sh_search.trim() == "") {   //공백일경우 검색어를 입력하세요
				alert("검색어를 입력하세요!!");
			}
			else {
				searchFrm.action = "<%=request.getContextPath()%>/ourroom/freeboard.action";
				searchFrm.method = "GET";
				searchFrm.submit();
			}
			
		}
	
	function searchKeep(){
		<c:if test="${not empty sh_colname && not empty sh_search}">
			$("#sh_colname").val("${sh_colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#sh_search").val("${sh_search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
</script>



      
        <div class="navmenu navmenu-default navmenu-fixed-right offcanvas">
            <div class="side-panel-inner">
             
               
                <div class="socials">
                    <a href="#" class="social-icon si-dark si-gray-round si-colored-facebook">
                        <i class="fa fa-facebook"></i>
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" class="social-icon si-dark si-gray-round si-colored-twitter">
                        <i class="fa fa-twitter"></i>
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#" class="social-icon si-dark si-gray-round si-colored-instagram">
                        <i class="fa fa-instagram"></i>
                        <i class="fa fa-instagram"></i>
                    </a>
                    <a href="#" class="social-icon si-dark si-gray-round si-colored-linkedin">
                        <i class="fa fa-linkedin"></i>
                        <i class="fa fa-linkedin"></i>
                    </a>
                </div>
            </div>
        </div>
       
       
        <section class="numbers" style="background-image: url('<%= request.getContextPath()%>/resources/img/sm/pexels-photo-27665.jpg')"; >
            <div class="container"  style="margin-left: 30%;" >
                    <div class="col-sm-6 col-md-3 margin-b-30 text-center">
                        <i class="ti-stats-up"></i>
                        <h1 class="counter" style="color: white;">${totalCount}</h1>
                        <p>Total board</p>
                    </div><!--col-->
                    <div class="col-sm-6 col-md-3 margin-b-30 text-center">
                        <i class="ti-face-smile"></i>
                        <h1 class="counter" style="color: white;">${memberCount}</h1>
                        <p>Members</p>
                    </div><!--col-->
                </div><!--row-->
           
        </section>
  

        <div id="back-to-top">
            <a href="#top"><i class="fa fa-angle-up"></i></a>
        </div>
     
             <form name="searchFrm">
            	 <div>
            	 <div style="float: left; margin-left: 35%; margin-top: 2%;">
                                                <select name="sh_colname" id="sh_colname">
													<option value="subject">제목</option>
													<option value="content">내용</option>
													<option value="nickname">닉네임</option>
												</select>
                      </div><div style="float: left; margin-left: 1%; margin-top: 2%;">
                           <input type="text"  placeholder="Search here" name="sh_search" id="sh_search" size="50px;" />
                                  </div><div style="float: left; margin-left: 1%; margin-top: 2%;">                     
                                   <span class="input-group-btn"  style="float: left;">
                                                            <button type="submit"  onClick="goSearch();"class="btn btn-sm btn-primary">
                                                                Search
                                                            </button>
                                                            </span>
                                               </div>           
                                                 </div>
                                                </form>
                                        
     	 					
   <div class="panel-body" style="margin-top: 8%;">
        <table class="table table-hover">
            <thead>
                    <tr>
                      <th>글번호</th>
                       <th>카테고리</th>
                      <th>제목</th>
                      <th>닉네임</th>
                      <th>날짜</th>
                      <th>조회수</th>
                      <th>파일</th>
                    </tr>
                    
                  </thead>
                  <tbody>
             
                  <c:forEach var="boardvo" items="${boardList}" varStatus="status"> 
                  
                   <tr>
                      <th scope="row">${boardvo.board_no}</th>
                      <td  scope="row" style="font-weight: bold;">${boardvo.gcategory}</th>
                      <td>  
                      <a href="<%= request.getContextPath() %>/view.action?rno=${boardvo.rno}&board_no=${boardvo.board_no}">${boardvo.subject}<span style="color: red; font-weight: bold; font-style: italic; font-size: smaller; vertical-align: super; "></span></a> 
					</td>
                      <td>${boardvo.nickname}</td>
                      <td>${boardvo.writedate}</td>
                      <td>${boardvo.readCount}</td>
                 
                 
                      	<!-- ===== #142. 첨부파일 여부 표시하기(이미지로 표시함) ===== 		--> 
			
				<td align="left">
					<c:if test="${not empty boardvo.fileName}">
					<i class="fa fa-file-text-o" style="font-size:20px"></i>
					
					</c:if>
				</td>
			 </tr>
           </c:forEach>
        </tbody>
      </table>
                       
      <div style="margin-top: 20px;" align="right">
		<button type="button" style="background-color: white; border: solid 1px gray;" onClick="javascript:location.href='<%= request.getContextPath() %>/ourroom/add.action'">글쓰기</button>&nbsp;
		<button type="button" style="background-color: white; border: solid 1px gray;" onClick="javascript:location.href='<%= request.getContextPath() %>/ourroom/freeboard.action'">글목록</button>
		
		</div>          
   	 </div>
   </div>
	<br/>
	
	<!-- ===== #115. 페이지바 보여주기 ===== -->
	<div align="center" style="width: 500px; margin-left: 650px; margin-right: auto;">
		${pagebar}
	</div>
	<br/>
	
	<!-- ===== #146. Ajax 로 검색어 입력시 자동글 완성하기 1 ===== --> 
	<div id="displayList" style="width:302px; margin-left: 61px; border: solid 0px gray; border-top: 0px;">
	</div> 
    <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery-migrate.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/wow.min.js" type="text/javascript"></script> 
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery.sticky.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/waypoints.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery.counterup.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/modernizr.custom.97074.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/parallax.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jquery.flexslider-min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/one-page.js" type="text/javascript"></script> 
        <!--cube portfolio plugin-->
        <script src="<%=request.getContextPath() %>/resources/song/index-video/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/cube-portfolio.js" type="text/javascript"></script>
        <!--cantact form script-->
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/contact_me.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/js/jqBootstrapValidation.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/song/index-video/js/jasny-bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/song/index-video/js/pace.min.js"></script>
                           <script src="<%=request.getContextPath() %>/resources/song/index-video/video-background/core.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/video-background/transition.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/index-video/video-background/background.js"></script>
  

    </body>
</html>

