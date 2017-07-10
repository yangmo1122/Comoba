<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assan - Responsive wedding bootstrap template</title>

<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/resources/song/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/song/assets/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/song/assets/css/animate.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/song/assets/bower_components/flexslider/flexslider.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/song/assets/lightbox2/dist/css/lightbox.css"
	rel="stylesheet">
<!--main css file-->
<link
	href="<%=request.getContextPath()%>/resources/song/assets/css/style.css"
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>


<style type="text/css">
#map {
	width: 100%;
	height: 480px;
	background-color: grey;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
/* 
#floating-panel {
	position: absolute;
	top: 500px;
	left: 85%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
} */
.jy {
	margin-top: 0;
}
</style>


<body data-spy="scroll">
</head>
<body>
	<div style="width: 100%;" id="map"></div>

	<div id="floating-panel" style="margin-left: 85%; margin-top: 1%;">
		<input id="address" type="text" value="당산역"
			onkeypress="if( event.keyCode==13 ){goSearch();}"> <input
			id="submit" type="button" value="Geocode">
	</div>



	<input type="hidden" id="centerX">
	<input type="hidden" id="centerY">

	<section id="story" class="our-story">

		<div class="row margin-b-50">
			<div class="col-sm-8 col-sm-offset-2 text-center">
				<div>
					<h2 style="color: gray;">스터디룸 검색</h2>
					<p>검색하신 스터디룸 입니다. 자세한 상세내용은 상세페이지보기를 눌러주세요.</p>
				</div>
			</div>
		</div>
		<div id="markerList"></div>
		<!--story row-->



		<c:forEach var="studymap" items="${studyroommap}" varStatus="status">
			<input type="hidden" id="wido${status.index}"
				value="${studymap.LATITUDE}" />
			<input type="hidden" id="geongdo${status.index}"
				value="${studymap.LONGITUDE}" />
		</c:forEach>
	</section>




	<script>
	
   
        $(document).ready(function(){
        	
        	
        	
        	document.getElementById("centerX").value =  126.92359644702924;
       		document.getElementById("centerY").value = 37.52390329171739;
        	
       	
         
        	
        	 
    	}); // end of $(document).ready()-----------------------------------
    	
    	
     	$("#select").change(function () {
    		var str = ""; 
    		
    		var html = "";
			
    		
    		$("select option:selected").each(function () {
    			str += $(this).text() + " "; 
    			
    			str = Number(str);
    		    	
    			for(var i=0; i<str; i++){
    			
    				html += "<input type='file' name='attach' /><br/>";
    		
    				$("#adad").empty();
    			}
    			}); 
    		
    		$("#adad").append(html);
    	
    		
    	}).change();



    	var map;
    	
        function initMap() {
        	/*  map = new google.maps.Map(document.getElementById('map'), {
                 center: {lat: 37.533876, lng:  126.896947},
                   zoom: 17
               }); */
            
               map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 17,
                 center: {lat: 37.52390329171739, lng:  126.92359644702924}
            });
         	
               google.maps.event.addListener(map, 'dragend', function(){    // 드래그시 이벤트 추가
                   showMapPos();
                   showmarkerAJAX();
               });
               
               google.maps.event.addListener(map, 'zoom_changed', function(){    // 줌을 할시 이벤트 추가
                   showMapPos();
                   showmarkerAJAX();
               });
               
        
        function showMapPos(){
            	    var pos=map.getCenter();

            	    //alert(pos.lat()+"/"+pos.lng());
            	    //return {x:pos.lat(), y:pos.lng()};

            	    document.getElementById("centerX").value = pos.lng();
            	    document.getElementById("centerY").value = pos.lat();
            	}    
               
        function showmarkerAJAX(){
        	
        	$("#markerList").hide();
        	
        	var form_data = { latitude : $("#centerX").val(),  // 키값 : 밸류값 
        						longitude  : $("#centerY").val()    // 키값 : 밸류값 
	       		   			 };
        	
        	
        	
        	$.ajax({
        		
        		url: "<%=request.getContextPath() %>/ourroom/searchmarker.action",
	    		type: "GET",
	    		data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
	    		dataType: "JSON", 
	    		success: function(data){
	    			
	    			   var resultHTML = "";
		    			  
	    			   $.each(data, function(entryIndex, entry){
	    				   var nro = entry.RNO.trim();
	    				   var studyroom_no = entry.STUDYROOM_NO.trim();
	    				   
	    				   var studyroom_name = entry.STUDYROOM_NAME.trim();
	    				   var addr1 = entry.ADDR1.trim();
	    				   var addr2 = entry.ADDR2.trim();
	    				   var hp = entry.HP.trim();
	    				   var cost = entry.COST.trim();
	    				   var title = entry.TITLE.trim();
                           var result = "";
                           
                           if(nro%2 ==1 ) {   //홀수면
                           
						    
						    result = "<div class='image-box'><img src='<%=request.getContextPath() %>/resources/files/"+title+"' alt='왜없니;;ㅋㅋㅋ' class='img-responsive'> "  
							       + " </div> </div> <div class='col-sm-12 col-md-2 text-center'>  <div class='story-date'> <div class='date-only'> 2017 </div> </div> </div>"
							       + " <div class='col-sm-12 col-md-4 wow animated fadeInDown' data-wow-delay='0.4s'> <h3> <span>"+nro+".</span>  "+studyroom_name+" </h3> <p> 이름 : " + studyroom_name 
							       + " <div class='jy'> 지역 : " + addr1+ "  " + addr2 +"</div><div class='jy'> 비용 : "+ cost +" 원 ( 1시간 1인)</div><div class='jy'> H.P   :  "+hp +"</div>"
							       + " <br/><br/> <p> <a href='/main/story/studyroom.action?studyroom_no="+ studyroom_no +"' class='btn btn-theme-dark'>상세페이지 보기</a>";
							        
								if("${sessionScope.loginuser.email}" == "woflqh12@naver.com"){
									result += "&nbsp;&nbsp;&nbsp;<a href='/main/story/studyroomDel.action?studyroom_no="+ studyroom_no +"' class='btn btn-theme-dark'>삭제</a></p> ";
								}
								else {
									result += "	</p>";
								}
								       
                           }
                           else {   //짝수면
                        	   
                        	   result =" <h3> <span>"+nro+".</span>  "+ studyroom_name 
                        	          + "</h3> <p> 이름 : " + studyroom_name
                        	          + " <div class='jy'> 지역 : " + addr1+ "  " + addr2 +"</div><div class='jy'> 비용 : "+ cost +" 원 ( 1시간 1인)</div><div class='jy'> H.P   : "+ hp +"</div>  <br/> <p>"
                        		      + "<a href='/main/story/studyroom.action?studyroom_no="+ studyroom_no +"' class='btn btn-theme-dark'>상세페이지 보기</a> "
                        	    if("${sessionScope.loginuser.email}" == "woflqh12@naver.com"){
      									result += "&nbsp;&nbsp;&nbsp;<a href='/main/story/studyroomDel.action?studyroom_no="+ studyroom_no +"' class='btn btn-theme-dark'>삭제</a></p> ";
      						    } 
                        	    else{
                        	    	result += "	</p>";
                        	    }
                              result += "</div> <div class='col-sm-12 col-md-2 text-center'> <div class='story-date'> <div class='date-only'> 2017 </div> </div> </div>" 
                        		      + "<div class='col-sm-12 col-md-4 wow animated fadeInDown' data-wow-delay='0.4s'> <div class='image-box'>"
                        		      + "<img src='<%=request.getContextPath() %>/resources/files/"+title+"' alt='왜없니;;ㅋㅋㅋ' class='img-responsive'> "
                        		      + "</div>";
                        		   
						     }
                           
					
							resultHTML += "<div class='row story-row' style='width: 100%;'><div class='col-sm-12 col-md-offset-1 col-md-4 text-center wow animated fadeInDown' data-wow-delay='0.2s'> "
							               + result + "</div><div class='vertical-line'></div></div>"; 	   
	    			   });
	    			
	    				$("#markerList").html(resultHTML);
	    				$("#markerList").show();
	    			   
	    			   
	    			   
	    		},
	    		error: function(){
	   				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
	   		    }
        		
        	});// end of $.ajax
        	
        	
        	
        }// end of showmarkerAJAX
        
     
        
        
               
            var studyroom;
            var marker;
            
            <c:forEach var="studymap" items="${studyroommap}" varStatus="status">
            	studyroom = {lat: parseFloat(${studymap.LATITUDE}), lng: parseFloat(${studymap.LONGITUDE})};
            	
            	marker = new google.maps.Marker({
                    position: studyroom,
                    map: map    
            	});
            	
            	var mini = new google.maps.InfoWindow({
              	  content:   "<div><div style='float:left;'><span style='font-size:18px;font-weight:bold;'>${studymap.STUDYROOM_NAME}</span><hr>HP : ${studymap.HP}<br/>${studymap.ADDR1}  ${studymap.ADDR2}<br/>가격 : ${studymap.COST}원 (1인당 1시간)</div> <div style='float:right; padding:5px; height:115px; '><img src='<%=request.getContextPath() %>/resources/files/${studymap.TITLE}'    width='100' height='100%' alt='왜없니;;ㅋㅋㅋ' ></div></div>"
              	           
              	  });
              
            	
            	mini.open(map,marker); 
            	
            </c:forEach>
           
           function searchgo(){
        		 showMapPos();
	             showmarkerAJAX();
	        	geocodeAddress(geocoder, map);
        	   
           }
            
            
	        var geocoder = new google.maps.Geocoder();
	
	        document.getElementById('submit').addEventListener('click', function searchgo() {
	         
	        });
        
        
        document.getElementById('address').addEventListener('keypress', function(e) {
	        
        	var key = e.which || e.keyCode;
        	 if (key === 13) { // 13 is enter
        		 
        		 searchgo()

        	    }
        	
        	
	        });
      
      };
        
        
        
    	
        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({'address': address}, function(results, status) {
              if (status === 'OK') {
                resultsMap.setCenter(results[0].geometry.location);
                /* var marker = new google.maps.Marker({
                  map: resultsMap,
                  position: results[0].geometry.location
                }); */
              } else {
                alert('Geocode was not successful for the following reason: ' + status);
              }
            });
          } 	
</script>


	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCANQaZ2FG-T4yKB13PKlnjYxhZPz7gT80&callback=initMap">
    </script>



	<!-- jQuery plugins-->
	<script
		src="<%=request.getContextPath()%>/resources/song/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/bower_components/flexslider/jquery.flexslider-min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/jquery.stellar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/jquery.sticky.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/bower_components/wow/dist/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/jquery.countdown.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/lightbox2/dist/js/lightbox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/song/template-custom.js"
		type="text/javascript"></script>
	<!-- Google Map Script -->
	<!--        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
                <script src="<%=request.getContextPath()%>/resources/js/google-map.js"></script>-->
                
      <form name="frmDel">
		<input type="hidden" name="studyroom_no">
	</form>          
                
                
</body>
</html>
