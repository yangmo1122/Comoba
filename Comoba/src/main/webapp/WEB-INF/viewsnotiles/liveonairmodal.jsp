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
       <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/calendar/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/calendar/js/modernizr.js"></script>
        
    
    </head>
  
 <!--Requirement jQuery-->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<!--Load Script and Stylesheet -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/ty/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="<%=request.getContextPath() %>/resources/ty/jquery.simple-dtpicker.css" rel="stylesheet" />
 
 
  <style type="text/css">

  	.ty_font{
  		font-size: 12pt;
  	}
  
  	.ty_top{
  	vertical-align: top;
  }
  	
  	.ty_form{
  		width: 60%;
  	}
  
  </style>
 
 
 <script type="text/javascript">

 
	$(document).ready(function() {

		showNowTime();
			
		$("#addfile").bind("click", function(){
			
			var html = "";
			
			html += "<br/>";
			html += "<input type='file' name='attach2' class='btn btn-default' />";
				
			$("#divfileattach2").empty();
			$("#divfileattach2").append(html);	
			
		});

			
	});	// end of $(document).ready(function()-----------------	
			
	function showNowTime() {
		   
	   var now = new Date();
	
	   var month = "";
	   if(now.getMonth()+1 < 10){
		   month = "0"+(now.getMonth()+1);
	   }
	   else{
		   month = ""+(now.getMonth()+1);
	   }
	   
	   var strNow = now.getFullYear() + "-" + month + "-" + now.getDate();
	   
	   var hour = "";
	   if(now.getHours() < 10){
		   hour = "0"+now.getHours();
	   }
	   else{
		   hour = ""+now.getHours();
	   }
	   
	   var minute = "";
	   if(now.getMinutes() < 10) {
	      minute = "0"+now.getMinutes();
	   } else {
	      minute = ""+now.getMinutes();
	   }
	   
	 
	   strNow += " " + hour + ":" + minute;
	   
	   $("#start").val(strNow);
	
	}// end of function showNowTime() -----------------------------
			
	var cnt = 0;
	var filenamearr = new Array();
	var filesizearr = new Array();
	
	function addFile(){
	    var x = document.getElementById("myFile");
	    var txt = "";
		var files = "";
	    if ('files' in x) {
	        if (x.files.length == 0) {
	            txt = "Select one or more files.";
	        } else {
	            for (var i = 0; i < x.files.length; i++) {

	                txt += "<br><strong>" + (cnt+1) + ". 파일</strong> <img src='<%= request.getContextPath() %>/resources/images/roomlive/close-cross.png' onClick='goDelete();' style='margin-left: 150px;' width='10px' height='10px'/><br>";
	                var file = x.files[i];
	                if ('name' in file) {
	                	filenamearr[cnt] = file.name;
	                	files += "<input type='hidden' name='filename' value='"+file.name+"'>";
	                    txt += "이름: " + file.name + "<br>";
	                }
	                if ('size' in file) {
	                	filesizearr[cnt] = file.size;
	                	files += "<input type='hidden' name='filesize' value='"+file.size+"'>";
	                    txt += "크기: " + file.size + " bytes";
	                }
	                cnt++;
	            }
	        }
	       
	    } 
	    else {
	        if (x.value == "") {
	            txt += "Select one or more files.";
	        } else {
	            txt += "The files property is not supported by your browser!";
	            txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
	        }
	    }
	    document.getElementById("demo").innerHTML += txt;
		document.getElementById("fileattach").innerHTML += files;
	}

	
	function goDelete(){
			
		// 불가능해ㅡㅡ
	}
	
	
    function goWrite(){
		
    	var start = document.getElementById("start");
		var finish = document.getElementById("finish"); 
		var link = document.getElementById("link");
		
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

  <!--start main content-->
        
      <div>
         <div class="panel">
             <div class="panel-body">
                 <div class="row mail-header">
                     <div style="margin-top: -10px;">
                         <h3>방송 시작하기</h3>
                     </div>
              
                 </div>
                 <hr>
                 <div class="space-20"></div>
                 <div style="padding-left: 5%; padding-right: 5%;" >
                 
                 <form name="livewriteFrm" method="post" action="<%= request.getContextPath() %>/myroom/liveonairEnd.action" enctype="multipart/form-data"> 

                   <table id="writelivetbl" style="width: 90%;">
               
                   <tr>
                   	<th class="ty_top">
                   	시작시간&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<input type="text" id="start" name="start" class="form-control ty_font ty_form" readonly/>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
                   <tr>
                   	<th class="ty_top">
                   	종료시간&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<input type="text" id="finish" name="date" value="" class="form-control ty_font ty_form">
							<script type="text/javascript">
								$(function(){
									$('*[name=date]').appendDtpicker();
								});
							</script>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
                   
                   <tr>
                   	<th class="ty_top">
                   	방송링크&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<input type="text" id="gonglink" name="link" class="form-control" value=""/>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
  					<tr>
                   	<th class="ty_top">
                   	코멘트&nbsp; :  &nbsp;
                   	</th>
                   	<td class="form-group">
                   		<textarea id="comments" name="comments" class="form-control" rows="3" style="width: 100%;"></textarea>
                   	</td>
                   </tr>
                   <tr><th></th><td><br/></td></tr>
         			 <%-- 첨부파일 타입 추가하기  --%>
		         	<tr>
	         		<th class="ty_top">
	         		파일첨부&nbsp; :  &nbsp;
	         		</th>
	         		<td class="form-group">
	  		        <!--     <input type='file' name='attach2' class='btn btn-default' /> -->
	  		        <input type="file" id="myFile" class="form-control ty_form" multiple size="50" onchange="addFile()">

						<p id="demo" style="font-size: 11pt;"></p>
						<div id="fileattach"></div>
	         		</td>
		         	</tr>
         			</table>
         			</form>
		            </div>               
		<div class="modal-footer" style="margin-top: 50px; margin-left: 10px;">
          <button type="button" class="btn btn-danger" onClick="goWrite();" style="font-weight: bold; font-size: 12pt;">ON AIR</button>
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
      
	
          
    </body>
</html>