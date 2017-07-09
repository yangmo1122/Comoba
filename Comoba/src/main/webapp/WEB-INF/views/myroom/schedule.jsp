<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<link href='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/fullcalendar.css?ver=1.2' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/lib/moment.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/lib/jquery.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/fullcalendar.min.js?ver=1.41'></script>
<script src='<%=request.getContextPath() %>/resources/fullcalendar-2.4.0/gcal.js'></script>

<style type="text/css">

.sm_selectdday{
	border : 2px outset #e6e6e6; 
}

.sc_candidateday{
		cursor: pointer;
	}

</style>

<script>
	var missioncnt = 1;
	var nowmonth = 0;
	
	/*  <c:forEach var="ddayList" items="${ddayList }">
	 	
	 </c:forEach> */
/* 	var date = new Date(); // 날짜 객체 생성
	var y = date.getFullYear(); // 현재 연도
	var m =  date.getMonth();// 현재 월
	var d = date.getDate(); // 현재 일
	
	var last = [31,28,31,30,31,30,31,31,30,31,30,31];
    // 4년마다 있는 윤년을 계산합니다.(100년||400년 주기는 제외)
if (y%4 && y%100!=0 || y%400===0) {
    lastDate = last[1] = 29;
}
    // 현재 월의 마지막 일이 며칠인지 구합니다.
var lastDate = last[m];
     */
	$(document).ready(function() {
		

	     sm_fullsche();
	     
	     
		var date2 = new Date(); // 날짜 객체 생성
		var y2 = date2.getFullYear(); // 현재 연도
		var m2 =  date2.getMonth();// 현재 월
		var d2 = date2.getDate(); // 현재 일
//		
/* 		
		
	$('.sm_cal_edit').hide();
	
	$('.fc-next-button').click(function(){
		nowmonth = nowmonth +1;
		$('.sm_cal_edit').hide();
		
		$('.fc-day-number').hover(
				
				function (e) { 
					  var _target = $(e.target);
					  var sum = "fc_daynum"+_target.data("date");
					//  alert(_target.data("date"));
					 //  document.getElementById(sum).show(); 
					 $("#"+sum).show(); 
					 senddate = _target.data("date");
					// alert(senddate);
					 }, 
					 function (e) { 
							
						  var _target = $(e.target);
						  var sum = "fc_daynum"+_target.data("date");
						 //  document.getElementById(sum).show(); 
						 $("#"+sum).hide(); 
						 senddate = "";
							 }
				);
		
			$('.fc-day-number').click(function(e){
			    var _target = $(e.target);
			    
			   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
			    alert("//"+senddate);
			    
			  
			
			    document.getElementById("cal_startdate").defaultValue = senddate;   
			    document.getElementById("dday_startdate").defaultValue = senddate;
			    document.getElementById("mission_date").defaultValue = senddate;
			   $("#mission_subject0").empty();
				$("#addmission").empty();
				missioncnt = 1;
			    
			    
			 }); 
	});		
	
	
$('.fc-prev-button').click(function(){
	nowmonth = nowmonth -1;
		$('.sm_cal_edit').hide();
		
		$('.fc-day-number').hover(
				
				function (e) { 
					  var _target = $(e.target);
					  var sum = "fc_daynum"+_target.data("date");
					//  alert(_target.data("date"));
					 //  document.getElementById(sum).show(); 
					 $("#"+sum).show(); 
					 senddate = _target.data("date");
					// alert(senddate);
					 }, 
					 function (e) { 
							
						  var _target = $(e.target);
						  var sum = "fc_daynum"+_target.data("date");
						 //  document.getElementById(sum).show(); 
						 $("#"+sum).hide(); 
						 senddate = "";
							 }
				);
		
			$('.fc-day-number').click(function(e){
			    var _target = $(e.target);
			    
			   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
			    alert("//"+senddate);
			    
			  
			
			    document.getElementById("cal_startdate").defaultValue = senddate;   
			    document.getElementById("dday_startdate").defaultValue = senddate;
			    document.getElementById("mission_date").defaultValue = senddate;
			   $("#mission_subject0").empty();
				$("#addmission").empty();
				missioncnt = 1;
			    
			    
			 }); 
	});	


$('.fc-today-button').click(function(){
	
	$('.sm_cal_edit').hide();
	
	$('.fc-day-number').hover(
			
			function (e) { 
				  var _target = $(e.target);
				  var sum = "fc_daynum"+_target.data("date");
				//  alert(_target.data("date"));
				 //  document.getElementById(sum).show(); 
				 $("#"+sum).show(); 
				 senddate = _target.data("date");
				// alert(senddate);
				 }, 
				 function (e) { 
						
					  var _target = $(e.target);
					  var sum = "fc_daynum"+_target.data("date");
					 //  document.getElementById(sum).show(); 
					 $("#"+sum).hide(); 
					 senddate = "";
						 }
			);
	
		$('.fc-day-number').click(function(e){
		    var _target = $(e.target);
		    
		   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
		    alert("//"+senddate);
		    
		  
		
		    document.getElementById("cal_startdate").defaultValue = senddate;   
		    document.getElementById("dday_startdate").defaultValue = senddate;
		    document.getElementById("mission_date").defaultValue = senddate;
		   $("#mission_subject0").empty();
			$("#addmission").empty();
			missioncnt = 1;
		    
		    
		 }); 
		
	
		
});		//eo docu re

var senddate = "";
$('#moremission').click(function(){

	var html = "";
	html += "<br/>";
	html += "		<input type='text' id='mission_subject"+missioncnt+"' name='mission_subject"+missioncnt+"' class='form-control' style='widhth: 66.6%; height: 30px;'>";
	
	$("#addmission").append(html);	
	missioncnt++;
});

	$('#modal_test_sm').click(function(e){
		alert("!");
	});

		$('.fc-day-number').hover(
				
				function (e) { 
					  var _target = $(e.target);
					  var sum = "fc_daynum"+_target.data("date");
					//  alert(_target.data("date"));
					 //  document.getElementById(sum).show(); 
					 $("#"+sum).show(); 
					 senddate = _target.data("date");
					// alert(senddate);
					 }, 
					 function (e) { 
							
						  var _target = $(e.target);
						  var sum = "fc_daynum"+_target.data("date");
						 //  document.getElementById(sum).show(); 
						 $("#"+sum).hide(); 
						 senddate = "";
							 }
				);
		

	
		$('.fc-day-number').click(function(e){
		    var _target = $(e.target);
		    
		   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
		    alert("//"+senddate);
		    
		  

		    document.getElementById("cal_startdate").defaultValue = senddate;   
		    document.getElementById("dday_startdate").defaultValue = senddate;
		    document.getElementById("mission_date").defaultValue = senddate;
		    
		   $("#mission_subject0").empty();
			$("#addmission").empty();
			missioncnt = 1;
			
		 }); 
 */
	/* 	<c:forEach var="dday" items="${ddayList}">
			
			
			var html = "";
				
				html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='20px;'>";
				
				$("#${dday.DDAYDATE}").append(html);	
			
			</c:forEach>
		 */

			
	});


     function sm_fullsche(){

     	var date1 = new Date(); // 날짜 객체 생성
     	var y1 = date1.getFullYear(); // 현재 연도
     	var m1 =  date1.getMonth();// 현재 월
     	var d1 = date1.getDate(); // 현재 일
     	var nowmonth2 = 0;
	
     	var form_data1 = { sm_nowmonth : nowmonth
     	}
     			$.ajax({
     				url: "/main/myroom/getscheduleList.action",
     				method: "GET",
     				data : form_data1,
     				dataType: "JSON",
     				success: function(data){
     					if(data.length == 0) {
     						alert("등록된 일정이 한개도 없습니다.");
     					}
     					
     							var scheObjArr = [];
     							var scheEvent = "";
     							// 또는 var subArr = new Array();
     		var scheObjArrcnt = 0;
     						 	$.each(data, function(entryIndex, entry){ 
     						 		
     						 	//	alert(entry.START_DATE);
     						 	//	alert(entry.START_DATE.substring(0,10)+ entry.START_TIME);
     						 	//	alert("END_DATE="+entry.END_DATE.substring(0,10));
     						 	var start = entry.START_DATE.substring(0,10);
     						 	if(entry.START_TIME != "0"){
     						 	//	alert("fuck");
     						 		start = entry.START_DATE.substring(0,10) +"T"+ entry.START_TIME+":00";
									}
     						 	else{
     						 	//	alert("1차성공");
     						 	}
     						 	var endcnt = 0;
     						 	
     						 	if( "1-01-01 00" != entry.END_DATE.substring(0,10)){
     						 		
     						 	var end = entry.END_DATE.substring(0,10);
     						 	if(entry.END_TIME != "0"){
     						 		end = entry.END_DATE.substring(0,10) +"T"+ entry.END_TIME+":00";
     						 		
     						 	//end = entry.END_DATE.substring(0,10);
									}
     						 	endcnt++;
     						 //	alert("end="+end);
     						 	}
     						 	else{
     						 		start = entry.START_DATE.substring(0,10);
     						 	}
     						 	var urlcnt = 0;
     							if( entry.URL != "0"){
     								urlcnt++;
								}
     							
     							
     							if(urlcnt == 1 && endcnt == 0){
     								scheObjArr.push([ "{ title: '"+entry.SUBJECT+"'"
     												," start: '"+start +"'"
     												," url: 'https://www."+ entry.URL + "' }"
     												]);
     							}
     							else if(urlcnt == 1 && endcnt == 1){
     								scheObjArr.push([ "{ title: '"+entry.SUBJECT+"'"
     												," start: '"+start+"'"
     												," end: '"+end+"'"
     												
     												," url: 'https://www." +entry.URL + "' }"
     												]);
     							}
     							else if(urlcnt == 0 && endcnt == 1){
     								scheObjArr.push([ "{ title: '"+entry.SUBJECT+"'"
     												," start: '"+start+"'"
     												," end: '"+end+ "'}"
     												
     												]);
     							}
     							else{
     								scheObjArr.push([ "{ title: '"+entry.SUBJECT+"'"
											," start: '"+start + "'}"
											]);
     							}
     							
     							
     							});	 //eo entry
     						// end of if~else---------------------------	
     			//			alert("ajax 되닝?");
     				//		alert("이값은 들어오고...?"+scheObjArr);
     						
     					
     						$('#calendar').fullCalendar({
     						// 안됨;	alert("ㅠㅠ 오디야1");
     						
     		     				header: {
     		     					left: 'prev,next today',
     		     					center: 'title',
     		     					right: 'month,agendaWeek,agendaDay'
     		     					//안됨;; 	alert("ㅠㅠ 오디야2");
     		     				},   // 또 안됨;; alert("ㅠㅠ 오디야3");,
     		     				defaultDate: date1,			//'2015-02-12'
     		     				selectable: false,
     		     				selectHelper: false,
     		     				 
     		     				/* select: function(start, end) {
     		     					var title = prompt('Event Title:');
     		     					alert("ㅠㅠ 오디야4");
     		     					var eventData;
     		     					if (title) {
     		     						eventData = {
     		     							title: title,
     		     							start: start,
     		     							end: end
     		     						};
     		     						$('#calendar').fullCalendar('renderEvent', scheObjArr, true); // stick? = true
     		     					}
     		     					alert("ㅠㅠ 오디야5");
     		     					$('#calendar').fullCalendar('unselect');
     		     				}, */
     		     				editable: false,
     		     				eventLimit: true, // allow "more" link when too many events
     		     				events:eval("["+scheObjArr+"]")
     		     					
     		      				
     		     			});
     						
     						 
     						var date2 = new Date(); // 날짜 객체 생성
     						var y2 = date2.getFullYear(); // 현재 연도
     						var m2 =  date2.getMonth();// 현재 월
     						var d2 = date2.getDate(); // 현재 일
     						
     						
     						
     					$('.sm_cal_edit').hide();
     						
     					<c:forEach var="dday" items="${ddayList}">
     					
     					$("#${dday.DDAYDATE}").empty();	
     					
     					<c:if test="${dday.LEFTDATE == 'End'}">
     					var html = "";
     					
 						html += "&nbsp;<img title='지난 D-DAY입니다. ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;'>";
 						
 						$("#${dday.DDAYDATE}").append(html);	
 					
 						
 						</c:if>
 						
     					<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY == 1}">
     					var html = "";
     					
 						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' class='sm_selectdday'>";
 						
 						$("#${dday.DDAYDATE}").append(html);	
 					
 						
 						</c:if>
 						
 						<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY != 1}">
     					var html = "";
     						
     						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' style='cursor: pointer;' style='cursor: pointer;' onCLick='sm_candidateday(${dday.DDAYNO});'>";
     						
     						$("#${dday.DDAYDATE}").append(html);	
     						</c:if>
     						
     					</c:forEach>
     						
     					$('.fc-month-button').click(function(){
     						nowmonth = nowmonth +1;
     						$('.sm_cal_edit').hide();
     						
     						$('.fc-day-number').hover(
     								
     								function (e) { 
     									  var _target = $(e.target);
     									  var sum = "fc_daynum"+_target.data("date");
     									//  alert(_target.data("date"));
     									 /*  document.getElementById(sum).show(); */
     									 $("#"+sum).show(); 
     									 senddate = _target.data("date");
     									// alert(senddate);
     									 }, 
     									 function (e) { 
     											
     										  var _target = $(e.target);
     										  var sum = "fc_daynum"+_target.data("date");
     										 /*  document.getElementById(sum).show(); */
     										 $("#"+sum).hide(); 
     										 senddate = "";
     											 }
     								);
     						
     							$('.fc-day-number').click(function(e){
     							    var _target = $(e.target);
     							    
     							   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
     							    alert("//"+senddate);
     							    
     							  
     							
     							    document.getElementById("cal_startdate").defaultValue = senddate;   
     							    document.getElementById("dday_startdate").defaultValue = senddate;
     							    document.getElementById("mission_date").defaultValue = senddate;
     							   $("#mission_subject0").empty();
     								$("#addmission").empty();
     								missioncnt = 1;
     							    
     							    
     							 }); 
     							
     	     					<c:forEach var="dday" items="${ddayList}">
     	     					
     	     					$("#${dday.DDAYDATE}").empty();	
     	     					
     	     					<c:if test="${dday.LEFTDATE == 'End'}">
     	     					var html = "";
     	 						
     	 						html += "&nbsp;<img title='지난 D-DAY입니다. ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	 						
     	     					<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY == 1}">
     	     					var html = "";
     	     					
     	 						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' class='sm_selectdday'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	 						
     	 						<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY != 1}">
     	     					var html = "";
     	     						
     	     						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' style='cursor: pointer;' onCLick='sm_candidateday(${dday.DDAYNO});'>";
     	     						
     	     						$("#${dday.DDAYDATE}").append(html);	
     	     						</c:if>
     	     					</c:forEach>
     							
     					});		
     					
     					$('.fc-next-button').click(function(){
     						nowmonth = nowmonth +1;
     						$('.sm_cal_edit').hide();
     						
     						$('.fc-day-number').hover(
     								
     								function (e) { 
     									  var _target = $(e.target);
     									  var sum = "fc_daynum"+_target.data("date");
     									//  alert(_target.data("date"));
     									 /*  document.getElementById(sum).show(); */
     									 $("#"+sum).show(); 
     									 senddate = _target.data("date");
     									// alert(senddate);
     									 }, 
     									 function (e) { 
     											
     										  var _target = $(e.target);
     										  var sum = "fc_daynum"+_target.data("date");
     										 /*  document.getElementById(sum).show(); */
     										 $("#"+sum).hide(); 
     										 senddate = "";
     											 }
     								);
     						
     							$('.fc-day-number').click(function(e){
     							    var _target = $(e.target);
     							    
     							   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
     							    alert("//"+senddate);
     							    
     							  
     							
     							    document.getElementById("cal_startdate").defaultValue = senddate;   
     							    document.getElementById("dday_startdate").defaultValue = senddate;
     							    document.getElementById("mission_date").defaultValue = senddate;
     							   $("#mission_subject0").empty();
     								$("#addmission").empty();
     								missioncnt = 1;
     							    
     							    
     							 }); 
     							
     	     					<c:forEach var="dday" items="${ddayList}">
     	     					
     	     					$("#${dday.DDAYDATE}").empty();	
     	     					
     	     					<c:if test="${dday.LEFTDATE == 'End'}">
     	     					var html = "";
     	 						
     	 						html += "&nbsp;<img title='지난 D-DAY입니다. ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	     					<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY == 1}">
     	     					var html = "";
     	     					
     	 						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' class='sm_selectdday'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	 						
     	 						<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY != 1}">
     	     					var html = "";
     	     						
     	     						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' style='cursor: pointer;' onCLick='sm_candidateday(${dday.DDAYNO});'>";
     	     						
     	     						$("#${dday.DDAYDATE}").append(html);	
     	     						</c:if>
     	     					</c:forEach>
     							
     					});		
     					
     					
     				$('.fc-prev-button').click(function(){
     					nowmonth = nowmonth -1;
     						$('.sm_cal_edit').hide();
     						
     						$('.fc-day-number').hover(
     								
     								function (e) { 
     									  var _target = $(e.target);
     									  var sum = "fc_daynum"+_target.data("date");
     									//  alert(_target.data("date"));
     									 /*  document.getElementById(sum).show(); */
     									 $("#"+sum).show(); 
     									 senddate = _target.data("date");
     									// alert(senddate);
     									 }, 
     									 function (e) { 
     											
     										  var _target = $(e.target);
     										  var sum = "fc_daynum"+_target.data("date");
     										 /*  document.getElementById(sum).show(); */
     										 $("#"+sum).hide(); 
     										 senddate = "";
     											 }
     								);
     						
     							$('.fc-day-number').click(function(e){
     							    var _target = $(e.target);
     							    
     							   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
     							    alert("//"+senddate);
     							    
     							  
     							
     							    document.getElementById("cal_startdate").defaultValue = senddate;   
     							    document.getElementById("dday_startdate").defaultValue = senddate;
     							    document.getElementById("mission_date").defaultValue = senddate;
     							   $("#mission_subject0").empty();
     								$("#addmission").empty();
     								missioncnt = 1;
     							    
     							    
     							 }); 
     							
     	     					<c:forEach var="dday" items="${ddayList}">
     	     					
     	     					$("#${dday.DDAYDATE}").empty();	
     	     					
     	     					<c:if test="${dday.LEFTDATE == 'End'}">
     	     					var html = "";
     	 						
     	 						html += "&nbsp;<img title='지난 D-DAY입니다. ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	 						
     	     					<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY == 1}">
     	     					var html = "";
     	     					
     	 						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' class='sm_selectdday'>";
     	 						
     	 						$("#${dday.DDAYDATE}").append(html);	
     	 					
     	 						
     	 						</c:if>
     	 						
     	 						<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY != 1}">
     	     					var html = "";
     	     						
     	     						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' style='cursor: pointer;' onCLick='sm_candidateday(${dday.DDAYNO});'>";
     	     						
     	     						$("#${dday.DDAYDATE}").append(html);	
     	     						</c:if>
     	     					</c:forEach>
     							
     					});	


     				
     	
     	
     	
     				$('.fc-today-button').click(function(){
     					
     					$('.sm_cal_edit').hide();
     					
     					$('.fc-day-number').hover(
     							
     							function (e) { 
     								  var _target = $(e.target);
     								  var sum = "fc_daynum"+_target.data("date");
     								//  alert(_target.data("date"));
     								 /*  document.getElementById(sum).show(); */
     								 $("#"+sum).show(); 
     								 senddate = _target.data("date");
     								// alert(senddate);
     								 }, 
     								 function (e) { 
     										
     									  var _target = $(e.target);
     									  var sum = "fc_daynum"+_target.data("date");
     									 /*  document.getElementById(sum).show(); */
     									 $("#"+sum).hide(); 
     									 senddate = "";
     										 }
     							);
     					
     						$('.fc-day-number').click(function(e){
     						    var _target = $(e.target);
     						    
     						   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
     						    alert("//"+senddate);
     						    
     						  
     						
     						    document.getElementById("cal_startdate").defaultValue = senddate;   
     						    document.getElementById("dday_startdate").defaultValue = senddate;
     						    document.getElementById("mission_date").defaultValue = senddate;
     						   $("#mission_subject0").empty();
     							$("#addmission").empty();
     							missioncnt = 1;
     						    
     						    
     						 }); 
     						
         					<c:forEach var="dday" items="${ddayList}">
         					
         					$("#${dday.DDAYDATE}").empty();	
         					
         					<c:if test="${dday.LEFTDATE == 'End'}">
         					var html = "";
     						
     						html += "&nbsp;<img title='지난 D-DAY입니다. ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;'>";
     						
     						$("#${dday.DDAYDATE}").append(html);	
     					
     						
     						</c:if>
     						
 	     					<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY == 1}">
 	     					var html = "";
 	     					
 	 						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' class='sm_selectdday'>";
 	 						
 	 						$("#${dday.DDAYDATE}").append(html);	
 	 					
 	 						
 	 						</c:if>
 	 						
 	 						<c:if test="${dday.LEFTDATE != 'End' && dday.DATEPRIORITY != 1}">
 	     					var html = "";
 	     						
 	     						html += "&nbsp;<img title='D-DAY까지 ${dday.LEFTDATE}일!! ${dday.DDAYSUBJECT }' src='/main/resources/img/sm/icon${dday.COLOR }.png' width='auto;' height='17px;' style='cursor: pointer;' onCLick='sm_candidateday(${dday.DDAYNO});'>";
 	     						
 	     						$("#${dday.DDAYDATE}").append(html);	
 	     						</c:if>
         					</c:forEach>
     						
     				});		//eo docu re

     				var senddate = "";
     				$('#moremission').click(function(){

     					var html = "";
     					html += "<br/>";
     					html += "		<input type='text' id='mission_subject"+missioncnt+"' name='mission_subject"+missioncnt+"' class='form-control' style='widhth: 66.6%; height: 30px;'>";
     					
     					$("#addmission").append(html);	
     					missioncnt++;
     				});

     					$('#modal_test_sm').click(function(e){
     						alert("!");
     					});

     						$('.fc-day-number').hover(
     								
     								function (e) { 
     									  var _target = $(e.target);
     									  var sum = "fc_daynum"+_target.data("date");
     									//  alert(_target.data("date"));
     									 /*  document.getElementById(sum).show(); */
     									 $("#"+sum).show(); 
     									 senddate = _target.data("date");
     									// alert(senddate);
     									 }, 
     									 function (e) { 
     											
     										  var _target = $(e.target);
     										  var sum = "fc_daynum"+_target.data("date");
     										 /*  document.getElementById(sum).show(); */
     										 $("#"+sum).hide(); 
     										 senddate = "";
     											 }
     								);
     						
     						
     					
     						$('.fc-day-number').click(function(e){
     						    var _target = $(e.target);
     						    
     						   // 이거 도대체 왜 안됨 ㅡㅡ?var clickdate = _target.data("date");
     						    alert("//"+senddate);
     						    
     						  

     						    document.getElementById("cal_startdate").defaultValue = senddate;   
     						    document.getElementById("dday_startdate").defaultValue = senddate;
     						    document.getElementById("mission_date").defaultValue = senddate;
     						    
     						   $("#mission_subject0").empty();
     							$("#addmission").empty();
     							missioncnt = 1;
     							
     						 }); 
					
     						 
     				}, // end of success: function(data){ }-------------------------
     				error: function(request, status, error){
     					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
     				}
     			});
     					

     	
     }  //eof sm_fullsche

  
