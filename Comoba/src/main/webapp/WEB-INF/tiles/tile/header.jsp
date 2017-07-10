<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gong's</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js" rel="stylesheet">
        <!-- font awesome for icons -->
        <link href="<%=request.getContextPath() %>/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- flex slider css -->
        <link href="<%=request.getContextPath() %>/resources/css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
        <!-- animated css  -->
        <link href="<%=request.getContextPath() %>/resources/css/animate.css" rel="stylesheet" type="text/css" media="screen"> 
        <!-- Revolution Style-sheet -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/rev-style.css">
        <!--owl carousel css-->
        <link href="<%=request.getContextPath() %>/resources/owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
        <link href="<%=request.getContextPath() %>/resources/owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
        <!--mega menu -->
        <link href="<%=request.getContextPath() %>/resources/css/yamm.css" rel="stylesheet" type="text/css">
        <!--cube css-->
        <link href="<%=request.getContextPath() %>/resources/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css">
        <!-- custom css-->
        <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" type="text/css" media="screen">

          <!-- 회원가입 -->
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="<%=request.getContextPath() %>/resources/assets/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath() %>/resources/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
          <link href="<%=request.getContextPath() %>/resources/assets/plugins/iCheck/custom.css" rel="stylesheet">
        <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/assets/js/modernizr.js"></script>
        
        <!-- intro 화면-->
        <link href="<%=request.getContextPath() %>/resources/assets/plugins/lightbox2/dist/css/lightbox.css" rel="stylesheet">
        
        <style>
