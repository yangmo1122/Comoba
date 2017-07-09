<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Assan admin</title>

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath() %>/resources/sm/calendar/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="<%=request.getContextPath() %>/resources/sm/calendar/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath() %>/resources/sm/calendar/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/resources/sm/calendar/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href='<%=request.getContextPath() %>/resources/sm/calendar/plugins/fullcalendar/fullcalendar.css' rel="stylesheet">

        <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/sm/calendar/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/sm/calendar/js/modernizr.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
      
      
      
      <script type="text/javascript">
  // *** 주문하기 ***//
  function goMissionEdit() {
	  
	 // var missionnumArr = document.getElementsByName("missionnum"); // 체크박스
	  var cnt = 0;
	  var sumsaleprice = 0;
	  var sumPoint = 0;
	  
	  for(var i=0; i< ${missionList.size()}; i++) {
		  if(document.getElementById("mission"+i).checked == true) {//반복하는것중 체크된 것들
			  cnt++;
		  }
		  else{
				//반복중  체크박스에 체크가 안된것들이라면
				
				document.getElementById("mission"+i).disabled = true;
				document.getElementById("missionnum"+i).disabled = true;
		  	}
		  }
		 
	  // end of for------------------	
	
	  if(cnt == 0){
		  alert("체크해주시고 눌러주세요!");
	  }
	  else{
		  
			document.getElementById("sm_cnt").value = cnt;
			 // 체크박스에 체크가 적어도 하나이상 된 경우.
			 var missionFrm = document.missionFrm;
			 
			
			 
		//	 alert("확인용 sumsaleprice : "+sumsaleprice);
			 
			
		//	 alert("확인용 sumPoint : " + sumPoint);
			 
			 missionFrm.action = "<%= request.getContextPath() %>/myroom/micomplete.action";
			 missionFrm.method = "post";
			 missionFrm.submit();

	  }
	    
  }// end of function goOrder()-------------------
  
  </script>
    <body>

        <!--side navigation start-->
         
 
          <form name=calFrm>

                <!--start main content-->
                
                 
                     
                     
                                           	<div id='calendar' style="width: 66.6%; min-width: 500px; margin:auto; "></div>
                                         
                                <!-- 	<div style="border: solid 7px #909090; float:left; width:1%; height: 650px; "></div> -->
                                     
                 
</form>
   
       <body>

