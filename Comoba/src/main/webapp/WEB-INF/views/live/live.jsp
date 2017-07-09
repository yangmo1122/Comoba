<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

/* #3498db */

.star{
	width: 20px;
	height: 20px;
}

.clock{
	width: 50px;
	height: 30px;
}

.clock-position{
	position:absolute; top:15px; right:15px;
}


</style>

    <div class="divide80"></div>
    
    <div class="blog-masonary-wrapper">
        <div class="container mas-boxes">
        
        	<c:if test="${onairlist == null || empty onairlist}">
	        	<div style="width: 100%; height: 500px; align:center;">
	        		<span style="font-size: 15pt;">"현재 라이브 중인 방송이 없습니다 :) 가장먼저 공라이브를 시작해보세요"</span>
	        	</div>
        	</c:if>
        	<c:if test="${onairlist != null}">
        	<c:forEach var="map" items="${onairlist}">
            <div class="mas-boxes-inner ty_box">
                	<img src="<%=request.getContextPath() %>/resources/files/${map.FILENAME}" alt="" class="img-responsive">
                <div class="clock-position">
                	<img class="clock" src="<%= request.getContextPath() %>/resources/images/live/live1.png" alt="">
                </div>
                <div class="mas-blog-inner">
                    <h3><a href="<%= request.getContextPath() %>/live/livedetail.action?live_no=${map.LIVE_NO}&memberno=${map.MEMBERNO_FK}">${map.GONG_TITLE}</a></h3>
                    <ul class="list-inline post-detail">
                        <li>by <a href="<%= request.getContextPath() %>/myroom/myroom.action?memberno_fk=${map.MEMBERNO_FK}">${map.NICKNAME}</a></li>
                        <li><i class="fa fa-calendar"></i> ${map.WRITEDATE}</li>                            
                    </ul>
                    <p>
                        ${map.GONGLIVE_CONTENTS}
                    </p>
                    <div align="right"><img class="star" src="<%= request.getContextPath() %>/resources/images/live/star1.png">&nbsp;${map.STARPOINT }</div>
                </div><!--blog inner-->
            </div>
             </c:forEach>
            </c:if>
           
               
        </div>
       
    </div><!--masonary wrapper-->
    <div class="divide60"></div>

        <!--masonary js-->
        <script src="<%= request.getContextPath() %>/resources/js/jquery.masonry.min.js" type="text/javascript"></script>
        
               
        <!--customizable plugin edit according to your needs-->
        <script src="<%= request.getContextPath() %>/resources/js/custom.js" type="text/javascript"></script>
        <script src="<%= request.getContextPath() %>/resources/js/masonary-custom.js" type="text/javascript"></script>
        
        