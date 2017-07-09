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
	function goDelete() {
		// 유효성 검사 생략
		var delFrm = document.delFrm;
		delFrm.action = "/main/ourroom/delEnd.action";
		delFrm.method = "post";
		delFrm.submit();
	}
</script>

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>댓글삭제</h1>
	
	<form name="delFrm">     
		<table id="table">
			<tr>
				<th>암호</th>
				<td>
					<input type="password" name="pw" class="short" />
					<input type="hidden"   name="board_no" value="${comment_no}" />
					<!-- 삭제해야할 글번호와 함께 암호를 전송해야 한다. -->
				</td>
			</tr>
		</table>
		
		<br/>
		<button type="button" onClick="goDelete();">삭제</button>
		<button type="button" onClick="javascript:history.back();">취소</button>
	
	</form>	
		
</div>