<!--          
        <div class="divide80"></div>
        <div class="container">

            <div class="center-heading">
                <h2>Our portfolio</h2>
                <span class="center-line"></span>
            </div>   

            <ul class="filter list-inline">
                <li><a class="active" href="#" data-filter="*">Show All</a></li>
                <li><a href="#" data-filter=".photography">Photography</a></li>
                <li><a href="#" data-filter=".illustration">illustration</a></li>
                <li><a href="#" data-filter=".branding">branding</a></li>
                <li><a href="#" data-filter=".web-design">web design</a></li>
            </ul>
            <div class="row">
                <div class="portfolio-box iso-call col-3-space">

                    <div class="project-post photography branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-8.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-8.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="portfolio-single.html">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post
                    <div class="project-post illustration web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-1.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-1.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="portfolio-single.html">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post

                    <div class="project-post illustration web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-2.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-2.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post
                    <div class="project-post photography web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-4.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-4.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post

                    <div class="project-post branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-5.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-5.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post
                    <div class="project-post  illustration">
                        <div class="item-img-wrap ">
                            <img src="img/img-6.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-6.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post

                    <div class="project-post  branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-7.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-7.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post


                    <div class="project-post   web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-8.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-8.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post

                    <div class="project-post  branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-9.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-9.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="#">Logo Design</a></h3>
                            <span>illustrate</span>
                        </div>work desc
                    </div>project post
                </div>
            </div>
        </div>container
    -->
  
        <div class="divide80"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="center-heading">
                        <h3 style="float:left;">${clickdate} &nbsp;D-DAY</h3><br>
                        <div style="height: 5px; width:187px; border-top: 1px solid #777; "></div>
                        <div style="height: 20px;"></div>
                        <c:if test="${scheList.isEmpty() }"> <span style="float: left;"> 등록된 'D-DAY'가 없습니다.</span></c:if>
                        <c:if test="${!scheList.isEmpty() }">
                       <div style="float: left;">
                       
                       <c:forEach var="dday" items="${ddayList}">
                       
                        <c:if test="${dday.LEFTDATE == 'End'}">
                        
                        <img src='/main/resources/img/sm/icon${dday.COLOR }.png' /> &nbsp;&nbsp;
                      		<span style="color: #a6a6a6;"> ${dday.DDAYSUBJECT }</span>( 지난 D-DAY입니다.)
                      		 
                        </c:if>
                        
                        <c:if test="${dday.LEFTDATE != 'End'}">
                          <img src='/main/resources/img/sm/icon${dday.COLOR }.png' /> &nbsp;&nbsp;
                          <span> ${dday.DDAYSUBJECT }</span> <br>
                          D-DAY까지 ${dday.LEFTDATE}일!!
                          </c:if>
                        
                       </c:forEach>
                      
                       </div>
                       </c:if>
                    </div><!--center-heading-->
                </div>
            </div>
            <div class="divide30"></div>
            <div class="row">
                <div class="col-md-7">
                 <h4 style="float:left;">&nbsp;일 정</h4><br>
                 <div style="height: 5px; width:53px; border-top: 1px solid #777; padding-bottom: 10px;"></div>
                   
                    <div class="panel-group" id="accordion">
                  <c:if test="${scheList.isEmpty() }"> 등록된 '일 정'이 없습니다.</c:if>
                        <c:if test="${!scheList.isEmpty() }">
                        <c:forEach var="schedata" items="${scheList }" varStatus="status">

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse${status.index }"> ${schedata.SUBJECT } </a>
								</h4>
							</div>
							<div id="collapse${status.index }"
								class="panel-collapse collapse">
								<div class="panel-body">
								
						 		시간  :  ${schedata.START_DATE.substring(0,10) }<c:if test="${schedata.START_TIME != '0' }">  ${schedata.START_TIME} </c:if>
                         		<c:if test="${ schedata.END_DATE.substring(0,10) != '1-01-01 00'}">~ ${ schedata.END_DATE.substring(0,10)} </c:if><c:if test="${schedata.END_TIME != '0' }">  ${schedata.END_TIME} </c:if>
                          	
									
									<br>
									
									  <c:if test="${ !(schedata.PLACE eq '0') }">
                         				공부장소 :  ${schedata.PLACE }
                                    	<br>
									</c:if>
								
									
									 <c:if test="${!(schedata.URL eq '0') }">
                                     	참조 사이트 : <a href='https://www.${schedata.URL}'> ${schedata.URL }</a>
										<br>
									</c:if> 
									내용 : ${schedata.SCHEDULE_CONTENTS } <br>


									<c:if test="${schedata.SCHECOUNT != 0}">
                	 첨부파일&nbsp;:&nbsp;
                </c:if>
									<c:set var="iftest" value="${schedata.SCHEDULE_NO}"></c:set>




									<c:forEach var="file" items="${scheFileList}">


										<c:if test="${iftest == file.SCHEDULE_NO}">

											<img
												src="<%=request.getContextPath()%>/resources/images/live/download.png">
											<a
												href="<%= request.getContextPath()%>/download.action?fileName=${file.FILENAME}&orgFilename=${file.ORGFILENAME}">${file.ORGFILENAME}</a>
										</c:if>

									</c:forEach>

								</div>
							</div>
						</div>

					</c:forEach>
                       </c:if>
                        
                   

                    </div>
                </div><!--collapse col-->
                <div class="col-md-4 col-md-offset-1">
                    <div class="sidebar-box margin40">
                        <h4>할 일 (${totalstatus} / ${missionList.size()})</h4>
                        <div style="height: 5px; width:68px; border-top: 1px solid #777; padding-bottom: 10px;"></div>
                        <form name="missionFrm"role="form" class="search-widget">
                        <p>
                        <c:if test="${missionList.isEmpty() }"> 등록된 '할 일'이 없습니다.</c:if>
                        <c:if test="${!missionList.isEmpty() }">
                           <c:forEach var="mission" items="${missionList }" varStatus="status">
                           	<td>
                           	<c:if test="${mission.STATUS == 1 }">
						 	    <input type="checkbox" name="mission${status.index}" id="mission${status.index}" checked disabled="disabled" />&nbsp;${mission.CONTENTS}
						 		<input type="hidden" value="${mission.MISSIONNUM }" id="missionnum${status.index}" name="missionnum${status.index}" />
						 	</c:if>
						 	<c:if test="${mission.STATUS == 0 }">
						 	    <input type="checkbox" name="mission${status.index}" id="mission${status.index}"/>&nbsp;${mission.CONTENTS}
						 	    <input type="hidden" value="${mission.MISSIONNUM }" id="missionnum${status.index}" name="missionnum${status.index}" />
						 	</c:if>
						 	
						 	    <br>
						 	</td>
							
							
							<%-- <td align="left">
								<input type="text" name="oqty" id="oqty${status.index}" value="${cartvo.oqty}" size="2" />개
								<input type="hidden" name="cartno" id="cartno${status.index}" value="${cartvo.cartno}" />
								<button type="button" onClick="goOqtyEdit('${cartvo.cartno}', 'oqty${status.index}' );">수정</button> 
							</td> --%>
                           </c:forEach>
                           <input type="hidden" value="${clickdate}" id="miclickdate" name="miclickdate" />
						 	<input type="hidden" value="${missionList.size()}" id="missionsize" name="missionsize" />
						 	<input type="hidden" value="" id="sm_cnt" name="sm_cnt" />
								
							
                           </c:if>
                            </form>
                           <button  style="float: right" type="button" onClick="goMissionEdit();">다 했어!</button>
                        </p>
                       
                    </div><!--sidebar-box-->
                    
                </div>
            </div>
        </div>
