<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<style type="text/css">

#live-title{
	width: 100%;
	height: 60px;
	/* border-bottom: 1px solid gray; */
	border-top: none;
}

.star{
	width: 25px;
	height: 25px;
}

#give-star{
	width: 100%;
	height: 50px;
	/* border-bottom: 1px solid gray; */
}

#live-comment{
	font-size: 11pt;
}

#comment-write{
	width: 80%;
	float: left;
}

.liststyle{
	
}



</style>

<script type="text/javascript">

	$(document).ready(function(){
		var cnt3 = 0;
		$("#downloadfiles").hide();
		
		$("#files").click(function(){
			
			cnt3++;
			if(cnt3 == 1){
				$("#downloadfiles").show();
			}
			
			else if(cnt3 > 0){
				$("#downloadfiles").hide();
				cnt3 = 0;
			}
		});
	});
	

	
	
	function goAddLiveviewcnt(){
		alert("눌렀어");
		<c:if test="${livedetail.STATUS == 1}">
		alert("들어왔어");
		
		// ajax 요청으로 전송을 할것이므로 submit 요청을 하면 안되고 아래처럼 ajax 처리로 전송을 해야만 비동기 방식이라 새페이지 갱신이 없으므로 깜박임이 없다.
			
		var form_data = {onair_no : $("#onair_no").val()}; // 키값:밸류값
		
		$.ajax({
			url: "<%= request.getContextPath() %>/live/addLiveviewcnt.action",
			type:"POST",                          // method
			data: form_data,                        // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
			success: function() {                   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
				
			},
			error: function(request, status, error){
				   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}          
		});
		
		</c:if>
		<c:if test="${livedetail.STATUS != 1}">
			return;
		</c:if>
	}

	
	function goStars(){
		
		if(${sessionScope.loginuser == null}){
			alert("로그인을 먼저 하세요.");
			return;
		}
		else if(${checkstar} == 0){
			var form_data = {liveno : ${live_no}
							,stars : $("#selectstar").val()}; // 키값:밸류값

			$.ajax({
				url: "<%= request.getContextPath() %>/live/givestars.action",
				type:"POST",                          // method
				data: form_data,                        // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
				dataType: "JSON",
				success: function(data) {                   // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
					alert("별점이 등록되었습니다 :)");
					
					$("#star").empty();
					
					var html = "";
					html += data.AFTERSTARS;
					
					$("#star").html(html);
				},
				error: function(request, status, error){
					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}          
			});
		}
		else if(${checkstar} == 1){
			alert("이미 참여하셨습니다.");
			return;
		}
	}

	
	// 댓글
	function goWrite(){
		
    	<%-- var form_data = {loginmemberno : "20",//$("#loginmemberno").val(),               // 키값:밸류값
		    			nickname : "태봉이",//$("#nickname").val(),  
		    			together_no : "88",//$("#together_no").val(),
		    			comment_content : "안녕",//$("#live-comment").val(),
		    			boardtype : "2"//$("#boardtype").val()
		    		    };

    	$.ajax({
    		url : "addComment.action" ,   // action 에 해당하는 URL 속성값
    		type :"GET",                              // method
    		data : form_data,                           // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
    		dataType : "JSON",                          // URL 페이지로 부터 받아오는 데이터타입
    		success : function(data) {                  // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
    			alert("ㅎㅎㅎㅎ");
    			$("#comment-contentbox").empty();
    			$("#commentCnt").empty();
		
    			var html = "";
    		
    			html += "<table>";
    		//	html += "<c:if test='${commentList != null}'>";
    		//	html += "<c:forEach var='comment' items='${commentList}'>";
    		
    			 $.each(data, function(entryIndex, entry){ 
    			
    				 	html += "<tr class='liststyle'>";
    	    			html += "<td>";
    	    			html += "<div style='float: left; width: 60px; height: 60px; padding-top: 10px; padding-left: 10px;'>";
    	    			html += "<img src='<%= request.getContextPath() %>/resources/images/user.png' style='width: 40px; height: 40px;'>";
    	    			html += "</div>&nbsp;";
    	    			html += "<div style='float: left; width: 90%;'>";
    	    			html += "<span id='writernickname' style='font-weight: bold; font-size: 13pt; color: #000;'>"+entry.J_NICKNAME+"</span><br/>";
    	    			html += "<span id='writtencontents'>"+entry.J_COMMENT_CONTENT+"</span>&nbsp;&nbsp;<span id='writedate' style='color: #3498db; font-size: 9pt;'>"+entry.J_COMMENT_DATE+"</span>";	
    	    			html += "</div><br/><br/>";	
    	    			html += "</td>";
    	    			html += "</tr>";
    	    			html += "<tr><td><br/></td></tr>"; 
    	    			
    	    			/* html += "<tr><td>";
    	    			html += entry.J_COMMENT_CONTENT;
    	    			html += "</td></tr>"; */
    	    			
 				}); 
 				
 				//alert(data.length);
 				
 				/* for(var i=0; i<data.length; i++) {
 					
 					if(i>0) break;
 					
 					var content = "안태연" + (i+1);
 					
 					html += "<tr><td>";
 					html += content;
 					html += "</td></tr>";
 					
 				} */
 			/* 	
 				html += "<tr><td>";
    			html += data[i].comment_content+"<br/>";
    			html += "</td></tr>" */
    			
    		//	html += "</c:forEach>";
    		//	html += "</c:if>";	
    			html += "</table>";	
    		
    			alert(html);
    		 //   $("#hhh").text(html);
    			
			//	$("#comment-contentbox").append(html);
			$("#comment-contentbox").html(html);
			 //	alert("dd"+${commentcnt});
				
			//	$("#commentCnt").append(${commentcnt}); 
 
				
	 		},
	 		error: function(request, status, error){
	 			   alert("실패!!");
				   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}          
		});
    
 --%>
	 	var writeFrm = document.writeFrm;
	 	writeFrm.submit();
 		
	}
	
	
