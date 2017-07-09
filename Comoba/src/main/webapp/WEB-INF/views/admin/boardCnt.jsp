<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Assan admin</title>

<!-- Bootstrap -->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--side menu plugin-->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/hoe-nav/hoe.css"
	rel="stylesheet">
<!-- icons-->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/summernote/summernote.css"
	rel="stylesheet">
<!--template custom css file-->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/css/style.css"
	rel="stylesheet">



<script
	src="<%=request.getContextPath()%>/resources/jaeyeon/js/modernizr.js"></script>

<!--제이쿼리-->
<!--   <script src="http://code.jquery.com/jquery-latest.js"></script> -->



<!-- alert2  -->
<!--  <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.css" rel="stylesheet">
          <script src=" https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.common.min.js"></script>
         -->

<!-- 하이차트 js-->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>





<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<style>
#container {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
</style>

<body>
 ${liveCnt}<br/>
 ${storyCnt}

	<div class="col-md-9" style="width: 100%;">
		<div class="row">
			<div class="col-md-12" style="width: 80%; margin-left: 10%">
				<div class="panel">
					<div class="panel-body" align="center">
						<div>
							<!-- Nav tabs -->
							<ul class="list-inline tabs-bordered margin-b-20" role="tablist">
								<li role="presentation" class="active"><a href="#char1"
									aria-controls="char1" role="tab" data-toggle="tab">게시판 수</a></li>
								<li role="presentation"><a href="#char2"
									aria-controls="char2" role="tab" data-toggle="tab">예약 수</a></li>
								<li role="presentation"><a href="#char3"
									aria-controls="char3" role="tab" data-toggle="tab">서울시 결제</a></li>
								<li role="presentation"><a href="#char4"
									aria-controls="char4" role="tab" data-toggle="tab">매출 액</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="char1"
									style="width: 100%;">
									<div id="first" style="width: 80%;"></div>
								</div>

								<div role="tabpanel" class="tab-pane" id="char2"
									style="width: 100%;">
									<div id="second" style="width: 80%;"></div>
								</div>

								<div role="tabpanel" class="tab-pane" id="char3"
									style="width: 100%;">
									<div id="third" style="width: 80%;"></div>
								</div>

								<div role="tabpanel" class="tab-pane" id="char4"
									style="width: 100%;">
									<div id="fourth" style="width: 80%;"></div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>




	<!--Common plugins-->
	<%--   <script src="<%=request.getContextPath()%>/resources/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath()%>/resources/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/app.js"></script> --%>

	<!-- Datatables-->
	<%--   <script src="<%=request.getContextPath()%>/resources/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/datatables/dataTables.responsive.min.js"></script>
         --%>





	<script>
        

	
    var beforeBoardCnt = ${boardCnt}
    var $boardCnt = new Array ();        	
	for (var i = 0; i<= 7 - beforeBoardCnt.length; i++){
        
		$boardCnt[i] = 0;
		
	     }
	
   	for ( var j = 0 ; j<  beforeBoardCnt.length; j++){
        
		i++;
		
		$boardCnt[i-1] = beforeBoardCnt[j] 
            		
        }
	        	

	
	
  var beforeliveCnt = ${liveCnt}
  var $liveCnt = new Array ();        	
	for (var i = 0; i<= 7 - beforeliveCnt.length; i++){
      
		$liveCnt[i] = 0;
		
	     }
	
	
 	for ( var j = 0 ; j<  beforeliveCnt.length; j++){
      

		i++;
		
		$liveCnt[i-1] = beforeliveCnt[j] 
          		
      }
             
  var beforeStoryCnt = ${storyCnt}
  var $storyCnt = new Array ();        	
	for (var i = 0; i<= 7 - beforeStoryCnt.length; i++){
      
		$storyCnt[i] = 0;
		
	     }
	
 	for ( var j = 0 ; j<  beforeStoryCnt.length; j++){
      
		
		i++;
		
		$storyCnt[i-1] = beforeStoryCnt[j] 
          		
      }
          	
   

 	  var beforeOrderCnt = ${orderCnt}
 	  var $orderCnt = new Array ();        	
 		for (var i = 0; i<= 7 - beforeOrderCnt.length; i++){
 	      
 			$orderCnt[i] = 0;
 			
 		     }
 		
 	 	for ( var j = 0 ; j<  beforeOrderCnt.length; j++){
 	      
 			
 			i++;
 			
 			$orderCnt[i-1] = beforeOrderCnt[j] 
 	          		
 	      }
 	          	
 	

        
	 Highcharts.chart('first', {

         title: {
             text: '게시판 년별 현황'
         },

         subtitle: {
             text: '최근 6년'
         },

         yAxis: {
             title: {
                 text: '게시판 수'
             }
         },
         legend: {
             layout: 'vertical',
             align: 'right',
             verticalAlign: 'middle'
         },

         plotOptions: {
             series: {
                 pointStart: 2010
             }
         },

         series: [{
              name: '자유게시판',
             data:   [$boardCnt[0],$boardCnt[1],$boardCnt[2],$boardCnt[3],$boardCnt[4],$boardCnt[5],$boardCnt[6],$boardCnt[7]] 
         }, {
             name: '공라이브',
             data:   [$liveCnt[0],$liveCnt[1],$liveCnt[2],$liveCnt[3],$liveCnt[4],$liveCnt[5],$liveCnt[6],$liveCnt[7]]   
         }, {
             name: '공스토리',
             data: [$storyCnt[0],$storyCnt[1],$storyCnt[2],$storyCnt[3],$storyCnt[4],$storyCnt[5],$storyCnt[6],$storyCnt[7]]
         }]

     });
     
	 
    
     
	 
	   
     
	   Highcharts.chart('second', {

           title: {
               text: '결제 현황'
           },

           subtitle: {
               text: '최근 6년'
           },

           yAxis: {
               title: {
                   text: '예약 수'
               }
           },
           legend: {
               layout: 'vertical',
               align: 'right',
               verticalAlign: 'middle'
           },

           plotOptions: {
               series: {
                   pointStart: 2010
               }
           },

           series: [{
               name: '결제수',
               data:  [$orderCnt[0],$orderCnt[1],$orderCnt[2],$orderCnt[3],$orderCnt[4],$orderCnt[5],$orderCnt[6],$orderCnt[7]]
           }]

       });
	 
	   
	     
       Highcharts.chart('fourth', {
           chart: {
               type: 'column'
           },
           title: {
               text: '2017 년매출액'
           },
           subtitle: {
               text: '월별 현황'
           },
           xAxis: {
               categories: [
                   'Jan',
                   'Feb',
                   'Mar',
                   'Apr',
                   'May',
                   'Jun',
                   'Jul',
                   'Aug',
                   'Sep',
                   'Oct',
                   'Nov',
                   'Dec'
               ],
               crosshair: true
           },
           yAxis: {
               min: 0,
               title: {
                   text: '원'
               }
           },
           tooltip: {
               headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
               pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
               footerFormat: '</table>',
               shared: true,
               useHTML: true
           },
           plotOptions: {
               column: {
                   pointPadding: 0.2,
                   borderWidth: 0
               }
           },
           series: [{
               name: '강남',
               data: ${monthSales0}

           }, {
               name: '강서',
               data: ${monthSales1}

           }, {
               name: '강동',
               data: ${monthSales2}

           }, {
               name: '강북',
               data: ${monthSales3}

           }, {
               name: '중구',
               data: ${monthSales4}

           }]
       });
       
   
       
     	
   	
  	 // Build the chart
      Highcharts.chart('third', {
          chart: {
              plotBackgroundColor: null,
              plotBorderWidth: null,
              plotShadow: false,
              type: 'pie'
          },
          title: {
              text: '서울시 위치별 결제 횟수'
          },
          tooltip: {
              pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
          },
          plotOptions: {
              pie: {
                  allowPointSelect: true,
                  cursor: 'pointer',
                  dataLabels: {
                      enabled: false
                  },
                  showInLegend: true
              }
          },
          series: [{
              name: 'Brands',
              colorByPoint: true,
              data: [{
                  name: '강남',
                  y: ${seoulOrderCnt0} / ${sumCnt}
                                 
              },{
                  name: '강서',
                  y: ${seoulOrderCnt1} / ${sumCnt}
                                 
              }, {
                  name: '강북',
                  y: ${seoulOrderCnt2} / ${sumCnt}
              }, {
                  name: '강동',
                  y: ${seoulOrderCnt3} / ${sumCnt}
              }, {
                  name: '중구',
                  y: ${seoulOrderCnt4} /  ${sumCnt}
              } ]
          }]
      });


       
        
        
            $(document).ready(function() {
      
            
            	
            	
			   
        }); //end of ready(function() {--------------------
            
            
           
            
            
        </script>





</body>
</html>