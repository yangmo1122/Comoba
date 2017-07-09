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
        <link href='<%=request.getContextPath() %>/resources/calendar/plugins/fullcalendar/fullcalendar.css' rel="stylesheet">

        <!--template custom css file-->
        <link href="<%=request.getContextPath() %>/resources/calendar/css/style.css" rel="stylesheet">

        <script src="<%=request.getContextPath() %>/resources/calendar/js/modernizr.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style="height: 100%;">

        <!--side navigation start-->
       
 
          <form name=calFrm>

             <div id="calendar" class="fc fc-unthemed fc-ltr">
             <div class="fc-toolbar">


             <div class="fc-center"><h2>Jun 11 – 17, 2017</h2></div><div class="fc-clear"></div></div>
             <div class="fc-view-container" style="">
             <div class="fc-view fc-agendaWeek-view fc-agenda-view">
             
             <table>
             <thead class="fc-head">
             <tr>
             <td class="fc-head-container fc-widget-header">
             <div class="fc-row fc-widget-header" style="border-right-width: 1px; margin-right: 16px;">
             <table>
             <thead>
             <tr
             ><th class="fc-axis fc-widget-header" style="width:41px"></th>
             <th class="fc-day-header fc-widget-header fc-sun" data-date="2017-06-11">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-11&quot;,&quot;type&quot;:&quot;day&quot;}">Sun 6/11</a></th>
             <th class="fc-day-header fc-widget-header fc-mon" data-date="2017-06-12">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-12&quot;,&quot;type&quot;:&quot;day&quot;}">Mon 6/12</a></th>
             <th class="fc-day-header fc-widget-header fc-tue" data-date="2017-06-13">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-13&quot;,&quot;type&quot;:&quot;day&quot;}">Tue 6/13</a></th>
             <th class="fc-day-header fc-widget-header fc-wed" data-date="2017-06-14">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-14&quot;,&quot;type&quot;:&quot;day&quot;}">Wed 6/14</a></th>
             <th class="fc-day-header fc-widget-header fc-thu" data-date="2017-06-15">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-15&quot;,&quot;type&quot;:&quot;day&quot;}">Thu 6/15</a></th>
             <th class="fc-day-header fc-widget-header fc-fri" data-date="2017-06-16">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-16&quot;,&quot;type&quot;:&quot;day&quot;}">Fri 6/16</a></th>
             <th class="fc-day-header fc-widget-header fc-sat" data-date="2017-06-17">
             <a data-goto="{&quot;date&quot;:&quot;2017-06-17&quot;,&quot;type&quot;:&quot;day&quot;}">Sat 6/17</a></th></tr></thead></table></div></td></tr></thead>
             
             <tbody class="fc-body">
             <tr>
             <td class="fc-widget-content">
             <div class="fc-day-grid fc-unselectable">
             <div class="fc-row fc-week fc-widget-content" style="border-right-width: 1px; margin-right: 16px;">
             <div class="fc-bg">
             <table>
             <tbody>
             <tr><td class="fc-axis fc-widget-content" style="width:41px"><span>all-day</span>
             </td>
             <td class="fc-day fc-widget-content fc-sun fc-past" data-date="2017-06-11"></td>
             <td class="fc-day fc-widget-content fc-mon fc-past" data-date="2017-06-12"></td>
             <td class="fc-day fc-widget-content fc-tue fc-past" data-date="2017-06-13"></td>
             <td class="fc-day fc-widget-content fc-wed fc-past" data-date="2017-06-14"></td>
             <td class="fc-day fc-widget-content fc-thu fc-today fc-state-highlight" data-date="2017-06-15"></td>
             <td class="fc-day fc-widget-content fc-fri fc-future" data-date="2017-06-16"></td>
             <td class="fc-day fc-widget-content fc-sat fc-future" data-date="2017-06-17"></td></tr></tbody></table></div>
             
             </div></div>
             
             
             </td>
             </tr>
             </tbody>
             </table>
             </div>
             </div>
             </div>
             
             



</form>
    
