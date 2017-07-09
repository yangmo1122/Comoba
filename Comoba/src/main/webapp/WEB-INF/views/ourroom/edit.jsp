<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>

        <!-- Bootstrap -->
         <link href="<%=request.getContextPath() %>/resources/song/assets2/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
         <link href="<%=request.getContextPath() %>/resources/song/assets2/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
         <link href="<%=request.getContextPath() %>/resources/song/assets2/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
         <link href="<%=request.getContextPath() %>/resources/song/assets2/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
         <link href="<%=request.getContextPath() %>/resources/song/assets2/plugins/summernote/summernote.css" rel="stylesheet">
        <!--template custom css file-->
         <link href="<%=request.getContextPath() %>/resources/song/assets2/css/style.css" rel="stylesheet">

        <link href="<%=request.getContextPath() %>/resources/song/assets2/js/modernizr.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    
    
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
      var writeFrm = document.writeFrm;
      writeFrm.action = "/main/ourroom/editEnd.action";
      writeFrm.method = "post";
      writeFrm.submit();
   }
</script>

 
    <body>

  <form name="writeFrm" enctype="multipart/form-data">   
      
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel" >
        
            <div id="hoeapp-container" >
             
                <div class="row">	
                      

                            <div class="col-sm-9" align="center;" style="width: 1000px;">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row mail-header">
                                            <div class="col-md-6">
                                                <h3>자유게시판 수정</h3>
                                            </div>
                                           
                                        </div>
                                        <hr>
                                        <div class="space-20"></div>
                                        <form class="form-horizontal" method="get">
                                            <div style="width: 100%;"><label class="col-sm-2 control-label">글번호</label>

                                                <div class="col-sm-10" >${boardvo.board_no}
                                                <input type="hidden" name="board_no" id="board_no"  value="${boardvo.board_no}" />
                                   			    </div>
                                            </div>
                                    
                              
                                            <div  class="form-group" style="width: 500px;">
                                                <select class="form-control margin-b-20" id="category" name="category" style="background-color: #E88A4B;">
                                                <option  value="1">스터디모집</option>
												<option  value="2">자유게시판</option>
												<option  value="3">스터디후기</option>
												<option  value="4">기타</option>
                                                </select>
                                           
                                            </div>
                                      
                                             <div style="width: 100%;"><label class="col-sm-2 control-label">닉네임</label>
                                             <div class="col-sm-10">${sessionScope.loginuser.nickname}
                                             <input type="hidden" name="nickname" id="nickname" class="form-control" style="color: black;" />
                                   				</div>
                                            </div>
                                          
                                			 <div  style="width: 100%;"><label class="col-sm-2 control-label">제목</label>
                                             <div class="col-sm-10" ><input type="text" name="subject" id="subject"  class="form-control"/>
                                   		    	</div>
                                           </div>
                               
                                    
                                              <div ><label class="col-sm-2 control-label">파일첨부</label>

                                                <div class="col-sm-10">
                                                    <input type="file" name="attach" id="attach">
                                                </div>
                                            </div>
                                            
                                            <input type="hidden" name="rno" id="rno" value="${boardvo.rno}"/>
                                            
                                        </form>
                                        
                                        <div class="space-20"></div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="summernote-theme-1">
                                                     <textarea name="content" id="content"  class="long" style="height: 500px; width: 100%;"></textarea> 
                                                    
                                                   </div>
                                                   
			                                       <input type="hidden" name="fk_seq"  value="${sessionScope.boardvo.fk_seq}" />                         
			                                       <input type="hidden" name="groupno" value="${sessionScope.boardvo.groupno}" />
			                                       <input type="hidden" name="depthno" value="${sessionScope.boardvo.depthno}" />
			      
                                                <div class="text-right">
                                                     <button type="button" class="btn btn-primary btn-lg rounded" onClick="goUpdate();">쓰기</button>
                                       <button type="button" class="btn btn-danger  btn-lg rounded" onClick="javascript:history.back();">취소</button>
    
                                                </div><!--.chat-area-bottom-->
                                            </div>
                                    </div>
                                </div>
                            </div>

                        </div><!--col-md-9 end-->

                    </div><!--row end-->
            </div>
</div>
</form>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/hoe-nav/hoe.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/pace/pace.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/js/app.js"></script>
<script src="<%=request.getContextPath() %>/resources/song/assets2/plugins/summernote/summernote.min.js"></script>

<script>
    $(document).ready(function () {
        $('.summernote').summernote();
    });
</script>


</body>
</html> 
