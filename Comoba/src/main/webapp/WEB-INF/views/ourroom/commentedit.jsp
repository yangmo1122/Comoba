<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
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
	
	a{text-decoration: none;}	

</style>

<script type="text/javascript">
	function goUpdate() {
		// 유효성 검사 생략
		alert("여기니");
		var commenteditFrm = document.commenteditFrm;
		commenteditFrm.action = "/main/ourroom/commenteditEnd.action";
		commenteditFrm.method = "post";
		commenteditFrm.submit();
	}
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>댓글수정</h1>
	
	<form name="commenteditFrm">     
		<table id="table">
			<tr>
				<th>글번호</th>
				<td>${commentlist.comment_no}
					<input type="hidden" name="comment_no" value="${commentlist.comment_no}" />
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${commentlist.nickname}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="long" style="height: 200px;">${commentlist.comment_content}</textarea></td>
			</tr>
		
		</table>
		
		<br/>
		<button type="button" onClick="goUpdate();">완료</button>
		<button type="button" onClick="javascript:history.back();">취소</button>
	
	</form>	
		
</div>











