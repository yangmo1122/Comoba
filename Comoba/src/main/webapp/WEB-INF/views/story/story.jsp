<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
  
  
  .myborder {
   border: white solid 2px;
  }
  
  
  
</style>

<script type="text/javascript">

$(document).ready(function(){
	       
   	$(".my_like").hover(
              function(){
                 $(this).addClass("myborder");
              },
              function(){
                 $(this).removeClass("myborder");
              }
        );
   	
	
 });
 

   
 
function goSearch(){
	
	var searchFrm = document.searchFrm;
	
	var search = $("#search").val();
	
	if(search.trim() == "") {
		alert("검색어를 입력하세요!!");
	}
	else {
		searchFrm.action = "/main/story/story.action";
		searchFrm.method = "GET";
		searchFrm.submit();
	}
	
}



		
 
	
function golikeOn(likestory_no, likememberno, likecount) {
	
	if(${(sessionScope.loginuser.memberno != null)}){
	
    var form_data = {likestory_no : likestory_no,
    			 	 likememberno : likememberno,
    			 	 likecount : likecount};
    
    $.ajax({
       url : "<%= request.getContextPath() %>/story/getlikeswitch.action",
       type : "POST",
       data : form_data,  
       dataType : "JSON", 
       
       success: function(data) {  
    	   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
       
             // data 는 ajax 요청에 의해 url 페이지 getLargeImgFilename.action 으로 부터 리턴받은 데이터
                       
             $('#love'+likestory_no).empty();
             // <div id="largeImg"> 엘리먼트를 모두 비워서 새로운 데이터를 받을수 있게 해라
              
             var html = "";
             
            	 html = "<img src='<%= request.getContextPath() %>/resources/img/like.png' alt='' style=' width:25px; height:25px;' class='my_like' onClick='golikeOff(" +data.Story_no+",${sessionScope.loginuser.memberno},1);'>"; 
            		/*  data.Story_no */
            	 
            	 		 
               	 $('#love'+likestory_no).html(html);   // html을  largeImg 넣어주어라
               
       }, // end of success: function(data) ---------------------
       
       error: function(request, status, error){ 																	
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        } // end of error: function(request,status,error)
   
    
    }); // end of $.ajax -------------------- 
    
	}
	else {
		alert("로그인후 이용가능합니다.");
	}
    
 }

		
		

function golikeOff(likestory_no, likememberno, likecount) {
	
	if(${(sessionScope.loginuser.memberno != null)}){
	
    var form_data = {likestory_no : likestory_no,
    			 	 likememberno : likememberno,
    			 	 likecount : likecount};
    
    $.ajax({
       url : "<%= request.getContextPath() %>/story/getlikeswitch.action",
       type : "POST",
       data : form_data,  
       dataType : "JSON", 
       
       success: function(data) {  
    	   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
       
             // data 는 ajax 요청에 의해 url 페이지 getLargeImgFilename.action 으로 부터 리턴받은 데이터
                       
             $('#love'+likestory_no).empty();
             // <div id="largeImg"> 엘리먼트를 모두 비워서 새로운 데이터를 받을수 있게 해라
              
             var html = "";
             
             html = "<img src='<%= request.getContextPath() %>/resources/img/nolike.png' alt='' style=' width:25px; height:25px;' class='my_like' onClick='golikeOn(" +data.Story_no+",${sessionScope.loginuser.memberno},0);'>";
            	 
             
               	 $('#love'+likestory_no).html(html);   // html을  largeImg 넣어주어라
               
       }, // end of success: function(data) ---------------------
       
       error: function(request, status, error){ 																	
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        } // end of error: function(request,status,error)
       
    }); // end of $.ajax --------------------
   
	}
	else {
		alert("로그인후 이용가능합니다.");
	}
    
 }
		

</script>



</head>
<body>

<div class="divide80" align="center" style="padding-top: 23px;">
		<form name="searchFrm">
			<select name="colname" id="colname">
				<option value="nickname">닉네임</option>
				<option value="story_tag">해쉬태그</option>
			</select>
			<input type="text" name="search" id="search" size="40px"/>
			<img class="my_like" src="<%= request.getContextPath() %>/resources/img/search.jpg" alt="" style="width:32px; height:32px;" onClick="goSearch();" >
		
		</form> 
