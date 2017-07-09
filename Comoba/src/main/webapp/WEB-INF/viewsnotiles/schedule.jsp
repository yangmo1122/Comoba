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
    <body >

        <!--side navigation start-->
       
 
          

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
                                                <div id='calendar'></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

    
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