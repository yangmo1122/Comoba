<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/song/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="<%=request.getContextPath() %>/resources/song/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath() %>/resources/song/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/song/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
        <link href="<%=request.getContextPath() %>/resources/song/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
        <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/song/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/song/js/modernizr.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout">



<style  type="text/css">

{
  "kind": "youtube#liveChatMessage",
  "etag": etag,
  "id": string,
  "snippet": {
    "type": string,
    "liveChatId": string,
    "authorChannelId": string,
    "publishedAt": datetime,
    "hasDisplayContent": boolean,
    "displayMessage": string,
    "fanFundingEventDetails": {
      "amountMicros": unsigned long,
      "currency": string,
      "amountDisplayString": string,
      "userComment": string
    },
    "textMessageDetails": {
      "messageText": string
    },
    "messageDeletedDetails": {
      "deletedMessageId": string
    },
    "userBannedDetails": {
      "bannedUserDetails": {
        "channelId": string,
        "channelUrl": string,
        "displayName": string,
        "profileImageUrl": string
      },
      "banType": string,
      "banDurationSeconds": unsigned long
    },
    "superChatDetails": {
      "amountMicros": unsigned long,
      "currency": string,
      "amountDisplayString": string,
      "userComment": string,
      "tier": unsigned integer
    }
  },
  "authorDetails": {
    "channelId": string,
    "channelUrl": string,
    "displayName": string,
    "profileImageUrl": string,
    "isVerified": boolean,
    "isChatOwner": boolean,
    "isChatSponsor": boolean,
    "isChatModerator": boolean
  }
} 
</style>
    
 <!--side navigation start-->
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
        

        <!--side navigation start-->
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
                        <li class="hoe-has-menu">
                           
                                <a href="<%=request.getContextPath()%>/ourroom/qnaoneone.action"> <i class="ion-search"></i>1:1질문</a>
                                <span class="selected"></span>
                          
                        </li>
                     </ul>
                </aside>


<section id="registry" class="gift-registry" data-stellar-background-ratio="0.3" style="background-color: white;">
            <div class="space-100"></div>
         
                <div class="row margin-b-50">
                    <div class="col-sm-8 col-sm-offset-2 text-center">
                        <div class="center-title">
                            <h2>우리방</h2>
                            <p>
                           Ourroom 방입니다. 더 궁굼하신 내용은 1:1 상담 창을 눌러주세요.
                              </p>
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="row gf-row">
                    <div class="col-sm-8 col-sm-offset-2 text-center">
                          <div class="row">
                            <div class="col-sm-4">
                              
                              
                                 <img src="<%= request.getContextPath() %>/resources/img/sm/qnaimg1.jpeg" alt="" class="img-responsive">
                               
                            </div>
                            <div class="col-sm-4">
                           
                                    <img src="<%= request.getContextPath() %>/resources/img/sm/man-coffee-cup-pen.jpg" alt="" class="img-responsive">
                             
                            </div>
                            <div class="col-sm-4">
                              
                                   <img src="<%= request.getContextPath() %>/resources/img/sm/qnaimg3.jpeg" alt="" class="img-responsive">
                               
                            </div>
                        </div>
                    </div>
            
            </div>
        </section>
        <!--end gift registry-->


                <!--start main content-->
                 <section id="main-content" style="background-color: white;">
	
	
	
	
	
	
        <div class="divide80" ></div>
         
              

                    
         			   <!-- 자주 묻는 질문중에서 찾아주세요  > 이메일 문의하기를 이용해 주세요! > 고객센터 상담원에게 전화문의를 해주세요 ! -->
                  <div class="row" >
             <div class="col-md-7" style="margin-left: 90px; width: 1290px; ">
                    <div class="panel-group" id="accordion">
               
                     
 				 <c:forEach var="qnavo" items="${qnaourroom}" varStatus="status"> 
                          <div class="panel panel-default">
                         
                            <div class="panel-heading">
                            
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${status.index}"  style="color: black;">
                        					     ${qnavo.title}
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse${status.index}"  class="panel-collapse collapse">
                                <div class="panel-body">
			 							${qnavo.contents}
                                </div>
                            </div>
                        </div>
   				</c:forEach>
                          
                    </div>	
                </div>
               </div>
         </section>     
         

            </div>
        </div>
        
            
      
        <div class="divide60"></div>


        <!--Common plugins-->
        <script src="<%=request.getContextPath() %>/resources/song/plugins/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/js/app.js"></script>
        <!--page scripts-->
        <!-- Flot chart js -->
        <script src="<%=request.getContextPath() %>/resources/song/plugins/flot/jquery.flot.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/flot/jquery.flot.tooltip.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/flot/jquery.flot.resize.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/flot/jquery.flot.pie.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/flot/jquery.flot.time.js"></script>
        <!--vector map-->
        <script src="<%=request.getContextPath() %>/resources/song/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/song/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- ChartJS-->
        <script src="<%=request.getContextPath() %>/resources/song/plugins/chartJs/Chart.min.js"></script>
        <!--dashboard custom script-->
        <script src="<%=request.getContextPath() %>/resources/song/js/dashboard.js"></script>
    </body>
</html>