</div>
	
 <div class="blog-masonary-wrapper" >
      <div class="container mas-boxes" style="width: 1100px;">
           <c:forEach var="map" items="${storyList}" varStatus="status">
          
           
	 <!-- 공개글만 보여주기 -->	
	<c:if test="${(map.STORY_PUBLICSTATUS == 1 && map.STORY_STATUS == 1)}">
	 	
          <div class="mas-boxes-inner"  style="width: 300px; margin-left:40px; float: left;" >
                
             <div style="width: 95%; height:55px;">
             	<div style="float: left;">
               		<img src="<%= request.getContextPath() %>/resources/img/user.png" alt="" style=" width:40px; height:40px; margin-top: 15px; margin-left: 15px; ">
               	</div>
               
               	<div style="margin-top: 20px; float: left;">	
               	<a href="<%= request.getContextPath() %>/myroom/myroom.action?memberno_fk=${map.MEMBERNO_FK}">
               		&nbsp;&nbsp;<span style="font-weight: bold;">${map.NICKNAME}</span>
               	</a>
               		
               	</div> 
				               		
				               		
				               		
				<c:set var="likecount" value="0" />  
               	
					<c:forEach var="like" items="${likeList}" >
					
						
						<c:if test="${(like.LIKEMEMBERNO == sessionScope.loginuser.memberno && like.LIKESTORY_NO == map.STORY_NO)}">     
							<c:set var="likecount" value="${likecount + 1}" />
						</c:if> 
																	
						<c:if test="${(like.LIKEMEMBERNO != sessionScope.loginuser.memberno || like.LIKESTORY_NO != map.STORY_NO)}"> 
							<c:set var="likecount" value="${likecount}" />
						</c:if>	 
						
						
					</c:forEach>	
					
					
					<c:if test="${(likecount == 1)}">
						<div class ="love" id="love${map.STORY_NO}" style="float: right; margin-top: 20px;">
						
							<img src="<%= request.getContextPath() %>/resources/img/like.png" alt="" style=" width:25px; height:25px;" class="my_like" onClick="golikeOff('${map.STORY_NO}','${sessionScope.loginuser.memberno}','${likecount}');" >
						
						</div> 
					</c:if>
					
					<c:if test="${(likecount == 0)}">
						<div class="love" id="love${map.STORY_NO}" style="float: right; margin-top: 20px;">
					
							<img src="<%= request.getContextPath() %>/resources/img/nolike.png" alt="" style=" width:25px; height:25px;" class="my_like" onClick="golikeOn('${map.STORY_NO}','${sessionScope.loginuser.memberno}','${likecount}');" >
				
						</div>
					</c:if> 
					
				  	
				        
             </div>
                <div class="mas-blog-inner"  align="center" style="height:300px; width:300px; padding: 10px;" >
                
                	<c:if test="${(map.THUMBNAILFILENAME == null)}">
                		<a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${map.STORY_NO}&memberno=${map.MEMBERNO_FK}">
                			<img src="<%= request.getContextPath() %>/resources/img/cute.jpg" style=" width:280px; height:280px; ">
                		</a>
                	</c:if>
                		
                	<c:if test="${(map.THUMBNAILFILENAME != null)}">
                		<a href="<%= request.getContextPath() %>/story/storydetail.action?story_no=${map.STORY_NO}&memberno=${map.MEMBERNO_FK}">
                			<img src="<%= request.getContextPath() %>/resources/files/${map.THUMBNAILFILENAME}" style=" width:280px; height:280px; ">
                    	</a>	
                    </c:if>
                    
                </div><!--blog inner-->
          </div>
         
     </c:if>           
          
       
			<%-- <c:if test="${(status.count % 3) == 0}">
			</c:if>  
			 --%>
		</c:forEach>
    
                
                
                
                
                
                
                
                
		</div>
	</div>
</body>
</html>