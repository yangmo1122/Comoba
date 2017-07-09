<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	

</style>

<script type="text/javascript">
    
    function goWrite(){
    	var addWriteFrm = document.addWriteFrm;
    	
    	
    	addWriteFrm.submit();
    }
    
</script>

<div style="padding-left: 10%; border: solid 0px red;">

	<h3 style="text-align: center; color: gray;">자유게시판상세보기</h3>
	
	<table id="table"style="border: solid 0px red; width: 70%; margin: auto;">
	
			<tr>
				<th style="width: 15%; text-align: center;">글번호</th>			
				<td>${boardvo.board_no}</td>
				</tr>
			
				<tr>
				<th style="width: 15%; text-align: center;">닉네임</th>
				<td>${boardvo.nickname}</td> 
				</tr>
			
			
				<tr>
				<th style="width: 15%; text-align: center;">제목</th>
				<td>${boardvo.subject}</td>
				</tr>
				
				<tr>
            	<th style="width: 15%; text-align: center;">내용</th>
            	<td  class="long" style="height: 200px;">${boardvo.content}</td>
         		</tr>
         		
         		<tr>
            	<th style="width: 15%; text-align: center;">조회수</th>
            	<td>${boardvo.readCount}</td>
         		</tr>
         	
         	
         		<tr>
            	<th style="width: 15%; text-align: center;">날짜</th>
            	<td>${boardvo.writedate}</td>
				</tr> 	

		<tr>
			<th>첨부파일</th>
			<td>
			   <a href="<%= request.getContextPath() %>/ourroom/download.action?board_no=${boardvo.board_no}"> 
				${boardvo.orgFilename}
			   </a>	
			</td>
		</tr>
		
		<tr>
			<th>파일크기(bytes)</th>
			<td>${boardvo.fileSize}</td>
		</tr> 

		
	
	</table>
	
</div>
	
	<br/>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/ourroom/freeboard.action'">목록보기</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.action?board_no=${boardvo.board_no}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/ourroom/del.action?board_no=${boardvo.board_no}&memberno_fk=${boardvo.memberno_fk}'">삭제</button>
		
		
	<br/>
	<br/>
	
	<!-- ===== #83. 댓글쓰기 폼 추가 ===== -->
	
	<div align="center">
	<form name="addWriteFrm" action="<%= request.getContextPath() %>/addComment.action" method="get" >     
	  	     <input type="hidden" name="email" value="${sessionScope.loginuser.email}" readonly />
	     <div>
            <div>글쓴이 : <input type="text" name="nickname" value="${sessionScope.loginuser.nickname}"  style="width: 10%" readonly /> 
                                         댓글 : <input type="text" name="comment_content" class="long"  style="width: 50%" />
            <input type="button" value="입력" id="createbt" onClick="goWrite();" /></div>
          </div>
	     
	     
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글) -->
	    <input type="hidden" id="together_no" name="together_no" value="${boardvo.board_no}" />    
	    <input type="hidden" id="boardtype"  name="boardtype" value="3" />    
	  </form>
</div>
	<br/>
	<br/>
	<!-- ===== #93. 댓글 내용 보여주기 ===== -->
	<table id="table2" align="center" style="width: 60%; text-align: center; ">
		<c:forEach var="commentvo" items="${commentList}"  varStatus="status">
		<tr>
		<th>
		<div class="profile_photo">
        <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png" width="100" height="100">
                              
							       ${commentvo.comment_content}   </br>
							    
							            닉네임 : ${nickname.get((status.index))}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							            날짜    :  ${commentvo.comment_date}
							          
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.action?board_no=${boardvo.board_no}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/ourroom/del.action?board_no=${boardvo.board_no}&memberno_fk=${boardvo.memberno_fk}'">삭제</button>
	
		</div>
									
		</th>
		</tr>
		</c:forEach>
		
	
	</table>




