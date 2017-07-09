<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css">
<%--   <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script> --%>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
  
 
   <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-ui.min.js"></script>
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/custom.js"></script> --%>


<style type="text/css">

/* #3498db */

.star{
   width: 20px;
   height: 20px;
}

.clock{
   width: 40px;
   height: 40px;
}

.clock-position{
   position:absolute; top:15px; right:15px;
}


#myroomtab{
   width: 100%;
}

.ty_tab{
   border: 1px solid #b3b3b3;
   width: 33%;
   text-align: center;
   line-height: 40px;
}


.row{
   margin-bottom: 1%;
   
}

.myroom_story{
   width: 23%;
   margin-right: 1%;
   float: left;
}

.myroom_storynum{
   font-size: 9pt;
   color: #b3b3b3;
}

.ty_red{
   font-size: 22pt; font-weight: bold; color: #e74c3c;
}

.ty_green{
   font-size: 22pt; font-weight: bold; color: #33c961;
}

.ty_blue{
   font-size: 22pt; font-weight: bold; color: #3498db;
}

.ty_black{
   font-size: 14pt; font-weight: bold; color: black;
}

.ty_gray{
   font-size: 12pt; font-weight: bold; color: #b3b3b3;
}


#myroom_mycurrent{
   
   text-align: center;
   
}

#myroom_mycurrent table{
   width: 99%;
}

#myroom_mycurrent td{
   width: 33%;
   line-height: 30px; 
}


.btn-follow{ 
   
   border: 1px solid #33c961; 
   background-color: white; 
   color: #33c961; 
   height: 30px; 
   font-size: 10pt;
}

.btn-following{
   
   background-color: #33c961; 
   color: white; 
   height: 30px; 
   font-size: 10pt;
   
}

</style>



<script type="text/javascript">
   
   function goFollowing(){
   
      var form_data = {followmemberno : ${membervo.memberno} 
                  ,mymemberno : ${loginmemberno}
                  ,checkfollow : '0' }; 

      $.ajax({
      url: "<%= request.getContextPath() %>/myroom/following.action",
      type:"POST",                          // method
      data: form_data,                        // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
      success: function(data) {                   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
         alert("팔로잉했습니다 :)");
         $("#div_follow").empty();
         var html = "<button type='button' class='btn btn-following' onClick='goUnfollowing();'>팔로잉</button>";
         $("#div_follow").html(html);
      },
      error: function(request, status, error){
      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }          
      });
      
   
   }
   
   function goUnfollowing(){
      
      
      var form_data = {followmemberno : ${membervo.memberno} 
                  ,mymemberno : ${loginmemberno}
                  ,checkfollow : '1'}; 

      $.ajax({
      url: "<%= request.getContextPath() %>/myroom/following.action",
      type:"POST",                          // method
      data: form_data,                        // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
      success: function(data) {                   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
         alert("팔로잉 취소했습니다 :)");
         $("#div_follow").empty();
         var html = "<button type='button' class='btn btn-follow' onClick='goFollowing();'>팔로우</button>";
         $("#div_follow").html(html);
      },
      error: function(request, status, error){
      alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }          
      });
      
      
   }


</script>


