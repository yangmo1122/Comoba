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
    
    <script type="text/javascript">
 function ggcalwrite(){
	 alert("fuck");
	 
     document.calFrm.action = "/main/myroom/caldetail.action";
     document.calFrm.method = "get";
     document.calFrm.submit();
 }
    </script>
    <body >

        <!--side navigation start-->
       
 
          <form name=calFrm>

                <!--start main content-->
                
                    <div class="space-30"></div>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h2 class="panel-title">내 스케쥴</h2>
                                    </header>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div id='external-events'>
                                                    <h4>Draggable Events</h4>
                                                    <div class='fc-event'>My Event 1</div>
                                                    <div class='fc-event'>My Event 2</div>
                                                    <div class='fc-event'>My Event 3</div>
                                                    <div class='fc-event'>My Event 4</div>
                                                    <div class='fc-event'>My Event 5</div>
                                                    <p>
                                                        <input type='checkbox' id='drop-remove' />
                                                        <label for='drop-remove'>remove after drop</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-md-9">
                                            
                                            
                                                <div id="" class="fc fc-ltr fc-unthemed"> <!-- calendar -->
                                                <div class="fc-toolbar">
                                                <div class="fc-left">
                                                <div class="fc-button-group">
                                                <button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left">
                                                <span class="fc-icon fc-icon-left-single-arrow"></span></button>
                                                
                                                <button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right">
                                                <span class="fc-icon fc-icon-right-single-arrow"></span></button>
                                                </div>
                                                <button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled" disabled="disabled">today</button>
                                                </div>
                                                <div class="fc-right">
                                                <div class="fc-button-group">
                                                <button type="button" class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button>
                                                <button type="button" class="fc-agendaWeek-button fc-button fc-state-default">week</button>
                                                <button type="button" class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button>
                                                </div>
                                                </div>
                                                <div class="fc-center"><h2>June 2017</h2></div>
                                                <div class="fc-clear"></div>
                                                </div>
                                                <div class="fc-view-container" style="">
                                                <div class="fc-view fc-month-view fc-basic-view" style="">
                                                <table>
                                                <thead class="fc-head">
                                                <tr>
                                                <td class="fc-head-container fc-widget-header">
                                                <div class="fc-row fc-widget-header">
                                                <table>
                                                <thead>
                                                <tr>
                                                <th class="fc-day-header fc-widget-header fc-sun">Sun</th>
                                                <th class="fc-day-header fc-widget-header fc-mon">Mon</th>
                                                <th class="fc-day-header fc-widget-header fc-tue">Tue</th>
                                                <th class="fc-day-header fc-widget-header fc-wed">Wed</th>
                                                <th class="fc-day-header fc-widget-header fc-thu">Thu</th>
                                                <th class="fc-day-header fc-widget-header fc-fri">Fri</th>
                                                <th class="fc-day-header fc-widget-header fc-sat">Sat</th>
                                                </tr>
                                                </thead>
                                                </table>
                                                </div>
                                                </td>
                                                </tr>
                                                </thead>
                                                
                                                <tbody class="fc-body">
                                                <tr>
                                                <td class="fc-widget-content">
                                                <div class="fc-scroller fc-day-grid-container" style="overflow: hidden; height: 582px;">
                                                <div class="fc-day-grid fc-unselectable"><div class="fc-row fc-week fc-widget-content" style="height: 97px;">
                                                <div class="fc-bg">
                                                <table>
                                                <tbody>
                                                <tr>
                                                <td class="fc-day fc-widget-content fc-sun fc-other-month fc-past " data-date="2017-05-28"></td>
                                                <td class="fc-day fc-widget-content fc-mon fc-other-month fc-past " data-date="2017-05-29"></td>
                                                <td class="fc-day fc-widget-content fc-tue fc-other-month fc-past " data-date="2017-05-30"></td>
                                                <td class="fc-day fc-widget-content fc-wed fc-other-month fc-past " data-date="2017-05-31"></td>
                                                <td class="fc-day fc-widget-content fc-thu fc-past " data-date="2017-06-01"></td>
                                                <td class="fc-day fc-widget-content fc-fri fc-past " data-date="2017-06-02"></td>
                                                <td class="fc-day fc-widget-content fc-sat fc-past " data-date="2017-06-03"></td>
                                                </tr>
                                                </tbody>
                                                </table>
                                                </div>
                                                <div class="fc-content-skeleton">
                                                <table>
                                                <thead>
                                                <tr>
                                                <td class="fc-day-number fc-sun fc-other-month fc-past sm_caldetail" data-date="2017-05-28">28</td>
                                                <td class="fc-day-number fc-mon fc-other-month fc-past sm_caldetail" data-date="2017-05-29">29</td>
                                                <td class="fc-day-number fc-tue fc-other-month fc-past sm_caldetail" data-date="2017-05-30">30</td>
                                                <td class="fc-day-number fc-wed fc-other-month fc-past sm_caldetail" data-date="2017-05-31">31</td>
                                                <td class="fc-day-number fc-thu fc-past sm_caldetail" data-date="2017-06-01">1</td>
                                                <td class="fc-day-number fc-fri fc-past sm_caldetail" data-date="2017-06-02">2</td>
                                                <td class="fc-day-number fc-sat fc-past sm_caldetail" data-date="2017-06-03">3</td>
                                                </tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div>
                                                <div class="fc-row fc-week fc-widget-content" style="height: 97px;"><div class="fc-bg">
                                                <table>
                                                <tbody>
                                                <tr>
                                                <td class="fc-day fc-widget-content fc-sun fc-past " data-date="2017-06-04"></td>
                                                <td class="fc-day fc-widget-content fc-mon fc-past " data-date="2017-06-05"></td>
                                                <td class="fc-day fc-widget-content fc-tue fc-past " data-date="2017-06-06"></td>
                                                <td class="fc-day fc-widget-content fc-wed fc-past " data-date="2017-06-07"></td>
                                                <td class="fc-day fc-widget-content fc-thu fc-past " data-date="2017-06-08"></td>
                                                <td class="fc-day fc-widget-content fc-fri fc-past " data-date="2017-06-09"></td>
                                                <td class="fc-day fc-widget-content fc-sat fc-past " data-date="2017-06-10"></td>
                                             	</tr></tbody></table></div>
                                             	<div class="fc-content-skeleton">
                                             	<table>
                                             	<thead>
                                             	<tr>
                                             	<td class="fc-day-number fc-sun fc-past sm_caldetail" data-date="2017-06-04">4</td>
                                             	<td class="fc-day-number fc-mon fc-past sm_caldetail" data-date="2017-06-05">5</td>
                                             	<td class="fc-day-number fc-tue fc-past sm_caldetail" data-date="2017-06-06">6</td>
                                             	<td class="fc-day-number fc-wed fc-past sm_caldetail" data-date="2017-06-07">7</td>
                                             	<td class="fc-day-number fc-thu fc-past sm_caldetail" data-date="2017-06-08">8</td>
                                             	<td class="fc-day-number fc-fri fc-past sm_caldetail" data-date="2017-06-09">9</td>
                                             	<td class="fc-day-number fc-sat fc-past sm_caldetail" data-date="2017-06-10">10</td></tr></thead><tbody><tr><td></td><td></td>
                                             	<td class="fc-event-container">
                                             	<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end  fc-draggable fc-resizable">
                                             	<div class="fc-content"> <span class="fc-title">My Event 2</span></div>
                                             	<div class="fc-resizer fc-end-resizer"></div></a></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div>
                                             	<div class="fc-row fc-week fc-widget-content" style="height: 97px;">
                                             	<div class="fc-bg"><table><tbody><tr>
                                             	<td class="fc-day fc-widget-content fc-sun fc-past " data-date="2017-06-11"></td>
                                             	<td class="fc-day fc-widget-content fc-mon fc-past " data-date="2017-06-12"></td>
                                             	<td class="fc-day fc-widget-content fc-tue fc-past " data-date="2017-06-13"></td>
                                             	<td class="fc-day fc-widget-content fc-wed fc-today fc-state-highlight"  data-date="2017-06-14"></td>
                                             	<td class="fc-day fc-widget-content fc-thu fc-future " data-date="2017-06-15"></td>
                                             	<td class="fc-day fc-widget-content fc-fri fc-future " data-date="2017-06-16"></td>
                                             	<td class="fc-day fc-widget-content fc-sat fc-future " data-date="2017-06-17"></td>
                                             	</tr></tbody></table></div><div class="fc-content-skeleton">
                                             	
                                             	<table>
                                             	<thead>
                                             	<tr>
                                             	<td class="fc-day-number fc-sun fc-past  sm_caldetail" data-date="2017-06-11">11</td>
                                             	<td class="fc-day-number fc-mon fc-past  sm_caldetail" data-date="2017-06-12">12</td>
                                             	<td class="fc-day-number fc-tue fc-past  sm_caldetail" data-date="2017-06-13">13</td>
                                             	<td class="fc-day-number fc-wed fc-today fc-state-highlight  sm_caldetail" data-date="2017-06-14">14</td>
                                             	<td class="fc-day-number fc-thu fc-future  sm_caldetail" data-date="2017-06-15">15</td>
                                             	<td class="fc-day-number fc-fri fc-future  sm_caldetail" data-date="2017-06-16">16</td>
                                             	<td class="fc-day-number fc-sat fc-future sm_caldetail" data-date="2017-06-17">17</td>
                                             	</tr></thead><tbody><tr><td></td><td></td><td class="fc-event-container">
                                             	<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end  fc-draggable fc-resizable">
                                             	<div class="fc-content"> <span class="fc-title">My Event 4</span></div>
                                             	<div class="fc-resizer fc-end-resizer"></div></a></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div>
                                             	
                                             	<div class="fc-row fc-week fc-widget-content" style="height: 97px;"><div class="fc-bg">
                                             	<table><tbody><tr>
                                             	<td class="fc-day fc-widget-content fc-sun fc-future " data-date="2017-06-18"></td>
                                             	<td class="fc-day fc-widget-content fc-mon fc-future " data-date="2017-06-19"></td>
                                             	<td class="fc-day fc-widget-content fc-tue fc-future " data-date="2017-06-20"></td>
                                             	<td class="fc-day fc-widget-content fc-wed fc-future " data-date="2017-06-21"></td>
                                             	<td class="fc-day fc-widget-content fc-thu fc-future " data-date="2017-06-22"></td>
                                             	<td class="fc-day fc-widget-content fc-fri fc-future " data-date="2017-06-23"></td>
                                             	<td class="fc-day fc-widget-content fc-sat fc-future " data-date="2017-06-24"></td></tr></tbody></table></div>
                                             	<div class="fc-content-skeleton">
                                             	<table><thead><tr>
                                             	<td class="fc-day-number fc-sun fc-future  sm_caldetail" data-date="2017-06-18">18</td>
                                             	<td class="fc-day-number fc-mon fc-future  sm_caldetail" data-date="2017-06-19">19</td>
                                             	<td class="fc-day-number fc-tue fc-future  sm_caldetail" data-date="2017-06-20">20</td>
                                             	<td class="fc-day-number fc-wed fc-future  sm_caldetail" data-date="2017-06-21">21</td>
                                             	<td class="fc-day-number fc-thu fc-future  sm_caldetail" data-date="2017-06-22">22</td>
                                             	<td class="fc-day-number fc-fri fc-future  sm_caldetail" data-date="2017-06-23">23</td>
                                             	<td class="fc-day-number fc-sat fc-future  sm_caldetail" data-date="2017-06-24">24</td>
                                             	</tr></thead><tbody><tr><td></td><td></td><td class="fc-event-container">
                                             	<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end  fc-draggable fc-resizable">
                                             	<div class="fc-content"> <span class="fc-title">My Event 4</span></div>
                                             	<div class="fc-resizer fc-end-resizer"></div></a></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div>
                                             	<div class="fc-row fc-week fc-widget-content" style="height: 97px;">
                                             	<div class="fc-bg">
                                             	<table><tbody><tr>
                                             	<td class="fc-day fc-widget-content fc-sun fc-future " data-date="2017-06-25"></td>
                                             	<td class="fc-day fc-widget-content fc-mon fc-future " data-date="2017-06-26"></td>
                                             	<td class="fc-day fc-widget-content fc-tue fc-future " data-date="2017-06-27"></td>
                                             	<td class="fc-day fc-widget-content fc-wed fc-future " data-date="2017-06-28"></td>
                                             	<td class="fc-day fc-widget-content fc-thu fc-future " data-date="2017-06-29"></td>
                                             	<td class="fc-day fc-widget-content fc-fri fc-future " data-date="2017-06-30"></td>
                                             	<td class="fc-day fc-widget-content fc-sat fc-other-month fc-future" data-date="2017-07-01"></td>
                                             	</tr></tbody></table></div>
                                             	<div class="fc-content-skeleton">
                                             	<table><thead><tr>
                                             	<td class="fc-day-number fc-sun fc-future sm_caldetail" data-date="2017-06-25">25</td>
                                             	<td class="fc-day-number fc-mon fc-future sm_caldetail" data-date="2017-06-26">26</td>
                                             	<td class="fc-day-number fc-tue fc-future sm_caldetail" data-date="2017-06-27">27</td>
                                             	<td class="fc-day-number fc-wed fc-future sm_caldetail" data-date="2017-06-28">28</td>
                                             	<td class="fc-day-number fc-thu fc-future sm_caldetail" data-date="2017-06-29">29</td>
                                             	<td class="fc-day-number fc-fri fc-future sm_caldetail" data-date="2017-06-30">30</td>
                                             	<td class="fc-day-number fc-sat fc-other-month fc-future" data-date="2017-07-01">1</td></tr></thead><tbody>
                                             	<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div>
                                             	<div class="fc-row fc-week fc-widget-content" style="height: 97px;"><div class="fc-bg">
                                             	<table><tbody><tr>
                                             	<td class="fc-day fc-widget-content fc-sun fc-other-month fc-future " data-date="2017-07-02"></td>
                                             	<td class="fc-day fc-widget-content fc-mon fc-other-month fc-future " data-date="2017-07-03"></td>
                                             	<td class="fc-day fc-widget-content fc-tue fc-other-month fc-future " data-date="2017-07-04"></td>
                                             	<td class="fc-day fc-widget-content fc-wed fc-other-month fc-future " data-date="2017-07-05"></td>
                                             	<td class="fc-day fc-widget-content fc-thu fc-other-month fc-future " data-date="2017-07-06"></td>
                                             	<td class="fc-day fc-widget-content fc-fri fc-other-month fc-future " data-date="2017-07-07"></td>
                                             	<td class="fc-day fc-widget-content fc-sat fc-other-month fc-future " data-date="2017-07-08"></td></tr></tbody></table></div>
                                             	<div class="fc-content-skeleton">
                                             	<table><thead><tr>
                                             	<td class="fc-day-number fc-sun fc-other-month fc-future sm_caldetail" data-date="2017-07-02">2</td>
                                             	<td class="fc-day-number fc-mon fc-other-month fc-future sm_caldetail" data-date="2017-07-03">3</td>
                                             	<td class="fc-day-number fc-tue fc-other-month fc-future sm_caldetail" data-date="2017-07-04">4</td>
                                             	<td class="fc-day-number fc-wed fc-other-month fc-future sm_caldetail" data-date="2017-07-05">5</td>
                                             	<td class="fc-day-number fc-thu fc-other-month fc-future sm_caldetail" data-date="2017-07-06">6</td>
                                             	<td class="fc-day-number fc-fri fc-other-month fc-future sm_caldetail" data-date="2017-07-07">7</td>
                                             	<td class="fc-day-number fc-sat fc-other-month fc-future sm_caldetail" data-date="2017-07-08">8</td>
                                             	</tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div></div></div></td></tr></tbody></table></div></div></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="space-30"></div>
                    <div> 일단 이걸로 합시다....</div>
                    <button type="button"  class="btn btn-success rounded btn-lg" onClick="ggcalwrite()"> 글쓰기...</button>
</form>
    
<!--end main content-->
            
       


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
          
				
            });

        </script>
    </body>
</html>