</script>


	<div class="divide80"></div>

	<div class="container">
		
		<div id="live-title" class="post-detail">
			<div style="width: 80%; float:left">
				<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 50px; height: 50px;">&nbsp;
				<span style="font-weight: bold; font-size: 13pt; color: #000;"><a href="<%= request.getContextPath() %>/myroom/myroom.action?memberno_fk=${map.MEMBERNO_FK}">${membervo.nickname}</a></span>
			</div>
			<div align="right" style="width: 20%; float: left; margin-top: 20px;">
				조회수 ${livedetail.GONG_VIEWS}
			</div>
		</div>
		<div align="right" style="width: 100%; float: left; margin-top: 10px;">
		<c:if test="${filelist != null }">
		<span id="files">첨부파일(${filelist.size()})</span>
		<div class="panel panel-default" id="downloadfiles" style="width: 10%; height: 30px;">
		
		<c:forEach var="map" items="${filelist}">
				<img src="<%= request.getContextPath() %>/resources/images/live/download.png">
				<a href="<%= request.getContextPath()%>/download.action?fileName=${map.FILENAME}&orgFilename=${map.ORGFILENAME}">${map.ORGFILENAME}</a>
				<c:if test="${filelist.size() > 0}"><br/></c:if>
		</c:forEach>
		
		</div>
		</c:if>
		</div>
		
		<div class="divide30"></div>
		
		
		<div style="float:left; width: 100%;">
		<img src="<%=request.getContextPath() %>/resources/files/${livedetail.FILENAME}" alt="" width="700px" height="auto">
		</div>
		
		<div class="divide30" style="float: left;"></div>
		
		<div style="float:left; width: 70%;">
		<h3 style="padding-top: 30px;">${livedetail.GONG_TITLE}</h3>
		<span>${livedetail.WRITEDATE}</span>
		
		<div class="divide30" style="float: left; width: 100%;"></div>
		
		<p style="font-size: 12pt; color: #000">
			${livedetail.GONGLIVE_CONTENTS}
		</p>
		
		<div class="divide30" style="float: left; width: 100%;"></div>
		<strong>${onaircnt}</strong>번째 방송 코멘트<br/>
		<p>
			${livedetail.COMMENTS}
		</p>
		
		<br/><br/>
		
		
		<div id="connect-link" style="margin-top: 30px;">
			<a href="${livedetail.GONG_LINK2}" target="_blank" onClick="goAddLiveviewcnt();"><span style="font-size: 12pt; color: #000; text-decoration: underline; background-color: #fefac7;">☞라이브 보러가기</span></a> 
			
		</div>
		
		</div>
		
		<div class="sidebar-box margin40" style="float: right; width: 25%; padding-top: 5%;">
            <h4>About ${membervo.nickname}</h4>
            <ul class="list-unstyled cat-list">
                <li> <a href="#">라이브방송 횟수</a> <i class="fa fa-angle-right"></i>${onaircnt}</li>
                <li> <a href="#">절대공부시간</a> <i class="fa fa-angle-right"></i>${membervo.hours}시간 ${membervo.minutes}분</li>
                <li> <a href="#">???</a> <i class="fa fa-angle-right"></i></li>
                <li> <a href="#">???</a> <i class="fa fa-angle-right"></i></li>
            </ul>
        </div>
		
		<div class="divide80" style="clear:both;"></div>
		
		<div id="give-star" class="blog-post" align="right" style="clear: both;">
			<img class="star" src="<%= request.getContextPath() %>/resources/images/live/star1.png">&nbsp;<span id="star" style="font-size: 11pt;">${livedetail.STARPOINT}</span><span style="font-size: 11pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별점주기</span>
			<select id="selectstar">
			<option value="5">★★★★★</option>
			<option value="4">★★★★☆</option>
			<option value="3">★★★☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="1">★☆☆☆☆</option>
			</select>&nbsp;&nbsp;
			<button class="btn btn-default" onClick="goStars();" style="height: 30px; ">확인</button>
		</div>
		
		
		
		<!-- 댓글  -->	
		<div id="comment-box" style="width: 100%; height: auto;">
			<h4>댓글쓰기 <span id="commentCnt">${commentcnt}</span>개</h4>
			<form name="writeFrm" method="get" action="<%=request.getContextPath()%>/live/addComment.action">
				<input type="hidden" id="loginmemberno" name="loginmemberno" value="${sessionScope.loginuser.memberno}" readonly />
				<input type="hidden" id="nickname" name="nickname" value="${sessionScope.loginuser.nickname}" />
				<input type="hidden" name="memberno" value="${membervo.memberno}" />
				<input type="hidden" name="liveno" value="${live_no}" />
				<div id="comment-write" align="center">
					<textarea name="comment_content" id="live-comment" style="width: 100%; height: 80px; float:left;" placeholder="주제와 무관한 댓글이나 악플은 경고조치없이 삭제되며 징계대상이 될 수 있습니다."></textarea>
					<button class="btn" style="margin-top: 10px; background-color: #3498db; float: right;" onClick="goWrite();"><span style="color: white;">작성하기</span></button>
				</div>
				
				<!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글) -->
			    <input type="hidden" id="together_no" name="together_no" value="${live_no}" />    
			    <input type="hidden" id="boardtype"  name="boardtype" value="2" />    
			</form>
			
			<div class="divide50" style="float: left;"></div>
			<div id="comment-contentbox">
			 <table>
			<c:if test="${commentList != null}">
			<c:forEach var="comment" items="${commentList}">
			
			<tr class="liststyle">
				<td>
				<div style="float: left; width: 60px; height: 60px; padding-top: 10px; padding-left: 10px;">
				<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;">
				</div>&nbsp;
				<div style="float: left; width: 90%;">
				<span id="writernickname" style="font-weight: bold; font-size: 13pt; color: #000;">${comment.nickname}</span><br/>
				<span id="writtencontents">${comment.comment_content}</span>&nbsp;&nbsp;<span id="writedate" style="color: #3498db; font-size: 9pt;">${comment.comment_date}</span>
				</div><br/><br/>
				</td>
			</tr>
			
			<tr><td><br/></td></tr>
			</c:forEach>
			</c:if>
			</table> 
			</div>
			
			이전페이지 [1] [2] [3] [4] [5] 다음페이지
		</div>
		
	</div>
	
	<!-- ////////////////////////////////// -->
	<!-- <div id="hhh"></div> -->
	<!-- /////////////////////////////////// -->
	
	<div class="divide60"></div>
	
	<form><%-- 서브밋으로 전송을 하지 않고 ajax 요청으로 서버로 전송하므로 action 과 method 의 기술은 자바스크립트 함수에서 기재하도록 한다. --%>
		<input type="hidden" id="onair_no" name="onair_no" value="${livedetail.ONAIR_NO}">
	</form>
	