</script>

<script type="text/javascript">


/* $('.sc_candidateday').click(function(){
		

  	var form_data1 = { sm_nowmonth : nowmonth
  	}
  			$.ajax({
  				url: "/main/myroom/getscheduleList.action",
  				method: "GET",
  				data : form_data1,
  				dataType: "JSON",
  				success: function(data){
  					if(data.length == 0) {
  						alert("등록된 일정이 한개도 없습니다.");
  					}
  					
  							var scheObjArr = [];
  							var scheEvent = "";
  							// 또는 var subArr = new Array();
  		var scheObjArrcnt = 0;
  						 	$.each(data, function(entryIndex, entry){ 
  						 		
  						 		
	}); */

	
	function sm_candidateday(ddayno){
		
		var ajax_data = { new_ddayno : ddayno };
		
		$.ajax({
				url: "/main/myroom/selectdday.action",
				method: "GET",
				data : ajax_data,
				dataType: "JSON",
				success: function(data){
					if(data.length == 0) {
						alert("등록된 일정이 한개도 없습니다.");
					}
					else{
						alert("등록되었습니다")
					}
					window.location.reload();
					//sm_fullsche();
				
				}, // end of success: function(data){ }-------------------------
 				error: function(request, status, error){
 					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
 				}
 			});
		
		
		
		
	}//eof
	
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
                //	filenamearr[cnt] = file.name;
                //	files += "<input type='hidden' name='filename' value='"+file.name+"'>";
                    txt += "이름: " + file.name + "<br>";
                }
                if ('size' in file) {
                //	filesizearr[cnt] = file.size;
                //	files += "<input type='hidden' name='filesize' value='"+file.size+"'>";
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




function goschewrite(){
	
//	alert("하하");
/* 	
	if(link.trim()==""){
		alert("영상링크는 필수입력사항입니다!");
		return;
	}
	
	if(start==finish){
		alert("종료시간을 다시 설정해주세요!");
		return;
	} 유효성 검사 ㅡㅡ
	 */
	
	var scheFrm = document.scheFrm;
	scheFrm.method="post" ;
	scheFrm.action="<%= request.getContextPath() %>/myroom/schedulewriteEnd.action";
	scheFrm.submit();
	
}



function goddaywrite(){
	
//	alert("하하");
/* 	
	if(link.trim()==""){
		alert("영상링크는 필수입력사항입니다!");
		return;
	}
	
	if(start==finish){
		alert("종료시간을 다시 설정해주세요!");
		return;
	} 유효성 검사 ㅡㅡ
	 */
	
	var ddayFrm = document.ddayFrm;
	ddayFrm.method="post" ;
	ddayFrm.action="<%= request.getContextPath() %>/myroom/ddaywrite.action";
	ddayFrm.submit();
	
}




function gosmissionwrite(){
//	alert("missioncnt="+missioncnt);
//	alert("하하");
/* 	
	if(link.trim()==""){
		alert("영상링크는 필수입력사항입니다!");
		return;
	}
	
	if(start==finish){
		alert("종료시간을 다시 설정해주세요!");
		return;
	} 유효성 검사 ㅡㅡ
	 */
	  $('#missioncnt').val(missioncnt);


	// document.getElementById("missioncnt").val = missioncnt;
	var missionFrm = document.missionFrm;
	missionFrm.method="post" ;
	missionFrm.action="<%= request.getContextPath() %>/myroom/missionwrite.action";
	missionFrm.submit();
	
}
</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>

<body>
<br>
	<div id='calendar'></div>
	<br><br><br>
<table>
	<tr>

	</tr>
	
	
       
</table>
 <%-- 라이브방송 시작 Modal --%>
<div class="modal fade" id="calwrite" role="dialog">
	<div class="modal-dialog">
	 <%-- Modal content--%>
      <div class="modal-content">
      <div align="right">
      	<img src="<%= request.getContextPath() %>/resources/images/roomlive/close-cross.png" onClick="goClose();" 
      	style="margin-top: 3%; margin-right: 3%;" width="20px" height="20px"/>
      	</div>
        <div class="modal-body" id="modal-body" style="height: auto; width: 100%;">
          <div>
             <!-- Nav tabs -->
  
            <table class="list-inline tabs-bordered" id="myroomtab" role="tablist">
            <tr>
                <td role="presentation" class="active ty_tab"><a href="#tb4" aria-controls="tb4" role="tab" data-toggle="tab"> 일정 작성</a>&nbsp;&nbsp;/&nbsp;&nbsp;</td>
         <td role="presentation" class="ty_tab"><a href="#tb2" aria-controls="tb2" role="tab" data-toggle="tab"> D-DAY 설정</a>&nbsp;&nbsp;/&nbsp;&nbsp;</td>
                <td role="presentation" class="ty_tab"><a href="#tb3" aria-controls="tb3" role="tab" data-toggle="tab"> 할일 작성</a></td>
            </tr>
            </table>
            
            <div class="divide30"></div>
            
            <!-- Tab panes -->
            <div class="tab-content">
            
            <!-- 일정 작성  -->


 <div role="tabpanel" class="tab-pane active" id="tb4">
          
           
               <div class="container" style="width: 95%; height: auto;">

                     <div class="panel">
                 
                                    <div class="panel-body" >
                                       
                                        <div class="row mail-header">
                                            <div class="col-md-6" id="modal_test_sm">
                                                <h3>일정 작성</h3>
                                            </div>
                                   
                                        </div>
                                        <hr>
                                      
  <form name="scheFrm" class="form-horizontal" method="post" enctype="multipart/form-data"> 
            <div id="sm_top" style="margin-left: 30px; margin-bottom:15px; line-height: 37px; ">
                                   
                <table >
                
                <tr>
                <th>	시작시간&nbsp;   &nbsp; </th> 
                <td><input type="date" id="cal_startdate" name="cal_startdate" value="" class="form-control"  style="width: auto; height: 30px; text-align: center;" >
                </td>
              <!--   <td>&nbsp;</td> -->
                <td style="width: 90px;"><input type="time" id="cal_starttime" name="cal_starttime" value="" class="form-control"  step="600" style="width: auto; height: 30px; text-align: center;">
                </td>	</tr>
                	
                
                  	<tr>
                <th>	종료시간&nbsp;   &nbsp; </th> 
                <td><input type="date" id="cal_enddate" name="cal_enddate" value="" class="form-control"  style="width: auto; height: 30px; text-align: center;" >
                </td>
         <!--   <td>&nbsp;</td>  -->
                <td><input type="time" id="cal_endtime" name="cal_endtime" value="" class="form-control"  step="600" style="width: auto; height: 30px; text-align: center;">
                </td>	</tr>

                	<tr style="height: 15px;"></tr>
                	<tr style="width: 95%;">
                	<th> &nbsp;장&nbsp;소&nbsp; &nbsp;   </th> 
                	<td style="widhth: 95%; "><input type="text" id="cal_place" name="cal_place" style="widhth: 55%; height: 30px; " /></td>
                	<td style="font-size: 9pt;">&nbsp;&nbsp;&nbsp;<a href="">스터디룸 선택</a></td>
                	</tr>
                	<tr style="height: 10px;"></tr>
                	<tr style="width: 95%;">
                	<th> &nbsp;링&nbsp;크&nbsp; &nbsp;  </th> 
                	<td style="widhth: 95%; "><input type="text" id="cal_url" name="cal_url" step="600"  style="widhth: 55%; height: 30px; " /></td>

                	</tr>
                	
                	<tr style="height: 15px;"></tr>
                	
                	<tr>
                	<th>&nbsp;제&nbsp;목&nbsp; &nbsp; 
                	</th>
                	<td style="widhth: 66.6%; "><input type="text" id="cal_subject" name="cal_subject" class="form-control" style="widhth: 66.6%; height: 30px; " ></td>
                	</tr>
                	
                	<tr>
                	<th>내용작성</th>
                	<td><textarea class="form-control"  id="cal_content" name="cal_content" style="min-height: 200px;"></textarea></td>
                	</tr>
                	
                	
                	<tr>
                	<th>이미지 추가</th>
                	<td>
                	<input type="file" name="attach2" id="myFile" class="form-control ty_form" multiple size="50" onchange="addFile()">
	
					<p id="demo" style="font-size: 11pt;"></p>
					<div id="fileattach"></div></td>
                	</tr>
               </table>
	                   	
	                   </div>

                                           </form>
                                        <div class="space-20"></div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                              
                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-primary btn-lg rounded" onClick="goschewrite();">작성</button>
                                                    <button type="reset" class="btn btn-danger  btn-lg rounded">취소</button>
                                               
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
	</div>
    </div>     
    
    
    
    
    
                  <!-- DDAY 작성 -->
							<div role="tabpanel" class="tab-pane" id="tb2">


								<div class="container" style="width: 95%; height: auto;">

									<div class="panel">

										<div class="panel-body">

											<div class="row mail-header">
												<div class="col-md-6" id="modal_test_sm">
													<h3>D-DAY 설정</h3>
												</div>

											</div>
											<hr>

											<form name="ddayFrm" class="form-horizontal" method="post">
												<div id="sm_top"
													style="margin-left: 30px; margin-bottom: 15px; line-height: 37px;">

													<table>

														<tr>
															<th>D-DAY&nbsp; &nbsp;</th>
															<td><input type="date" id="dday_startdate"
																name="dday_startdate" value="" class="form-control"
																style="width: auto; height: 30px; text-align: center;">
															</td>
															<!--   <td>&nbsp;</td> -->
															<td style="width: 90px; padding-left: 16px;"><input type="time"
																id="dday_starttime" name="dday_starttime" value=""
																class="form-control" step="600"
																style="width: auto; height: 30px; text-align: center;">
															</td>
														</tr>



														<tr style="height: 15px;"></tr>

														<tr>
															<th >D-DAY&nbsp;제목&nbsp; &nbsp;</th>
															<td colspan="2"><input type="text" id="dday_subject"
																name="dday_subject" class="form-control"
																style="widhth: 66.6%; height: 30px;"></td>
														</tr>



													</table>

												</div>

											</form>
											<div class="space-20"></div>
											<div class="row">
												<div class="col-sm-12">

													<div class="text-right">
														<button type="submit"
															class="btn btn-primary btn-lg rounded"
															onClick="goddaywrite();">설정</button>
														<button type="reset"
															class="btn btn-danger  btn-lg rounded">취소</button>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- eo tb2 -->





							<!-- 할일 추가 -->     
             
                    <div role="tabpanel" class="tab-pane" id="tb3">
             <div class="container" style="width: 95%; height: auto;">

									<div class="panel">

										<div class="panel-body">

											<div class="row mail-header">
												<div class="col-md-6" id="modal_test_sm">
													<h3>할일 작성</h3>
												</div>

											</div>
											<hr>

											<form name="missionFrm" class="form-horizontal" method="post">
												<div id="sm_top"
													style="margin-left: 30px; margin-bottom: 15px; line-height: 37px;">

													<table style="width: 88%">
														<tr>
															<th>완료일</th>
															<td><input type="date" id="mission_date"
																name="mission_date" value="" class="form-control"
																style="float: left; width: auto; height: 30px; text-align: center;">
															</td>
														</tr>
														<tr>
															
															<td colspan="2">
																<input type="text" id="mission_subject0"
																name="mission_subject0" class="form-control"
																style=" height: 30px;">
																
															</td>
														</tr>
														<tr>
															
															<td colspan="2" id="addmission" style="line-height: 13px;" >
															</td>
														</tr>

														<tr>
															<td style="float: right; font-size: 9pt; color: #3498db; cursor: pointer;" id="moremission"  >
																할일 추가하기...
															</td>
															
														</tr>

													</table>
														<input type="hidden" id="missioncnt" name="missioncnt" />
												</div>
											
											</form>
											<div class="space-20"></div>
											<div class="row">
												<div class="col-sm-12">

													<div class="text-right">
														<button type="submit"
															class="btn btn-primary btn-lg rounded"
															onClick="gosmissionwrite();">추가</button>
														<button type="reset"
															class="btn btn-danger  btn-lg rounded">취소</button>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
       </div>
       </div>
       </div>
       </div>
      
       </div>
       </div>
       
</body>

</html>