<!--end main content-->
            
       


        <!--Common plugins-->
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/js/app.js"></script>
        <!--page js-->
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/momentJs/moment.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sm/calendar/plugins/fullcalendar/fullcalendar.min.js?ver=1.07"></script>
        
        
        
        <script>
     	var date1 = new Date(); // 날짜 객체 생성
      	var y1 = date1.getFullYear(); // 현재 연도
      	var m1 =  date1.getMonth();// 현재 월
      	var d1 = date1.getDate(); // 현재 일
      	var nowmonth2 = 0;
		var ajaxdate = '${clickdate}';
		var date2 = new Date(ajaxdate);
		var y2 = date2.getFullYear(); // 현재 연도
      	var m2 =  date2.getMonth();// 현재 월
      	var d2 = date2.getDate(); // 현재 일
      	var ajaxday = date2.getDay();// 현재 요일
     
      	var date3 = new Date(y2, m2, (parseInt(d2) - parseInt(ajaxday)));
      	var y3 = date3.getFullYear();
      	var m3 = (parseInt(date3.getMonth())+1); // 날짜 객체 생성
     	var d3= date3.getDate(); // 날짜 객체 생성
     	
     	var m03 = "";
     	if(m3 < 10){
     		m03 = "0"+m3;
     	}
     	else{
     		m03 = m3;
     	}
     	 
     	var d03 = "";
     	if(d3 < 10){
     		d03 = "0"+d3;
     	}
     	else{
     		d03 = d3;
     	}
		
     	var ajaxsun = y3+"-"+m03+"-"+d03;
     	
     	
     	
    //  	alert(ajaxsun);
      	
      	$(document).ready(function () {
                /* initialize the external events
                 -----------------------------------------------------------------*/

              	sm_loadcal();
              	
                }); //eo doc ready
          
         	
          	
          	
          	function sm_loadcal(){
                	
             	var form_data1 = { sm_clickdate : ajaxdate,
             						sm_clickday : ajaxday,
             				 		sm_sunday : ajaxsun 
             	};
             	
                	
          		$.ajax({
     				url: "/main/myroom/getcaldetailList.action",
     				method: "GET",
     				data : form_data1,
     				dataType: "JSON",
     				success: function(data){
     				

     							var htmldday = "";
     					      	var htmlsche = "";
     					      	var htmlmission = "" ;
     					      	var cnt = 0;
     						 	$.each(data, function(entryIndex, entry){ 
     		
     						 		if(parseInt(entry.dday) == 0){
     						 			$("#detail_dday"+entry.date).empty();
     						 		}else{
     						 			
     						 		}
     						 			
     						 		if(parseInt(entry.sche) == 0 ){
     						 			$("#detail_sche"+entry.date).empty();
     						 		}
     						 		else{
     						 			
     						 		}
     						 				
     						 		if(parseInt(entry.mission) == 0 ){
     						 			$("#mission"+entry.date).empty();
     						 		}
     						 		else{
     						 			
     						 		}	
     						 			
         					      	htmldday += "";
         					      	htmlsche += "";
         					      	htmlmission += "" ;
     						 		alert(entry.date);
     						 		
         					      	$("#detail_dday"+entry.date).empty();
         					      	$("#detail_dday"+entry.date).append("");
         					      	
     		     					$("#detail_sche${dday.DDAYDATE}").empty();	
     		     					$("#detail_mission${dday.DDAYDATE}").empty();	
     							
     		     					cnt++;
     							});	 //eo entry
     						// end of if~else---------------------------	
     			//			alert("ajax 되닝?");
     				//		alert("이값은 들어오고...?"+scheObjArr);
     						
     					
     					/* 	$('#calendar').fullCalendar({
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
     		     				
     		     				editable: false,
     		     				eventLimit: true, // allow "more" link when too many events
     		     				events:eval("["+scheObjArr+"]")
     		     					
     		      				
     		     			});
     						 */
     						 
     						var date2 = new Date(); // 날짜 객체 생성
     						var y2 = date2.getFullYear(); // 현재 연도
     						var m2 =  date2.getMonth();// 현재 월
     						var d2 = date2.getDate(); // 현재 일
     						
     						
     						
     					
     						
     	
     	
     	
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
     						
     				});		//eof click event

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
     					

          		
          		
          		
          		
             $('#calendar').fullCalendar({
					// 안됨;	alert("ㅠㅠ 오디야1");
					
	     				header: {
	     					left: 'prev,next today',
	     					center: 'title',
	     					right: ''
	     					//안됨;; 	alert("ㅠㅠ 오디야2");
	     				},   // 또 안됨;; alert("ㅠㅠ 오디야3");,
	     				defaultDate: ajaxdate,
	     				selectable: false,
	     				selectHelper: false,
	     				defaultView: 'agendaWeek',

	     				editable: false,
	     				eventLimit: true, // allow "more" link when too many events
	     				//events:eval("["+scheObjArr+"]")
	     					
	      				
	     			});
             
          	}
          	
        </script>
    </body>
</html>