.jy{
background-color: white !important;
}
</style>
        
    </head>
    <body>
        <div class="top-bar-dark">            
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 hidden-xs">
                        <div class="top-bar-socials">
                  
                        </div>
                    </div>
                    <div class="col-sm-8 text-right">
                        <ul class="list-inline top-dark-right">                      
                             <!-- 로그인전 -->
                               <c:if test="${sessionScope.loginuser == null}">
                               <li class="hidden-sm hidden-xs"><i class="fa fa-envelope"></i> Support@mail.com</li>
                               <li class="hidden-sm hidden-xs"><i class="fa fa-phone"></i> +01 1800 453 7678</li>
                               <li><a href="/main/login.action"><i class="fa fa-lock"></i> 로그인</a></li>
                               <li><a href="/main/register.action"><i class="fa fa-user"></i> 회원가입</a></li>
                            </c:if>
                                                       
                            <!-- 로그인후 -->
                            <c:if test="${sessionScope.loginuser != null}">
                              <!-- 로그인 성공한 사용자 출력하기 -->
                               <li style="margin-left: 22%; margin-top: 1%;">
                            <span style="color: navy; font-weight: bold;">${sessionScope.loginuser.nickname}님 오늘 하루도 열공하세요!!</span>
                        </li>
                        <li><a href="/main/userdetail.action"><i class="fa fa-user"></i> 내정보보기</a></li>
                               <li><a href="/main/logout.action"><i class="fa fa-lock"></i> 로그아웃</a></li>
                            </c:if>
                                                 
                            <li><a class="topbar-icons" href="#"><span><i class="fa fa-search top-search"></i></span></a></li>
                        </ul>
                        <div class="search">
                            <form role="form">
                                <input type="text" class="form-control" autocomplete="off" placeholder="Write something and press enter">
                                <span class="search-close"><i class="fa fa-times"></i></span>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div><!--top-bar-dark end here-->
        <!--navigation -->
        <!-- Static navbar -->
        <div class="navbar navbar-default navbar-static-top yamm sticky jy" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/main/intro.action"><img src="<%= request.getContextPath() %>/resources/img/logo_final.png" style="width: 200px; height: auto;" alt="ASSAN"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                    
                       <!--공스토리-->
                        <li class="dropdown">
                            <a href="<%=request.getContextPath()%>/story/story.action" class="">공스토리</a>
                        </li>
                        
                        <!--공라이브-->
                        <li class="dropdown">
                            <a href="<%=request.getContextPath()%>/live/live.action" class="">공라이브</a>
                        </li>
                        
                        <!--내방-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">내 방 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/main/myroom/myroom.action">내 게시물</a></li>
                                <li><a href="/main/myroom/schedule.action">스케줄 관리</a></li>
                                <li><a href="/main/myroom/state.action">내 공부현황</a></li>
                            </ul>
                        </li>
                        <!-- 
                           <c:if test="${sessionScope.loginuser != null}">
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">내 방 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/main/myroom/myroom.action">내 게시물</a></li>
                                <li><a href="/main/myroom/schedule.action">스케줄 관리</a></li>
                                <li><a href="/main/myroom/state.action">내 공부현황</a></li>
                            </ul>
                        </li>
                        </c:if> 이거 로그인해야 보이게하는거
                         -->
                        <!--송희가 한 우리방-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">우리방 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="<%=request.getContextPath()%>/ourroom/studysearch.action">스터디룸 찾기</a></li>
                                <li><a href="<%=request.getContextPath()%>/ourroom/freeboard.action">자유게시판</a></li>
                                <li><a href="<%=request.getContextPath()%>/ourroom/qna.action">Q&A</a></li>
                            </ul>
                        </li>
                        
                          <c:if test="${sessionScope.loginuser.email == 'woflqh12@naver.com'}">
                        <!--관리자-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">관리자<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                            
                               <li><a href="<%=request.getContextPath()%>/admin/boardManagement.action">게시물관리</a></li>
                                <li><a href="<%=request.getContextPath()%>/admin/memberManagement.action">회원관리</a></li>
                                <li><a href="<%=request.getContextPath()%>/admin/addStudyroom.action">스터디룸 등록</a></li>
                                <li><a href="<%=request.getContextPath()%>/admin/boardCnt.action">게시물 및 매출 현황(chart)</a></li>
                            </ul>
                        </li>
                     </c:if>
       
                    </ul>
                </div><!--/.nav-collapse -->
            </div><!--container-->
        </div><!--navbar-default-->
        
        
  <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/js/jquery-migrate.min.js"></script> 
        <!--bootstrap js plugin-->
        <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.sticky.js"></script>
        <!--flex slider plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--parallax background plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.stellar.min.js" type="text/javascript"></script>
        <!--digit countdown plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/waypoints.min.js"></script>
        <!--digit countdown plugin-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.counterup.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="<%=request.getContextPath() %>/resources/js/wow.min.js" type="text/javascript"></script> 
        <!--owl carousel slider-->
        <script src="<%=request.getContextPath() %>/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <!--popup js-->
        <script src="<%=request.getContextPath() %>/resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        
           
        <!--customizable plugin edit according to your needs-->
        <script src="<%=request.getContextPath() %>/resources/js/custom.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
      <%--   <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/revolution-custom.js"></script> --%>

        <!--cube portfolio plugin-->
        <script src="<%=request.getContextPath() %>/resources/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/js/cube-portfolio.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/resources/js/pace.min.js" type="text/javascript"></script>
    </body>
 
 
 <script>
if(${sessionScope.alim == 1}){
window.addEventListener('load', function () {
  // At first, let's check if we have permission for notification
  // If not, let's ask for it
  if (Notification && Notification.permission !== "granted") {
    Notification.requestPermission(function (status) {
      if (Notification.permission !== status) {
        Notification.permission = status;
      }
    });
  }

  //var button = document.getElementsByTagName('button')[0];

 // button.addEventListener('click', function () {
    // If the user agreed to get notified
    if (Notification && Notification.permission === "granted") {
      var n = new Notification("${sessionScope.alimcomment}");
    }

    // If the user haven't tell if he want to be notified or not
    // Note: because of Chrome, we are not sure the permission property
    // is set, therefore it's unsafe to check for the "default" value.
    else if (Notification && Notification.permission !== "denied") {
      Notification.requestPermission(function (status) {
        if (Notification.permission !== status) {
          Notification.permission = status;
        }

        // If the user said okay
        if (status === "granted") {
          var n = new Notification("Hi!");
        }

        // Otherwise, we can fallback to a regular modal alert
        else {
          alert("Hi!");
        }
      });
    }

    // If the user refuse to get notified
    else {
      // We can fallback to a regular modal alert
      alert("Hi!");
    }
//  });
});
}
</script> 
 
        