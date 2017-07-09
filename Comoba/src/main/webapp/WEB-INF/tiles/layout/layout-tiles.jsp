<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레이아웃...?</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
 <%--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/BootStrapStudy/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/BootStrapStudy/js/bootstrap.js"></script> --%>
  
  <style type="text/css">

 	#mysideinfo		{ float:right;  width:auto%; min-height:100px; padding-top: 50%;}
	
	/* #displayRank 	{ margin:20px; height:200px;} */
	

	
	/* mouse over link */

	/* 
	  unvisited link 
	a:link {color: #FF0000;}
		
	  visited link 
	a:visited {color: #00FF00;}
		
	  selected link 
	a:active {color: #0000FF;}
	*/
	
	
	</style>
	
</head>
 
<body>
	<div id="mycontainer">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
	<c:if test="${sessionScope.loginuser != null}">
	 	<div id="mysideinfo" style="position: fixed; right: 20px; bottom:70%;" >
			<tiles:insertAttribute name="sideinfo" />
		</div> 
		</c:if>

		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>


</html>

