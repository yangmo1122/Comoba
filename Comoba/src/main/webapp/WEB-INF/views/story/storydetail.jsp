<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

.btnWrite{
  background:#99c2ff;
  color:#fff;
  border:none;
  width:80px;
  height:40px;
  position:absolute; top:437px;  right:350px;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#99c2ff;
}
button:before,button:after{
  content:'';
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #99c2ff;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
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

</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript">





$(document).ready(function(){
	
	$('[data-toggle="popover"]').popover();   
   	
 });
  
 
 
function goWrite(){
	var commentFrm = document.commentFrm;
	
	
	commentFrm.submit();
}

		


		function golikeOn(likestory_no, likememberno, likecount) {
			
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
		             $('#likeCT').empty(); 
		             // <div id="largeImg"> 엘리먼트를 모두 비워서 새로운 데이터를 받을수 있게 해라
		              
		             var html1 = "";
		             
		             var html2 = "";  
		              
		            	 html1 = "<img src='<%= request.getContextPath() %>/resources/img/like.png' alt='' style=' width:25px; height:25px;' onClick='golikeOff(${storyDetailmap.STORY_NO},${sessionScope.loginuser.memberno},1);'>";
		            
		            	 html2 = data.LikeNumber+"개";
		             
		               	 $('#love'+likestory_no).html(html1);   // html을  largeImg 넣어주어라
		               	 
		                 $('#likeCT').html(html2);   // html을  largeImg 넣어주어라
		                
		       }, // end of success: function(data) ---------------------
		       	
		       error: function(request, status, error){ 																	
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        } // end of error: function(request,status,error)
		       
		    }); // end of $.ajax --------------------  
		
		 }


		function golikeOff(likestory_no, likememberno, likecount) {
			
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
		             $('#likeCT').empty();  
		             // <div id="largeImg"> 엘리먼트를 모두 비워서 새로운 데이터를 받을수 있게 해라
		              
		             var html1 = "";
		             
		             var html2 = "";
		              
			             html1 = "<img src='<%= request.getContextPath() %>/resources/img/nolike.png' alt='' style=' width:25px; height:25px;' onClick='golikeOn(${storyDetailmap.STORY_NO},${sessionScope.loginuser.memberno},0);'>";
			             
			             html2 = data.LikeNumber+"개";
			            	
			               	 $('#love'+likestory_no).html(html1);   // html을  largeImg 넣어주어라
			                 
			               	 $('#likeCT').html(html2);   // html을  largeImg 넣어주어라
		                
		       }, // end of success: function(data) ---------------------
		       
		       error: function(request, status, error){ 																	
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        } // end of error: function(request,status,error)
		       
		    }); // end of $.ajax --------------------  
		
		}
		
		
		
		
		
	 	function goFollowing(){
			
		      var form_data = {followmemberno : ${storyDetailmap.MEMBERNO_FK},
		                  mymemberno : ${sessionScope.loginuser.memberno},
		                  checkfollow : '0' }; // 키값:밸류값

		      $.ajax({
		      url: "<%= request.getContextPath() %>/story/following.action",
		      type:"POST",                          // method
		      data: form_data,                        // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
		      success: function(data) {                 // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
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
		      
		      var form_data = {followmemberno : ${storyDetailmap.MEMBERNO_FK},
		                  mymemberno : ${sessionScope.loginuser.memberno},
		                  checkfollow : '1'}; // 키값:밸류값

		      $.ajax({
		      url: "<%= request.getContextPath() %>/story/following.action",
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



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="divide80"></div>

 <div class="blog-masonary-wrapper" >
 
 
             <div class="container mas-boxes" style="width: 880px; height: 480px;">
                <div class="mas-boxes-inner" style="width: 49.5%; height: 480px; float: left;" >
                
            
             	<div style="float: left;">
               		<img src="<%= request.getContextPath() %>/resources/img/user.png" alt="" style=" width:40px; height:40px; margin-top: 15px; margin-left: 15px; "> 
               	</div>
               	
               	<div style="margin-top: 20px; float: left;">
               		
               		<a href="<%= request.getContextPath() %>/myroom/myroom.action?memberno_fk=${storyDetailmap.MEMBERNO_FK}">
               			&nbsp;&nbsp;<span style="font-weight: bold;">${storyDetailmap.NICKNAME}</span>
               		</a>
               		
               	</div>
                
                <div style="margin-top: 20px; margin-right: 10px; float: right;">
               		<span id="div_follow" style="margin-left: 10px;">
						<c:if test="${checkfollow == 0}">
							<button type="button" class="btn btn-follow" onClick="goFollowing();">팔로우</button>
						</c:if> 
						<c:if test="${checkfollow == 1}">
							<button type="button" class="btn btn-following" onClick="goUnfollowing();">팔로잉</button>
						</c:if>
					</span> 
               	</div> 
     
            
         <div class="mas-blog-inner" style="padding: 10px; margin-top: 15% " > 
                  
<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	 
                  
<!-- Wrapper for slides -->

<div class="carousel-inner" role="listbox" style="height:397px; width:400px;">
	<c:forEach var="storyDetailImagemap" items="${storyDetailImageList}" varStatus="status">
<c:if test="${status.index == 0}">
<div class="item active">
  		<img src="<%= request.getContextPath() %>/resources/files/${storyDetailImagemap.FILENAME}" style="width: 400px; height: 397px;" >
</div>
</c:if>
<c:if test="${status.index > 0}">
<div class="item">
 		<img src="<%= request.getContextPath() %>/resources/files/${storyDetailImagemap.FILENAME}" style="width: 400px; height: 397px;" >
</div>
</c:if>
</c:forEach>
		<c:if test="${(storyDetailImagemap.FILENAME == null)}">
			<img src="<%= request.getContextPath() %>/resources/img/cute.jpg" style=" width:400px; height:397px; ">
		                		
		</c:if>
</div>

<!-- Left and right controls -->
 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
 
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
     
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      
    </a>	
	</div>
	
	
		</div><!-- 블로그 -->
	
                     
                </div><!-- 박스 -->
              
         <div style="border: solid 1px gray; height: 480px; width:1px; float: left;"></div>
                
                     
          
            <div class="mas-boxes-inner" style="width: 49.5%; height: 480px; float: left;" >
             		<div align="right" style="padding-right:7px; font-size:10px; width: 15%; float: right;">
						조회수&nbsp;&nbsp;&nbsp;${storyDetailmap.READCOUNT}
					</div>
            		
            	<c:if test="${(storyDetailmap.MEMBERNO_FK == sessionScope.loginuser.memberno)}">	
               		<a href="<%= request.getContextPath() %>/story/storydelete.action?story_no=${storyDetailmap.STORY_NO}">
               			<img src="<%= request.getContextPath() %>/resources/img/eraser.png" style=" float:right; margin:5px; width:15px; height:15px;">
               		</a>
               		<a href="<%= request.getContextPath() %>/story/storyedit.action?story_no=${storyDetailmap.STORY_NO}">
               			<img src="<%= request.getContextPath() %>/resources/img/edit.png" style=" float:right; margin:5px; width:15px; height:15px;">
               		</a>
               	</c:if>	
             		
 	              <div class="mas-con-inner" style=" height: 150px; margin-top: 23px; margin-left: 20px; margin-right: 20px;" >
 	             	 ${storyDetailmap.STORY_CONTENTS}
 	              </div>
 	             
         	<div class="mas-blog-inner" style="padding: 3px; " > 
 	             <div class="mas-hash-inner" style=" height: 20px;" >
 	             	<span class="hashtag" style="font-size:10px; color:blue; font-weight: bold; height:20px; float: left; margin-left: 10px; ">
 	             	${storyDetailmap.STORY_TAG}
 	             	<!-- #페이스북
 	             	</span>
 	             	<span class="hashtag" style="font-size:10px; color:blue; font-weight: bold; height:20px; float: right; margin-right: 8px; ">
 	             	#캬라멜마끼야또
 	             	</span> 
 	             	<span class="hashtag" style="font-size:10px; color:blue; font-weight: bold; height:20px; float: right; margin-right: 8px; ">
 	             	#곰돌이인형 -->
 	             	</span>
 	             </div>
 	         <div class="mas-like-inner" style=" height: 30px; border-bottom: solid #f2f2f2 1px;" >
 	        
 	        <c:set var="likecount" value="0" />  
               	
					<c:forEach var="like" items="${likeList}" >
					
						
						<c:if test="${(like.LIKEMEMBERNO == sessionScope.loginuser.memberno && like.LIKESTORY_NO == storyDetailmap.STORY_NO)}">     
							<c:set var="likecount" value="${likecount + 1}" />
						</c:if> 
																	
						<c:if test="${(like.LIKEMEMBERNO != sessionScope.loginuser.memberno || like.LIKESTORY_NO != storyDetailmap.STORY_NO)}"> 
							<c:set var="likecount" value="${likecount}" />
						</c:if>	 
						
						
					</c:forEach>	
					
					
					<c:if test="${(likecount == 1)}">
						<div class ="love" id="love${storyDetailmap.STORY_NO}" style="float: left; height: 25px; margin-left: 10px;">
						
							<img src="<%= request.getContextPath() %>/resources/img/like.png" alt="" style=" width:25px; height:25px;" class="my_like" onClick="golikeOff('${storyDetailmap.STORY_NO}','${sessionScope.loginuser.memberno}','${likecount}');" >
						
						</div> 
					</c:if>
					
					<c:if test="${(likecount == 0)}">
						<div class="love" id="love${storyDetailmap.STORY_NO}" style="float: left; height: 25px; margin-left: 10px;">
					
							<img src="<%= request.getContextPath() %>/resources/img/nolike.png" alt="" style=" width:25px; height:25px;" class="my_like" onClick="golikeOn('${storyDetailmap.STORY_NO}','${sessionScope.loginuser.memberno}','${likecount}');" >
				
						</div>
					</c:if> 
 	         
 	        <%--  <c:set var="likecount" value="0" />  
               	
					<c:forEach var="like" items="${likeList}" >
					
					
						<c:if test="${(like.LIKEMEMBERNO == storyDetailmap.MEMBERNO_FK && like.LIKESTORY_NO == storyDetailmap.STORY_NO)}">     
							<c:set var="likecount" value="${likecount + 1}" />
						</c:if> 
																	
						<c:if test="${(like.LIKEMEMBERNO != storyDetailmap.MEMBERNO_FK || like.LIKESTORY_NO != storyDetailmap.STORY_NO)}"> 
							<c:set var="likecount" value="${likecount}" />
						</c:if>	 
						
					</c:forEach>
					
						<c:if test="${(likecount == 1)}">
							<div style="float: left; height: 25px;">
								<img src="<%= request.getContextPath() %>/resources/img/like.png" alt="" style=" width:25px; height:25px;">
							</div> 
						</c:if>  
					
						<c:if test="${(likecount == 0)}">
							<div style="float: left; height: 25px;">
               					<img src="<%= request.getContextPath() %>/resources/img/nolike.png" alt="" style=" width:25px; height:25px;">
               				</div>
						</c:if> --%>
 	         
 	         
 	         
                
               	
               	<div id="likeCT" style="float: left; height:25px; margin-left: 20px; margin-top: 5px; font-size: 12px; font-weight: bold;">
               		${storyDetailmap.LIKECOUNT}개
               	</div>
               	<%-- 
               	 <div id="write" style="float: left; height: 25px;">
               		<img src="<%= request.getContextPath() %>/resources/img/write.png" alt="" style=" width:25px; height:25px; margin-left: 20px;">
               	</div> --%>
             </div>
             
                   
	  	  
            <form name="commentFrm" action="<%= request.getContextPath() %>/story/comment.action" method="get" >  
              <div class="mas-write-inner" style=" height: 70px; border-bottom: solid #f2f2f2 1px;"  >
           
           			<input type="hidden" name="together_no" value="${storyDetailmap.STORY_NO}" readonly />	
					<input type="hidden" name="boardtype" value="1" readonly />
					<input type="hidden" name="story_memberno_fk" value="${sessionScope.loginuser.memberno}" readonly />
					<input type="hidden" name="nickname" value="${sessionScope.loginuser.nickname}" readonly />
	<c:if test="${(sessionScope.loginuser.memberno != null)}">				  
					  <textarea name="review" rows="2" cols="60" maxlength="53" onclick="if(this.value=='댓글을 입력하세요...'){this.value=''}" style="margin-left:10px; font-size:11px; border:0; background-color:transparent; resize: none;" >댓글을 입력하세요...</textarea>
					  
					  <button class="btnWrite" onClick="goWrite();" style="text-align:center; font-size: 10px;">댓글쓰기</button>
	</c:if>			
	<c:if test="${(sessionScope.loginuser.memberno == null)}">
		<div style="text-align; font-size: 13px; ">
			댓글은 로그인 후 이용가능합니다.
		</div>	
	</c:if>	
		  
              </div>
            </form> 
             
       <c:forEach var="commentvo" items="${commentList}"  varStatus="status">
		
              <div class="mas-review-inner" style=" height: 75px; margin-top: 3px; " >
	               	 <span class="nickname" style="font-size:14px; font-weight: bold; display:inline-block; width:60px; text-align: center; float: left;">${nickname.get((status.index))}</span>
	               	 <span class="review" style="font-size:13px; display:inline-block; width:300px; height:40px; padding-left: 20px; line-height: 17px;">
	               	 ${commentvo.comment_content}</span>
	               	 <span class="date" style="font-size:12px; display:inline-block; width:100px; float:right; margin-right: 61px; color: #99c2ff;">${commentvo.comment_date}</span>
               	 </div> 
               	  	 
		</c:forEach>
     <%-- 
       	 <div class="mas-review-inner" style=" height: 60px;" >
        	 <span class="nickname" style="font-size:14px; font-weight: bold; display:inline-block; width:60px; text-align: center; float: left;">${nickname.get((status.index))}</span>
        	 <span class="review" style="font-size:13px; display:inline-block; width:300px; height:40px; padding-left: 20px; line-height: 17px;">
        	 ${commentvo.comment_content}</span>
        	 <span class="date" style="font-size:12px; display:inline-block; width:100px; float:right; margin-right: 61px; color: #99c2ff;">${commentvo.comment_date}</span>
       	 </div> --%>
             
          
				 
           <!-- ===== #115. 페이지바 보여주기 ===== -->
				
				
				
           	<div align="center" style=" font-size: 10px; padding-right: 30px;" > ${pagebar} </div>
           
               </div>
		</div>
	</div>
	</div>
	<br><br><br><br>
</body>
</html>