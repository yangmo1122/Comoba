<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            <!DOCTYPE HTML>
<html>
<head>
  <%-- 
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
   --%>
  
<style>
#sm_demo {
  text-align: center;
  font-size: 60px;
}
</style>

</head>

<body>


<div id="ajaxtest" style="border: solid 1px red;"></div>


<script type="text/javascript">
// 페이지 새로고침, 이동 시에 나오는 트리거 장치 여기서는 이동할떄마다 
// ajax를 통하여 session에 스탑워치의 상태(세는중, 멈춤, 리셋)을 보내주고
// 그에 따라 세는중일땐 starttime을 보내어 계싼
// 멈춤일땐 cnt2 값을 보내어 화면에만 띄워준다
var stopp = 0;
var autostart = 0;			
var checkUnload = true;
$(window).on("beforeunload", function(){
	if($("#sm_switch").val() == 1){
		autostart = 1;
	}
	else if($("#sm_switch").val() == 2){
		autostart = 2;
		stopp = document.getElementById("sm_count").value;
	}
/* 	if($("#reset_switch").val() == 3 && autostart != 1){
		autostart = 0;
	} */
	  stopclick();
	var form_data1 = {sm_count : $("#sm_count").val(),               // 키값:밸류값
			sm_switch : $("#sm_switch").val(),            // 키값:밸류값
			sm_auto : autostart,
			startt : startt,
			stopp : stopp,
			second_start : $("#second_start").val()
			
		    };
	$.ajax({
		url : "/main/session.action",   // action 에 해당하는 URL 속성값
		type :"GET",                              // method
		data : form_data1,                           // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
		dataType : "JSON",                          // URL 페이지로 부터 받아오는 데이터타입
		success : function(data) { 
			
		 },
		 error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 }    
		 
		 
	});
		
	if(checkUnload){
		//페이지 옮기기전 확인창 띄우는곳
	}
	
});



	var countDownDate = new Date().getTime();  
	var startt = 0;
	var stopt = 0;

	var switcht = 0;
	var cnt2 = 0;
	var x = 0;
	var distance =0;
	var shit = 0 ;
	
