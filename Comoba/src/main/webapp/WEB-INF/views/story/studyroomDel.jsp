<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("스터디룸 삭제 성공!!");
			location.href="<%= request.getContextPath() %>/ourroom/studysearch.action";       
		</c:if>
		
		<c:if test="${n != 1}">
			alert("스터디룸 삭제 실패!!");
			javascript:history.back();
			// 이전 페이지로 이동
		</c:if>
	</script>




