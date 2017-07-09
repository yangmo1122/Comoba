<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
       <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/summernote/summernote.css" rel="stylesheet">
        <!--template custom css file-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/css/style.css" rel="stylesheet">

		
		
        <script src="<%=request.getContextPath()%>/resources/jaeyeon/js/modernizr.js"></script>
       
         <!--제이쿼리-->
        <script src="http://code.jquery.com/jquery-latest.js"></script>

 		
        <style type="text/css">
        
            #map {
        width: 100%;
   height: 400px;
   background-color: grey;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
        
        </style>
        
    </head>
    
    
    <body>
  
               <!--start main content-->
                <section id="main-content" >
                    <div class="space-30"></div>
                    <div class="container">

                        <div class="row">
                            

                            <div class="col-sm-9">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row mail-header">
                                            <div class="col-md-6">
                                                <h1>스터디룸 등록</h1>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="pull-right tooltip-show">
                                                  <!-- 구글이 막아놈... 쩝 <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myMap"  >지도</button> --> 
                                                    <button type="button" class="btn btn-default btn-sm"   onclick="window.open('<%=request.getContextPath()%>/admin/searchMap.action', 'MsgWindow', 'width=800px;, height=800px;, location=no; ,scrollbars=no; , right=30px; , top=30px; ')"  >지도</button>
                                                 	
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="space-30"></div>
                                        <form name="addFrm" class="form-horizontal">
                                            <div class="form-group"><label class="col-sm-2 control-label">스터디룸 이름:</label>
											    <div class="col-sm-10"><input type="text" class="form-control" name="studyroom_name" ></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">스터디룸 주소:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" onclick="window.open('<%=request.getContextPath()%>/admin/searchMap.action', 'MsgWindow', 'width=800px;, height=800px;, location=no; ,scrollbars=no; , right=30px; , top=30px; ')"  placeholder="" name="addr1" id="addr1"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" style="margin-top: 0%;">스터디룸<br/> 상세주소:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" placeholder="" id="addr2" name="addr2"></div>
                                            </div>
                                             <div class="form-group"><label class="col-sm-2 control-label">위도:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" name="latitude" id="latitude"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">경도:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" name="longitude" id="longitude"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label"  >스터디룸 연락처:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" name="hp" id="hp" placeholder="01012341234" maxlength="11"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">스터디룸 비용:</label>
												 <div class="col-sm-10"><input type="text" class="form-control" name="cost" id="cost" placeholder="3000"></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">스터디룸 내용:</label>
												 <div class="col-sm-10"><textarea rows="10" class="form-control" name="studyroom_contents"></textarea></div>
                                            </div>
                                           
                                            
                                            
                                            
                                            
                                            <div class="form-group"><label class="col-sm-2 control-label">스터디룸 이미지 갯수:</label>

                                                <div class="col-sm-10">
												
												<select id="select" class="btn btn-default dropdown-toggle">
												<option  value="1">1</option>
												<option  value="2">2</option>
												<option  value="3">3</option>
												<option  value="4">4</option>
												<option  value="5">5</option>
												</select>
													   
													   
													   <div id="attach" style="margin-top: 1%"></div>
													  
                                            </div><!--end btngroup-->
											
											
         		    								   <div id="divfileattach"></div>                                                    

                                                    <p class="help-block">Attache Photos, Files, Videos etc.</p>
                                                </div>
                                                
                                                
                                           </form>
                                            </div>
                                        
                                        <div class="space-20"></div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                               <!--  <div class="summernote-theme-1">
                                                    <div class="summernote">
                                                        <h4>Hi Mate!</h4>
                                                        <p>Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla</p>
                                                        <p>Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla</p>
                                                    </div>
                                                </div> -->
                                                <div class="text-right" style="margin-right: 2%; margin-bottom: 2%">
                                                    <button type="submit" class="btn btn-primary btn-lg rounded" onClick="register()" >등록</button>
                                                    <button type="reset" class="btn btn-danger  btn-lg rounded"  onClick="javascript:history.back();">취소</button>
                                                   
                                                </div><!--.chat-area-bottom-->
                                            </div>
                                    </div><!--row end-->
                                </div>
                            </div>

                        </div><!--col-md-9 end-->

                    </div><!--row end-->
            

            <!--footer start-->
            <div class="footer">
                <div class="row">
                    <div class="col-sm-12">
                        <span>&copy; Copyright 2016. Assan</span>
                    </div>
                </div>
            </div>
            <!--footer end-->
        </section><!--end main content-->
  

            <!-- 맵 쓰달데기 없음-->
    <!--  <div id="map">
         </div>
          -->


<!--Common plugins-->
<%-- <script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/hoe-nav/hoe.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/pace/pace.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/js/app.js"></script>
<script src="<%=request.getContextPath()%>/resources/jaeyeon/plugins/summernote/summernote.min.js"></script> --%>

<script>
   

    	
        $(document).ready(function(){

        	
        	   $('.summernote').summernote();
        	
        	 
    	}); // end of $(document).ready()-----------------------------------
    	
    	function register() {
    	
    		var addFrm = document.addFrm;
    		
    		var cost = document.getElementById("cost").value;
    		
    		var hp = document.getElementById("hp").value;
    		
    		var attach0 = document.getElementById("attach0").value;
    		
    		// alert(attach0.length);
    		
    		var regExp = /^[0-9]+$/;
    		
    		var costBool = regExp.test(cost);
    		
    		var hpBool = regExp.test(hp);
    		
    		if (costBool && hpBool ) {
  			
    			if(attach0.length > 0){
    			
    		addFrm.action = "/main/admin/addStudyroomEnd.action";
    		addFrm.method = "POST";
    		addFrm.enctype = "multipart/form-data";
    		addFrm.submit();
    			}else{
    				
    				alert("최소 한개이상의 사진을 첨부 해야합니다.");
    				
    			}
    		
    		}
    		else {
    			
    			alert("핸드폰 번호나 비용은 숫자만 입력 가능합니다.");
    		
    			}
    		
    	}
    	
     	$("#select").change(function () {
    		var str = ""; 
    		
    		var html = "";
			
    		
    		$("select option:selected").each(function () {
    			str += $(this).text() + " "; 
    			
    			str = Number(str);
    		    	
    			for(var i=0; i<str; i++){
    			
    				html += "<input type='file' id='attach"+ i + "' name='attach' /><br/>";
    		
    				$("#attach").empty();
    			}
    			}); 
    		
    		$("#attach").append(html);
    	
    		
    	}).change();


		
    	var map;
        function initMap() {
          map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 37.533876, lng:  126.896947},
            zoom: 17
          });
        };
      	
</script>


<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCANQaZ2FG-T4yKB13PKlnjYxhZPz7gT80&callback=initMap">
    </script>
    

    
    
</body>
</html>