function goGetjepumTypeCode2() {
	
	// alert("sm_count"+$("#sm_count").val()+"sm_switch"+$("#sm_switch").val());
	
	var form_data = {sm_count : $("#sm_count").val(),               // 키값:밸류값
			sm_switch : $("#sm_switch").val(),             // 키값:밸류값
			auto : autostart,
			reset_switch : $("#reset_switch").val()
		    };

	$.ajax({
		url : "/main/stoptest3.action",   // action 에 해당하는 URL 속성값
		type :"GET",                              // method
		data : form_data,                           // 위의 URL 페이지로 사용자가 보내는 ajax 요청 데이터.
		dataType : "JSON",                          // URL 페이지로 부터 받아오는 데이터타입
		success : function(data) {                  // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
			
			
		//	alert("아잭전:"+$("sm_count").val());
			
					
					$("#ajaxtest").empty();
					
			
					var html = "<div ><img class='sm_show' alt='1' src='<%= request.getContextPath() %>/resources/img/sm/alarm-clock.png' ></div>";
					html += "<div class='sm_menu'>";
					
					html += "<p id='sm_demo'></p>";
					html += "<button class='sm_start'>start</button>";
					html += "<button class='sm_stop'>stop</button>";
					html += "<button class='sm_reset'>reset</button>";
					html += "<div style='float:right;'> <img class='sm_hide' alt='1' src='<%= request.getContextPath() %>/resources/img/sm/alarm-clock.png' > </div>";
					html += "<form name='cntFrm'>";
					html += "<input type='hidden' id='sm_count' name='sm_count' value='0'/>";
					html += "<input type='hidden' id='sm_switch' name='sm_switch' value='0'/>";
					html += "<input type='hidden' id='sm_auto' name='sm_auto' value='${sessionScope.sm_auto}'/>";
					html += "<input type='hidden' id='startt' name='startt' value='0'/>";
					html += "<input type='hidden' id='reset_switch' name='reset_switch' value='0'/>";
					html += "<input type='hidden' id='second_start' name='second_start' value='0'/>";
					
					html += "</form>";
					html += "</div>";
					
					var sm_count = 0;
					var sm_switch = 0;
					var auto = 0;
					var starttime = "${sessionScope.startt}";
				//	alert("여기서 나오나?"+${sessionScope.sm_auto});
					 $.each(data, function(entryIndex, entry){ 
						 sm_count = entry.sm_count;
						 sm_switch = entry.sm_switch; 
						 reset_switch = entry.reset_switch
					//		alert("엔투리 sm_count"+entry.sm_count);
				//			alert("엔투리 sm_switch"+entry.sm_switch);
						});
				//	 var a = ${"sm_switch"};
				 auto = "${sessionScope.sm_auto}";
				if(reset_switch == 3){
				 auto = 0;
				}
				//alert("아잭후:"+auto);
				  
		 		  
				
				
					$("#ajaxtest").append(html);
					
					
				
					var swit = 0;
					 if(sm_switch==3){
						 document.getElementById("sm_demo").innerHTML = "0d 0h 0m 0s ";
						 swit = 3;
					 }
					 /*  else{
					    	var days = Math.floor(sm_count / (1000 * 60 * 60 * 24));
		    			    var hours = Math.floor((sm_count % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		    			    var minutes = Math.floor((sm_count % (1000 * 60 * 60)) / (1000 * 60));
		    			    var seconds = Math.floor((sm_count % (1000 * 60)) / 1000);
		    			    
		    			    // Output the result in an element with id="sm_demo"
		    			    document.getElementById("sm_demo").innerHTML = days + "d " + hours + "h "
		    			    + minutes + "m " + seconds + "s ";
		    		    		    
					    }  */
						// alert("오토는 오토다"+ auto);
						switcht = swit;
					 //   alert("auto"+auto);
					 //   alert(typeof auto);
						if(parseInt(auto) == 1){
						 	 cnt2 = "${sessionScope.sm_count}";
						// 	 alert("아니 스타트에서는 되잖아 ㅡㅡ"+cnt2);
						 	/*	 startt = ${sessionScope.startt}; */
						 	starttime = "${sessionScope.second_start}"
							startclick(starttime);
					//		alert("swit"+swit);
						
						}
						else if (parseInt(auto) == 2){
						//	alert("여기 왜 안옴?");
							
							cnt2 = "${sessionScope.sm_count}";
						// 	alert("오는데 cnt2 이게 잘못됬니?"+cnt2);
							/*	 startt = ${sessionScope.startt}; */
							stopclick();
						}
								if(swit ==3){
							// $(".sm_menu").hide();
								cnt2 = 0; shit=0;
								$(".sm_show").hide();   
								}
								else{
								/* 	if(${sessionScope.sm_count} != null){
										cnt2 = ${sessionScope.sm_count};
										alert("${sessionScope.sm_count}"+ cnt2);
									} */
									$(".sm_menu").hide();
								}
							  $(".sm_show").click(function(){
							  	$(".sm_menu").show();
							  	$(".sm_show").hide();    
							  });
		
							  $(".sm_hide").click(function(){
							  	$(".sm_menu").hide();
							  	$(".sm_show").show();    
							  }); 

					  
					    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
					    $(".sm_start").click(function(){
					    	  startt = new Date().getTime();
					    	startclick(startt);
					    });
					    $(".sm_stop").click(function(){
					        stopclick();
					    });
					    $(".sm_reset").click(function(){
					   	 //alert("시작:"+startt);
					   	 
					   	 if(switcht == 1){
					   		stopclick();
					   	 }
					   	 switcht=3;
					   
					   	var cnt = distance;
					   	document.getElementById("reset_switch").value = switcht;
					   	document.getElementById("sm_switch").value = switcht;
					   	var real = document.getElementById("sm_switch").value;
					  // 	alert("리셋할때 switcht 이거야?"+real);
					   	// alert("끝:"+stopt);
					   	distance = 0;
					   	var cnttt =  document.getElementById("sm_count").value;
					   	alert("리셋값을 가져가"+ cnttt);
					   	autostart = 0;
					   	 
					   	
					   	goGetjepumTypeCode2();
					   		
					   	 
					   
					   });

					    
					    
					    if(switcht==0){ document.getElementById("sm_demo").innerHTML = "0d 0h 0m 0s ";}
					    

		 },
		 error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 }    
		 
		 
	});
	
}// end of goGetjepumDetailName2()----------------------------------------


	function startclick(startt){
	
	   distance = 0 ;
	   switcht=1;
	  
	//  alert("시작:"+startt +"cnt:"+cnt2);   // cnt2 는 누적시간임 
	  if(switcht==1){
		  //alert("//startt::"+startt+"//cnt2::"+cnt2+"//distance::"+distance);
		  x = setInterval(function() {
		    	
			 
			    // Get todays date and time 현재시간(스타트 누른시간) + 기존있던 시간
			    var now = new Date().getTime();
			  
			    // Find the distance between now an the count down date
			
			    distance = parseInt(now) - parseInt(startt) + parseInt(cnt2); 
			   
			   
			    // Time calculations for days, hours, minutes and seconds
			 //   var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			    
			    // Output the result in an element with id="sm_demo"
			    document.getElementById("sm_demo").innerHTML = //days + "d " + 
			    hours + "h "
			    + minutes + "m " + seconds + "s ";
			  
			 
		    }
		    , 1000);  // 1000 이 1초마다
		    }
	   document.getElementById("sm_count").value = cnt2;
	   	document.getElementById("sm_switch").value = switcht;
	   	document.getElementById("startt").value = startt;
	   	document.getElementById("reset_switch").value = 1;
}



