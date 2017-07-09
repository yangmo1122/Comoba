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
    
    </head>
   
   
    <body data-spy="scroll">
    
    
<!--  모달창 -->
<style  type="text/css"> 
.black_overlay{
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
    .modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}

    </style>
    
    <script type="text/javascript">


    function goSearch(){
	
    	var searchqnaFrm = document.searchqnaFrm;
	
		var sh_qnasearch = $("#sh_qnasearch").val();

	
		if(sh_qnasearch.trim() == "") {
		alert("검색어를 입력하세요!!");
	}
	else {
		searchqnaFrm.action = "<%=request.getContextPath()%>/ourroom/qna.action";
		searchqnaFrm.method = "GET";
		searchqnaFrm.submit();
	}
	
    }
	function searchKeep(){
		<c:if test="${not empty sh_qnacolname && not empty sh_qnasearch}">
			$("#sh_qnacolname").val("${sh_qnacolname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#sh_qnasearch").val("${sh_qnasearch}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
    </script>
    
    
    
    <body>
    
    
    
        <!--pre-loader-->
             <div id="preloader"></div>
        <!--pre-loader-->

    
 <!--side navigation start-->
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">

   <div id="hoeapp-container" hoe-color-type="lpanel-bg7" hoe-lpanel-effect="shrink">
                <aside id="hoe-left-panel" hoe-position-type="absolute">

                  <ul class="nav panel-list">
                    <li class="hoe-has-menu">
                             <a href="<%=request.getContextPath()%>/ourroom/qna.action"> <i class="ion-search"></i>메인</a>
                                <span class="selected"></span>
                           
                        </li>
                     <li class="hoe-has-menu">
                            
                             <a href="<%=request.getContextPath()%>/ourroom/qnastory.action"> <i class="ion-search"></i>공스토리</a>
                                <span class="selected"></span>
                           
                        </li>
                        <li class="hoe-has-menu">
                          
                              <a href="<%=request.getContextPath()%>/ourroom/qnalive.action"> <i class="ion-search"></i>공라이브</a>
                                <span class="selected"></span>
                          
                        </li>
                        <li class="hoe-has-menu">
                            
                               <a href="<%=request.getContextPath()%>/ourroom/qnamyroom.action"> <i class="ion-search"></i>내방</a>
                                <span class="selected"></span>
                         
                        </li>
                         <li class="hoe-has-menu">
                           
                                <a href="<%=request.getContextPath()%>/ourroom/qnaourroom.action"> <i class="ion-search"></i>우리방</a>
                                <span class="selected"></span>
                          
                        </li>
                 	 <li class="hoe-has-menu">
                           
                                <a href="<%=request.getContextPath()%>/ourroom/qnalist.action"> <i class="ion-search"></i>자주묻는질문</a>
                                <span class="selected"></span>
                          
                        </li>
                        
                        <li class="hoe-has-menu" data-toggle="modal" data-target="#layerpop">
                           
                               <i class="ion-search"></i>1:1상담</a>
                                <span class="selected"></span>
                        </li> 
                     </ul>
                </aside>

        <section class="groom-bride" style="height: -500%; background-color: white;">
            <div class="container">
               
                    <div class="col-sm-8 col-sm-offset-2 text-center">
                     <div class="center-title">
                    <span class="center-line"></span>
                    <p>What We Do?</p>
                    <h3>Q&A</h3>
                </div>
                
                </div>
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="row">
                            <div class="col-sm-6 text-center margin-b-30 wow animated fadeInDown" data-wow-delay="0.3s">
                                <div class="gb_box">
 								      <a href="<%=request.getContextPath()%>/ourroom/qnastory.action">
                                       <img src="<%= request.getContextPath() %>/resources/img/sm/story.jpg"alt="" class="img-responsive"/> </a>
                                    
                                   
                                </div>
                            </div><!--col 6 end-->
                            <div class="col-sm-6 text-center margin-b-30 wow animated fadeInDown" data-wow-delay="0.6s">
                                <div class="gb_box">

                                         <a href="<%=request.getContextPath()%>/ourroom/qnalive.action">

                                          <img src="<%= request.getContextPath() %>/resources/img/sm/live.jpg"alt="" class="img-responsive"/> 
                                         </a>
                                   
                                    
                                </div>
                                
                                
                                
                            </div><!--col 6 end-->
                             <div class="col-sm-6 text-center margin-b-30 wow animated fadeInDown" data-wow-delay="0.3s">
                                <div class="gb_box">
									 <a href="<%=request.getContextPath()%>/ourroom/qnamyroom.action">
                                       <img src="<%= request.getContextPath() %>/resources/img/sm/myroom.jpg"alt="" class="img-responsive"/> </a>
                                 
                                  
                                   
                                </div>
                            </div><!--col 6 end-->
                            <div class="col-sm-6 text-center margin-b-30 wow animated fadeInDown" data-wow-delay="0.6s">
                               
 										<a href="<%=request.getContextPath()%>/ourroom/qnaourroom.action">
                                     
                                          <img src="<%= request.getContextPath() %>/resources/img/sm/ourroom.jpg"alt="" class="img-responsive"/> </a>
                                
                                    
                                </div>
                                
                            </div><!--col 6 end-->
                        </div><!--row end-->
                    </div>
                </div>
            </div><!--container end-->
        </section><!--groom-bride end-->
      
        
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
             <h3>도움이 더 필요하신가요?</h3>
                        <h5>걱정 마세요. 스터디서치에게 1:1문의를 해주세요 접수 후 영업일 기준 3일 내로 답변 받으실 수 있습니다.</h5>
                        <div class="form-contact">
                            <form role="form"  >
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="답변받을 이메일 주소">
                                </div>
                                <div class="form-group">
                                    <label for="message">Comment</label>
                                    <textarea class="form-control" rows="7" id="message"placeholder="무엇을 도와드릴까요? 문의하실 내용을 적어주세요."></textarea>
                                </div>   
                                     
                                <button type="submit" class="btn btn-theme-bg btn-lg pull-right" style="background-color: orange;">문의하기</button>
                                            <button type="submit" class="btn btn-theme-bg btn-lg pull-right" style="background-color: orange;">닫기</button>
          
                            </form>
                        </div>
      </div>
    </div>
  </div>
</div>

        </section>
  <div id="back-to-top">
            <a href="#top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- jQuery-->
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
        <script>
              // Formstone Background - Video Background Settings
    $(".video-section").background({
        source: {
            poster: "img/iceberg.jpg",
            mp4: "img/iceberg.mp4"
        }
    });
        </script>

        <!--gmap js-->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript">
            var myLatlng;
            var map;
            var marker;

            function initialize() {
                myLatlng = new google.maps.LatLng(37.397802, -121.890288);

                var mapOptions = {
                    zoom: 13,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: false,
                    draggable: false
                };
                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                var contentString = '<p style="line-height: 20px;"><strong>assan Template</strong></p><p>Vailshali, assan City, 302012</p>';

                var infowindow = new google.maps.InfoWindow({
                    content: contentString
                });	

                marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: 'Marker'
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>

    </body>
</html>