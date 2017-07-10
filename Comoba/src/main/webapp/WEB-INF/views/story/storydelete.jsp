<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	
	.sm_margin{
		margin-left: 20px;
	}
	
	.sm_update{
		

		background-size: 30%;
		background-position: center;

	}
	#sm_update{
		

		background-size: 30%;
		background-position: center;

	}
	.sm_body{
	min-height:auto;
			background-size:cover;
			background-position:center;
			background-image:url('<%= request.getContextPath() %>/resources/img/sm/index.jpeg');
			color:#fff
	}
</style>

<title>Insert title here</title>

   <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!--dropzone-->
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/dropzone/basic.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/calendar/plugins/dropzone/dropzone.css" rel="stylesheet">
        <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/calendar/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/calendar/js/modernizr.js"></script>
        
        
</head>
<body>

<div class="divide80"></div>
 <div class="blog-masonary-wrapper" >
 
 	<form name="deleteFrm" enctype="multipart/form-data"> 
 	
 		<div class="container mas-boxes" style="width: 880px; height: 480px;">
 		
                <div class="mas-boxes-inner" style="width: 49.5%; height: 480px; float: left;" >
    			<div style="float: left;">
               		<img src="<%= request.getContextPath() %>/resources/img/user.png" alt="" style=" width:40px; height:40px; margin-top: 15px; margin-left: 15px; "> 
               	</div>
               	
               	<div style="margin-top: 20px; float: left;">
               		
               			&nbsp;&nbsp;<span style="font-weight: bold;">${storyDetailmap.NICKNAME}</span>
               		
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
			</div>
               
                    <div class="space-30" style="width: 100%;"></div>
                    	<div class="container" style="width: 100%; height: auto;">
                    	
                    	
                    	
              <input type="hidden" name="story_no" value="${storyDetailmap.STORY_NO}" readonly />
                  
                    	</div>
              
          
            
	</div>
		
	 <div style="border: solid 1px gray; height: 480px; width:1px; float: left;"></div>
                
                     
          
               <div class="mas-boxes-inner" style="width: 49.5%; height: 480px; float: left; "  >
              	
             			<div class="form-group sm_margin" ><br>
         					<input type="hidden" name="memberno_fk" value="${sessionScope.loginuser.memberno}" readonly />  
         					<input type="hidden" name="story_no" value="${storyDetailmap.STORY_NO}" readonly />
             					<div style="margin-top: 50px;">
             						
								</div>	
                        <label class="col-sm-2 control-label" style="height: 30px; width: 100px;">내용작성</label>
                        	<div class="col-sm-10">
                        <textarea class="form-control"  maxlength="250"  name="story_contents" style="min-height: 200px; resize: none;">${storyDetailmap.STORY_CONTENTS}</textarea>
                        	</div>
                        </div>
                        
                        <div class="form-group sm_margin" >
         					
                        <label class="col-sm-2 control-label" style="height: 30px; width: 100px; margin-top: 10px;">해쉬태그</label>
                        
                        	<div class="col-sm-10">
                        	<textarea rows="2" cols="40" maxlength="40" class="form-control" name="story_tag" onclick="if(this.value=='${storyDetailmap.STORY_TAG}'){this.value=''}" style="resize: none; min-height: 30px;">${storyDetailmap.STORY_TAG}</textarea>
                        	
                        </div>
                		        
                        <div class="space-20"></div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                               
                                                <div class="text-right" style="margin-top: 10px;">
                                                    	<button type="button" onClick="goDelete();" class="btn btn-primary btn-lg rounded">삭제</button>
														<button type="button" onClick="javascript:history.back();" class="btn btn-danger  btn-lg rounded">취소</button>
													&nbsp;&nbsp;&nbsp;&nbsp;                                                   
                                                </div><!--.chat-area-bottom-->
                                            </div>
                                    </div><!--row end-->               
                                     
           
               </div>
		</div>
		</div>
	</form>
	
	</div>
	
	<br><br><br><br>
	
	<script type="text/javascript">

	
	function goDelete() {
		
		var deleteFrm = document.deleteFrm;
		deleteFrm.action = "/main/story/storydeleteEnd.action";
		deleteFrm.method = "post";
		deleteFrm.submit();
	}
	
	</script>
	  
	
</body>
</html>