<%-- 	
<tr class="liststyle">
				<td>
				<div style="float: left; width: 60px; height: 60px; padding-top: 10px; padding-left: 10px;">
				<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;">
				</div>&nbsp;
				<div style="float: left; width: 90%;">
				<span style="font-weight: bold; font-size: 13pt; color: #000;">태봉이</span><br/>
				<span>이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.</span>&nbsp;&nbsp;<span style="color: #3498db; font-size: 9pt;">2017-06-14</span>
				</div><br/><br/>
				</td>
			</tr>


<div class="liststyle">
				<div style="float: left; width: 60px; height: 60px; padding-top: 10px; padding-left: 10px;">
				<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;">
				</div>&nbsp;
				<div style="float: left; width: 90%;">
				<span style="font-weight: bold; font-size: 13pt; color: #000;">태봉이</span><br/>
				<span>이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.</span>&nbsp;&nbsp;<span style="color: #3498db; font-size: 9pt;">2017-06-14</span>
				</div>
			</div>
			
			<div class="liststyle">
				<div style="float: left; width: 60px; height: 60px; padding-top: 10px; padding-left: 10px;">
				<img src="<%= request.getContextPath() %>/resources/images/user.png" alt="" style="width: 40px; height: 40px;">
				</div>&nbsp;
				<div style="float: left; width: 90%;">
				<span style="font-weight: bold; font-size: 13pt; color: #000;">태봉이</span><br/>
				<span>이 사람꺼 공부 진짜 잘됨. 딴짓할라가도 자극받아서 같이 공부하게됨.</span>&nbsp;&nbsp;<span style="color: #3498db; font-size: 9pt;">2017-06-14</span>
				</div>
			</div> --%>