<div class="divide80"></div>

   <div class="container">
   
   <div id="myroom_myprofile" style="float: left; width: 50%; height: 100px;">
      <div style="float: left; width: 70px; height: 70px;">
         <img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 60px; height: 60px;">
      </div>&nbsp;
      <div style="float: left; width: 50%;">
         <span style="font-weight: bold; font-size: 13pt; color: #000;">${membervo.nickname}</span>&nbsp;&nbsp;
         <a href="<%=request.getContextPath()%>/myroom/roomlive.action?memberno=${membervo.memberno}"><img src="<%= request.getContextPath() %>/resources/images/myroom/tv.png" alt="" style="width: 30px; height: auto;"></a>
         <span id="div_follow" style="margin-left: 10px;">
         <c:if test="${show == 0 && checkfollow == 0}">
            <button type="button" class="btn btn-follow" onClick="goFollowing();">팔로우</button>
         </c:if> 
         <c:if test="${show == 0 && checkfollow == 1}">
            <button type="button" class="btn btn-following" onClick="goUnfollowing();">팔로잉</button>
         </c:if>
         </span> 
         <br/>
         <span style="font-size: 11pt; color: #c0c0c0;">${membervo.email}</span>
      </div>
   </div>
   
   <div id="myroom_mycurrent" style="float: right;  width: 40%; height: 100px;">
      <table>
         <tr>
         <c:if test="${membervo.hours != 0 } ">
            <td><span class="ty_red">${membervo.hours}</span><span class="ty_black">h</span>
            <span class="ty_red">${membervo.minutes}</span><span class="ty_black">m</span></td>
         </c:if>
         <c:if test="${membervo.hours == 0 }">
            <td><span class="ty_red">${membervo.minutes}</span><span class="ty_black">m</span>
            <span class="ty_red">${membervo.seconds}</span><span class="ty_black">s</span></td>
         </c:if>
         
            <td><span class="ty_green">132</span><span class="ty_black">days</span></td>
            <td><span class="ty_blue">${followingcnt }</span></td>
         </tr>
         <tr>
            <td><span class="ty_gray">절대공부시간</span></td>
            <td><span class="ty_gray">출석일수</span></td>
            <td><span class="ty_gray">팔로워</span></td>
         </tr>
      </table>
   </div>
   
   
   <div class="divide30" style="clear: both;"></div>
   <c:if test="${membervo.comments == null }">
   <span>${membervo.nickname} 님의 페이지입니다. </span>
   </c:if>
   <c:if test="${!(membervo.comments == null) }">
   <span>${membervo.comments}</span>
   </c:if>
      
      <div class="divide60"><a href="/main/myroom/storywrite.action"><span style="float: right">
                                        <img src="<%= request.getContextPath() %>/resources/img/sm/edit.png" width="auto;" height="27px;"></span></a>
                                        
        </div>
      
        <div>
             <!-- Nav tabs -->
  
            <table class="list-inline tabs-bordered" id="myroomtab" role="tablist">
            <tr>
                <td role="presentation" class="active ty_tab"><a href="#tb1" aria-controls="tb1" role="tab" data-toggle="tab"> 내 게시물<span class="myroom_storynum">[52]</span></a></td>
          <c:if test="${show == 1 }">      <td role="presentation" class="ty_tab"><a href="#tb2" aria-controls="tb2" role="tab" data-toggle="tab"> 비밀노트<span class="myroom_storynum">[30]</span></a></td></c:if>
                <td role="presentation" class="ty_tab"><a href="#tb3" aria-controls="tb3" role="tab" data-toggle="tab"> 내 팔로워/팔로잉</a></td>
            </tr>
            </table>
            
            <div class="divide30"></div>
            
            <!-- Tab panes -->
            <div class="tab-content">
            
            <!-- 내 게시물 -->
                 <div role="tabpanel" class="tab-pane active" id="tb1">
          
