<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>
       
      
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
  
  
  <style type="text/css">
 
  
  .form1{
  	display: inline-block;
  	width: 100px;
  	font-size: 10pt;
  }
  
  #title{
  	display: inline-block;
  	width: 300px;
  	font-size: 10pt;
  }
  
  #link{
  display: inline-block;
  	width: 300px;
  	font-size: 10pt;
  }
  
  .ty_top{
  	vertical-align: top;
  }

  
  </style>
  
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script type="text/javascript">

 
	$(document).ready(function() {

		/* $(function() {
			
			var dateFormat = "dd/mm/yy",
				from = $("#from").datepicker({
					monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
					monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
					dayNames : ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],

					dateFormat: "yy-mm-dd",
					defaultDate : "+1w",
					changeMonth : true,
					numberOfMonths : 1,
					// 날짜 유효성 체크 
					onClose: function( selectedDate ) { 
					  $('#from').datepicker("option","minDate", selectedDate); 
					}

			}).on("change", function() {
				to.datepicker("option", "minDate", $(this).datepicker("getDate"));
			}), to = $("#to").datepicker({
				monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
				monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
				dayNames : ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],

				dateFormat: "yy-mm-dd",
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				// 날짜 유효성 체크  
				onClose: function( selectedDate ) { 
				  $('#to').datepicker("option","maxDate", selectedDate); 
				}
			}).on("change", function() {
				from.datepicker("option", "maxDate", $(this).datepicker("getDate"));
			});
		}); 
		*/
		
		
		
			
	});	// end of $(document).ready(function()-----------------	
			
	  
    
    function goWrite(){
		
		var title = document.getElementById("title"); 
		var content = document.getElementById("content");
		
		if(title.value.trim() == ""){
			alert("제목을 입력해주세요!");
			return;
		}
		else if(content.value.trim() == ""){
			alert("내용을 입력해주세요!");
			return;
		}
		
		
		var livewriteFrm = document.livewriteFrm;
		livewriteFrm.submit();
		
	}
	
	
 	</script>
    
    
    
    <body style="height: 100%;">


<!--end main content-->
                    <!--start main content-->
        
      <div>
         <div class="panel">
             <div class="panel-body">
                 <div class="row mail-header">
                     <div style="margin-top: -10px;">
                         <h3>방송 만들기</h3>
                     </div>
                         <div class="tooltip-show" align="right" style="margin-top: -15px; margin-right: 20px;">
                             <a href="#" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="left" title="" data-original-title="다시 작성하시겠습니까?">비우기</a>
                         </div>
              
                 </div>
                 <hr>
                 <div class="space-20"></div>
                 <div style="padding-left: 5%; padding-right: 5%;" >
                 
                 <form name="livewriteFrm" method="post" action="<%= request.getContextPath() %>/myroom/livewriteEnd.action" enctype="multipart/form-data"> 
                 	<%-- <input type="hidden" name="memberno" value="${sessionScope.loginuser.memberno}" /> --%>
                   <table id="writelivetbl">
               
                    <%-- 첨부파일 타입 추가하기  --%>
                   <tr>
                   		<th class="ty_top">
                   		대표이미지&nbsp; :  &nbsp;
                   		</th>
                   	<td class="form-group">
                   		<div id="divfileattach1">
                   		<input type="file" name="attach1" class="btn btn-default" />
                   		</div>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
                   <tr>
                   	<th class="ty_top">
                   	제목&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<input type="text" id="title" name="title" class="form-control"/>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
                   <tr>
                   	<th class="ty_top">
                   	내용&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<textarea id="content" name="content" class="form-control" rows="5" style="width: 100%;"></textarea>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
                   <tr>
                   	<th class="ty_top">
                   	방송링크&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<input type="text" id="link" name="link" class="form-control"/>
                   	</td>
                   </tr>
         			</table>
         			</form>
		            </div>               
		<div class="modal-footer" style="margin-top: 50px; margin-left: 10px;">
          <button type="button" class="btn btn-primary" onClick="goWrite();">작성</button>
        </div> 
             
                  </div>
              </div>
		
		
		     </div><!--container end-->
		



          <!--Common plugins--><%-- 
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/jquery/dist/jquery.min.js"></script> --%>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/js/app.js"></script>
        <!-- DROPZONE -->
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/dropzone/dropzone.js"></script>
        
   
        <script>
            $(document).ready(function () {
                Dropzone.options.myAwesomeDropzone = {
                    autoProcessQueue: false,
                    uploadMultiple: true,
                    parallelUploads: 100,
                    maxFiles: 100
                };
                
              
            });
        </script>
	
          
    </body>
</html>