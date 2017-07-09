
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
       <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/summernote/summernote.css" rel="stylesheet">
        <!--template custom css file-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/css/style.css" rel="stylesheet">

		
		
        <script src="<%=request.getContextPath()%>/resources/jaeyeon/js/modernizr.js"></script>
       
         <!--제이쿼리-->
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        
        

<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 600px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 		

</style>

<script type="text/javascript">
	function goWrite() {
		// 유효성 검사는 생략 하겠음.
		var writeFrm = document.writeFrm;
	 	writeFrm.action = "/main/ourroom/addEnd.action";
		writeFrm.method = "post";
		writeFrm.submit();
		
		
	}
</script>
    <form name="writeFrm" enctype="multipart/form-data">	      
		<table id="table" style="border: solid 0px red; width: 70%; margin: auto;">
			<tr>
				<th>닉네임</th>
				<td>
					<input type="hidden" name="memberno_fk" id= "memberno_fk" value="${sessionScope.loginuser.memberno}" class="short" readonly />
				    <input type="text" name="nickname" id= "nickname" value="${sessionScope.loginuser.nickname}" class="short" readonly />
				    
				</td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td>		<select id="category" name="category"   class="btn btn-default dropdown-toggle">
												<option  value="1">스터디모집</option>
												<option  value="2">자유게시판</option>
												<option  value="3">스터디후기</option>
												<option  value="4">기타</option>
												</select>
				</td>
			</tr>
			
			<tr>
				<th>제목 </th>
				<td><input type="text" name="subject" id="subject"    class="long" /></td>
			</tr>
			<tr>
            	<th>내용</th>
            	<td><textarea name="content" id="content"  class="long" style="height: 200px;"></textarea></td>
         	</tr>
         	
         	<!-- ===== #133. 파일첨부 타입 추가하기 ===== -->
         	<tr>
         		<th>파일첨부</th>
         		<td><input type="file" name="attach" id="attach"  /></td>
         	</tr>
         	
		</table>
		<br/>		
                                                
		<input type="hidden" name="fk_seq"  value="${sessionScope.boardvo.fk_seq}" />                   		
		<input type="hidden" name="groupno" value="${sessionScope.boardvo.groupno}" />
		<input type="hidden" name="depthno" value="${sessionScope.boardvo.depthno}" />
		
		

		<button type="button" class="btn btn-primary btn-lg rounded" onClick="goWrite();">쓰기</button>
		<button type="button" class="btn btn-danger  btn-lg rounded" onClick="javascript:history.back();">취소</button>
	</form></head>