<%--   <c:forEach var="map" items="${storyList}" varStatus="status">

       
                 <a href="<%= request.getContextPath() %>/myroom/privateroom.action"?memberno_fk=${map.MEMBERNO_FK}"></a>
    <!-- 공개글만 보여주기 -->   
   <c:if test="${(map.STORY_PUBLICSTATUS == 1)}">
    
          <div class="mas-boxes-inner"  style="width: 300px; margin-left:40px; float: left;" >
                
             <div style="width: 95%; height:55px;">
                <div style="float: left;">
                     <img src="<%= request.getContextPath() %>/resources/img/user.png" alt="" style=" width:40px; height:40px; margin-top: 15px; margin-left: 15px; ">
                  </div>
                  
                  <div style="margin-top: 20px; float: left;">
                     &nbsp;&nbsp; <span style="font-weight: bold;">${map.NICKNAME}</span>
                  </div>
                  
                  ${membervo.memberno}
                  
                  <div style="float: right;">
                     <img src="<%= request.getContextPath() %>/resources/img/nolike.png" alt="" style=" width:25px; height:25px; margin-top: 20px; ">
                  </div>
                  
             </div>
                <div class="mas-blog-inner" align="center" style="padding: 10px;" >
                
                   <c:if test="${(map.THUMBNAILFILENAME == null)}">
                      <a href="<%= request.getContextPath() %>/main/story/storydetail.action?story_no=${map.STORY_NO}">
                         <img src="<%= request.getContextPath() %>/resources/img/cute.jpg" style=" width:280px; height:280px; ">
                      </a>
                   </c:if>
                      
                   <c:if test="${(map.THUMBNAILFILENAME != null)}">
                      <a href="<%= request.getContextPath() %>/main/story/storydetail.action?story_no=${map.STORY_NO}">
                         <img src="<%= request.getContextPath() %>/resources/files/${map.THUMBNAILFILENAME}">
                       </a>   
                    </c:if>
                    
                </div><!--blog inner-->
          </div>
         
     </c:if>           
          
      
      <c:if test="${(status.count % 4) == 0}">
      </div>  
          <div class="row">   
      </c:if>
   </c:forEach>           
    --%>
   
                      <div class="row">
                          <div class="myroom_story">
                              <a class="gallery-box" href="#" data-lightbox="gallery">
                                  <img src="<%= request.getContextPath() %>/resources/images/myroom/공부3.jpg" alt="" class="img-responsive">
                                  
                              </a>
                          </div>
                          <div class="myroom_story">
                              <a class="gallery-box" href="#" data-lightbox="gallery">
                                  <img src="<%= request.getContextPath() %>/resources/images/myroom/공부3.jpg" alt="" class="img-responsive">
                                 
                              </a>
                          </div>
                      </div>
                      
                  </div>
              <c:if test="${show == 1 }">     
                  <!-- 비밀 노트 -->
                   <div role="tabpanel" class="tab-pane" id="tb2">
                        
                       <%--  
     <div class="row">
        <c:forEach var="map" items="${storyList}" varS   tatus="status">
       <!-- 비밀글만 보여주기 -->   
      <c:if test="${(map.STORY_PUBLICSTATUS == 0)}">
       
          
            
        </c:if>           
             
      
      
      <c:if test="${(status.count % 4) == 0}">
         </div>  
          <div class="row">   
      </c:if>
   </c:forEach>           
    --%> 
                        
                        
                           <div class="row">
                          
                          <div class="myroom_story">
                              <a class="gallery-box" href="#" data-lightbox="gallery">
                                  <img src="<%= request.getContextPath() %>/resources/images/myroom/공부3.jpg" alt="" class="img-responsive">
                                 
                              </a>
                          </div>
                          
                      </div>                    
                      </div>  
                      </c:if>
               <!-- 내 팔로우 -->      
                    <div role="tabpanel" class="tab-pane" id="tb3">
                          <!-- 팔로워 -->
                         <div id="follower" align="center" style="width: 40%; height: auto; float: left; margin-right: 5%; margin-left: 5%;"> 
                            <table class="myroomfollow table table-hover">
                               <thead>
                               <tr>
                                  <th class="ty_follow" colspan="2" style="padding-left: 33%; text-align: center; font-weight: bold; font-size: 12pt;">팔로워</th>
                                  <th class="ty_follow" style="text-align: right; color: #3498db;">${followingcnt }</th>
                               </tr>
                               </thead>
                               <tbody>

                               <c:forEach var="following" items="${followingList}" varStatus="status">
                                 <tr>
                                 <td class="ty_follower1">
                                    <img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;">
                                 </td>
                                 <td class="ty_follower2" colspan="2">${following.nickname}<br/>${following.email}</td>
                                 </tr>
                               </c:forEach>
                               
                               </tbody>
                            </table>
                         </div>
                         <!-- 팔로잉 -->
                         <div id="following" align="center" style="width: 40%; height: auto; float: left;"> 
                            <table class="myroomfollow table table-hover">
                               <thead>
                               <tr>
                                  <th class="ty_follow" colspan="2" style="padding-left: 33%; text-align: center; font-weight: bold; font-size: 12pt;">팔로잉</th>
                                  <th class="ty_follow" style="text-align: right; color: #3498db;">${followcnt }</th>
                               </tr>
                               </thead>
                               <tbody>
                                  <c:forEach var="follow" items="${followList}" varStatus="status">
                                    <tr>
                                     <td class="ty_follower1"><img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;"></td>
                                     <td class="ty_following1">${follow.nickname}<br/>${follow.email}</td>
                                      <td class="ty_following2">팔로우
                                       <img src="<%= request.getContextPath() %>/resources/images/myroom/check.png" alt="" style="width: 20px; height: 20px;"></td>
                               
                                    </tr>
                                  </c:forEach>
                               
                               </tbody>
                            </table>
                         </div>
                         
                </div>
            </div>

       </div>
        
   </div>
   
   <div class="divide60"></div>


   