<!--end main content-->
            
        <body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout">

                   <!--start main content-->
            
                    <div class="space-30"></div>
                    <div class="container" style="width: 95%; height: auto;">

                     
                            

                           
                                <div class="panel">
                                    <div class="panel-body" >
                                        <div class="row mail-header">
                                            <div class="col-md-6">
                                                <h3>[6/15]스케쥴 작성</h3>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="pull-right tooltip-show">
                                                    <a href="mailbox.html" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="" data-original-title="Move to draft folder"><i class="fa fa-pencil"></i> Draft</a>
                                                    <a href="mailbox.html" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="" data-original-title="Discard email"><i class="fa fa-times"></i> Discard</a>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="space-20"></div>
                                        <form class="form-horizontal" method="get">
                                   <div id="sm_top" style="margin-left: 30px; margin-bottom:15px; line-height: 37px; ">
                                        
                                        <select name="colname" id="colname" style="height: 30px; width: auto;">
											<option value="normal">일정</option>
											<option value="study">스터디</option>
											<option value="dday">D-DAY</option>
										</select>
                                       <br>
                                            
                                        <select name="sdatey" id="sdatey" style="height: 30px; width: auto;">
											<option value="2017">클릭해서 날짜</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>

                                        <select name="sdatey" id="sdatey" style="height: 30px; width: auto;">
											<option value="2017">시간은 스피너로 합시다....</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
										
										&nbsp;&nbsp;~&nbsp;&nbsp;
                                            
                                        <select name="sdatey" id="sdatey" style="height: 30px; width: auto;">
											<option value="2017">클릭해서 날짜</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>

                                        <select name="sdatey" id="sdatey" style="height: 30px; width: auto;">
											<option value="2017">시간은 스피너로 합시다....</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
										<br>
										   </div>      
										   
										       <div class="form-group" style="margin-left: 30px; margin-top: -10px;">
										       <label class="col-sm-2 control-label" style="height: 30px; width: 150px; ">
										       <a href="">스터디룸 선택</a>
										       </label>
                                     
                                     <div class="col-sm-10"></div>
                                            </div>
                                            
                                                  
                                            <div class="form-group" style="vertical-align: middle;" align="center">
                                            <label class="col-sm-2 control-label"style="height: 30px; width: 100px; ">제목</label>
                                     
                                     		<div class="col-sm-10"><input type="text" class="form-control" style="height: 30px; " ></div>
                                            </div>
                                                                               
                                            <div class="form-group"><label class="col-sm-2 control-label" style="height: 30px; width: 100px;">내용작성</label>
                                     <div class="col-sm-10"><textarea class="form-control"  style="min-height: 200px;"></textarea></div>
                                            </div>
                                            
                                            
                                         
                          
                                            
                                            <div class="form-group"><label class="col-sm-2 control-label" style="height: 30px; width: 110px;">이미지 추가:</label>

                                                <div class="col-sm-10" style="width: -40px;">
                                                    <input type="file" class="form-control">
                                                    <p class="help-block">Attache Photos, Files, Videos etc.</p>
                                                </div>
                                            </div>
                                        </form>
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
                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-primary btn-lg rounded">작성</button>
                                                    <button type="reset" class="btn btn-danger  btn-lg rounded">취소</button>
                                                   
                                                </div><!--.chat-area-bottom-->
                                            </div>
                                    </div><!--row end-->
                                </div>
                            </div>

   
            </div><!--container end-->

       


        <!--Common plugins-->
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/js/app.js"></script>
        <!--page js-->
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/momentJs/moment.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/calendar/plugins/fullcalendar/fullcalendar.min.js"></script>
        
        
        
        <script>
            $(document).ready(function () {
                /* initialize the external events
                 -----------------------------------------------------------------*/
                $('#external-events .fc-event').each(function () {

                    // store data so the calendar knows to render an event upon drop
                    $(this).data('event', {
                        title: $.trim($(this).text()), // use the element's text as the event title
                        stick: true // maintain when user navigates (see docs on the renderEvent method)
                    });

                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 999,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });

                });


                /* initialize the calendar
                 -----------------------------------------------------------------*/

                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar
                    drop: function () {
                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }
                    }
                });
          

        </script>
    </body>
</html>