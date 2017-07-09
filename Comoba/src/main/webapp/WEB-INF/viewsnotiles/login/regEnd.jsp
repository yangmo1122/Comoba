<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/BootStrapStudy/css/bootstrap.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-2.0.0.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/BootStrapStudy/js/bootstrap.js"></script>
<script type="text/javascript">

	<c:if test="${n == 1}">
		alert("회원정보추가 성공 !!");
		location.href="<%=request.getContextPath()%>/login.action";
	</c:if>

	<c:if test="${n == 0}">
		alert("회원정보추가 실패 !!");
		javascript: history.back();
		// 이전 페이지로 이동
	</c:if>
	
</script>