function stopclick(){
	var stopt = new Date().getTime();   
	document.getElementById("second_start").value = stopt;
	var trigger = "${sessionScope.stopp}";
	
	//alert(typeof trigger);
	//페이지 안멈춘 채로 이동한후 멈춤을 누를때
	// startt 는 0 이고(시작버튼을 안눌렀었으니까)
	// 멈춤을 누르면 now와 startt를 뻅시다
	if(startt ==0 && trigger == 0){ 
		  var now = new Date().getTime();
		  startt = "${sessionScope.second_start}";
		//  alert("3");
	//	  alert("stopt-"+stopt+"//stopt-"+stopt+"//cnt2-"+cnt2);
		  cnt2= parseInt(stopt) - parseInt(startt) + parseInt(cnt2);
		//  alert(cnt2);
		  
	}
	else if(startt == 0 && trigger != 0 ){ // 페이지 멈춘 채로 이동했을시
		startt = "${sessionScope.startt}";
	// 	alert("이게 이상하지?"+startt);
		 cnt2 = "${sessionScope.stopp}";
	//	 alert("여기 cnt2가이상해?"+cnt2);
		// alert("1"); // 페이지 멈춘 채로 이동했을시
		// alert(typeof cnt2);
	}
	else{  // 한페이지에서 시작하고 멈췄을때
		countDownDate = parseInt(stopt) - parseInt(startt);
		cnt2 = parseInt(cnt2) + parseInt(countDownDate);
		
	//	alert("2");  // 한페이지에서 시작, 멈춤
	}
//	 alert("시작:"+startt);
	 
	
	// alert("distance:"+distance);

	
	 switcht= 2;
	
	 
	 if (switcht == 2) {
		  
		 clearInterval(x);
		
	//	 alert(cnt2);
		//    alert("stopt:"+stopt+"startt:"+startt+"distance:"+distance+"countDownDate:"+countDownDate+"cnt2:"+cnt2);
		  //   var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			    var hours = Math.floor((cnt2 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			    var minutes = Math.floor((cnt2 % (1000 * 60 * 60)) / (1000 * 60));
			    var seconds = Math.floor((cnt2 % (1000 * 60)) / 1000);
			    
			    // Output the result in an element with id="sm_demo"
			    document.getElementById("sm_demo").innerHTML = //days + "d " + 
			    hours + "h "
			    + minutes + "m " + seconds + "s ";
		    
		//    alert("8");
		    document.getElementById("sm_count").value = cnt2;
			document.getElementById("sm_switch").value = switcht;
		
		   	
		  }
	
	
}

$(document).ready(function(){
		
	
	   goGetjepumTypeCode2();
	
		 
});




</script>



</body>



</html>
