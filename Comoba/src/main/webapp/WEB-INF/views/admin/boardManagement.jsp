<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<!-- dataTables -->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/datatables/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/datatables/responsive.bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--template custom css file-->
<link
	href="<%=request.getContextPath()%>/resources/jaeyeon/css/style.css"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/resources/jaeyeon/js/modernizr.js"></script>



<!-- alert2  -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.css"
	rel="stylesheet">
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.common.min.js"></script>






<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>




	<!--start main content-->
	<section id="main-content">
		<div class="space-30"></div>
		<div class="container">

			<div class="row">

				<div class="col-md-12">
					<div class="panel">
						<header class="panel-heading">
							<h1 class="panel-title">자유게시판 관리자용</h1>
						</header>
						<div class="panel-body">


							<div>
							<!-- ===== 글검색 폼 추가하기 : 제목, 내용, 글쓴이로 검색하도록 한다. ===== -->
							<form name="searchFrm" style="float: right; margin-bottom: 2%;">
								<select name="colname" id="colname">
									<option value="subject">제목</option>
									<option value="board_contents">내용</option>
									<option value="nickname">성명</option>
								</select>
								 <input type="text" name="search" id="search" size="40px" />
								<button type="button" onClick="goSearch();">검색</button>
							</form>
							</div>
							<!-- ===== Ajax 로 검색어 입력시 자동글 완성하기 1 ===== -->
								<div id="displayList" style="width:228px;  margin-right:50px; border: solid 1px gray;  border-top: 0px; float: right;">
								</div>   
	


							<table id="datatable" class="table table-striped dt-responsive nowrap" style="margin-top: 3%;">
								<thead>
									<tr>
										<th>게시물 번호</th>
										<th>게시물 제목</th>
										<th>내용</th>
										<th>닉네임</th>
										<th>글쓴날짜</th>
										
									</tr>
								</thead>

								<tbody id="boardlist">

									<c:forEach var="boardvo" items="${boardList}"
										varStatus="status">
										<tr>
											<td>${boardvo.board_no}</td>
											<td>${boardvo.subject}</td>
											<td>${boardvo.board_contents}</td>
											<td>${boardvo.nickname}</td>
											<td>${boardvo.writedate}</td>

											
											<td>	
												<button type="button" class="btn btn-danger"
													onClick="del('${boardvo.board_no}')"
													style="float: right; height: 25px; font-size: 8pt;">삭제</button>

												<button type="button" class="btn btn-primary" id="edit"
													data-toggle="modal" data-target="#myModal"
													data-title="Test Title"
													style="float: right; height: 25px; font-size: 8pt;"
													data-boardno="${boardvo.board_no}"
													data-subject="${boardvo.subject}"
													data-board_contents="${boardvo.board_contents}"
													data-nickname="${boardvo.nickname}"
													data-writedate="${boardvo.writedate}">수정</button>
											</td>
										</tr>



									</c:forEach>
								</tbody>
							</table>



							<!--  페이지 처리 -->
							<div align="center"
								style="width: 400px; margin-left: 100px; margin-right: auto;">
								${pagebar}</div>
						</div>
						<!--panel body end-->
					</div>
					<!--end panel-->
				</div>
				<!--col end-->
			</div>
			<!--row end-->
		</div>
		<!--container end-->

		<!--footer start-->
		<div class="footer">
			<div class="row">
				<div class="col-sm-12">
					<span>&copy; Copyright 2016. Assan</span>
				</div>
			</div>
		</div>
		<!--footer end-->
	</section>
	<!--end main content-->



	<!--Common plugins-->
	<%--   <script src="<%=request.getContextPath()%>/resources/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/hoe-nav/hoe.js"></script>
        <script src="<%=request.getContextPath()%>/resources/pace/pace.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/app.js"></script> --%>

	<!-- Datatables-->
	<script
		src="<%=request.getContextPath()%>/resources/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/datatables/dataTables.responsive.min.js"></script>






	<script>
		$(document).ready(function() {
			searchKeep();
			
			
//			===== #147. Ajax 로 검색어 입력시 자동글 완성하기 2 =====
			$("#displayList").hide();
		
		    $("#search").keyup(function(){
		    	
		    	
		    	
		    	var form_data = { colname : $("#colname").val(),  // 키값 : 밸류값 
		    	       		      search  : $("#search").val()    // 키값 : 밸류값 
		    	       		    };
		    	
		    	$.ajax({
		    		url: "/main/admin/wordSearchShow.action",
		    		type: "GET",
		    		data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
		    		dataType: "JSON", 
		    		success: function(data){
		    			
		    		// ===== #152. Ajax 로 검색어 입력시 자동글 완성하기 7 ===== 
		    		   if(data.length > 0) {
		    			  // 검색된 데이터가 있는 경우.
		    			  // 조심할것은 if(data != null) 으로 하면 안된다.
		    			   var resultHTML = "";
		    			  
		    			   $.each(data, function(entryIndex, entry){
		    				   var wordstr = entry.RESULTDATA.trim();
							    // 검색어 - 영주                    aj
							    // 결과물 - 김영주 프로그래머     AJAX
	                            //         김영주바둑기사        ajax 프로그래밍
	                            //         영주사과
	                           
	                            var index = wordstr.toLowerCase().indexOf( $("#search").val().toLowerCase() ); 
							    var len = $("#search").val().length;
							    var result = "";
							    
							    result = "<span class='first' style='color: blue;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color: red; font-weight: bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color: blue;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";        
	                           
								resultHTML += "<span style='cursor: pointer;'>" + result + "</span><br/>"; 	   
		    			   });
		    			  
		    			   $("#displayList").html(resultHTML);
		    			   $("#displayList").show();
		    		   }
		    		   else {
		    			  // 검색된 데이터가 없는 경우.
		    			  // 조심할것은 if(data == null) 으로 하면 안된다.
		    			   $("#displayList").hide();
		    		   }
		    			
		    		},
		    		error: function(){
		   				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
		   		    }
		    	});
		    	
		    }); // end of keyup(function(){})---------
		    
		    // ===== #153. Ajax 로 검색어 입력시 자동글 완성하기 8 ===== 
		    $("#displayList").click(function(event){
				var word = "";
				
				var $target = $(event.target);
				
				if($target.is(".first")) {
					word = $target.text() + $target.next().text() + $target.next().next().text();
				//	alert(word);
				}
				else if($target.is(".second")) {
					word = $target.prev().text() + $target.text() + $target.next().text();
				//	alert(word);
				}
				else if($target.is(".third")) {
					word = $target.prev().prev().text() + $target.prev().text() + $target.text();
				//	alert(word);
				}
				
				$("#search").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
				
				$("#displayList").hide();
				
		    });// end of $("#displayList").click()---------	
		    
			
		});

		function del(boradno) {

			var boradno = boradno;

			//			alert(document.frmDel.boardno.value);

			swal({
				title : '지우시겠습니까?',
				text : "",
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : '예!',
				cancelButtonText : '아뇨!',
				confirmButtonClass : 'btn btn-success',
				cancelButtonClass : 'btn btn-danger',
				buttonsStyling : false
			}).then(
					function() {
						//console.log(boradno);
						swal('삭제 성공!', '해당 게시글이 지워졌습니다.',
								'success')

						document.frmDel.boardno.value = boradno;
						alert(boradno);
						alert(document.frmDel.boardno.value);
						alert(typeof (document.frmDel.boardno.value));

						document.frmDel.action = "/main/admin/del.action";
						document.frmDel.method = "GET";
						document.frmDel.submit();

					},
					function(dismiss) {
						// dismiss can be 'cancel', 'overlay',
						// 'close', and 'timer'
						if (dismiss === 'cancel') {
							swal('취소!', '취소 하셨습니다. :)',
									'error')
						}
					});

		};

		$(document).on("click", "#edit", function(e) {
			var _target = $(e.target);

			alert(_target.data("boardno"));

			$("#modal_boardno1").html("게시물 번호 : " + _target.data("boardno"));

			$("#modal_boardno").val(_target.data("boardno"));
			$("#modal_subject").val(_target.data("subject"));
			$("#modal_contents").val(_target.data("board_contents"));

		});

		function boardEdit() {

			var frmEdit = document.frmEdit;
			frmEdit.action = "/main/admin/boardEdit.action";
			document.frmEdit.method = "GET";
			document.frmEdit.submit();
		}
		
		
		function searchKeep(){
			<c:if test="${not empty colname && not empty search}">
				$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
				$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
			</c:if>
		}
		
		function goSearch(){
			
			var searchFrm = document.searchFrm;
			
			var search = $("#search").val();
			
			if(search.trim() == "") {
				alert("검색어를 입력하세요!!");
			}
			else {
				searchFrm.action = "/main/admin/boardManagement.action";
				searchFrm.method = "GET";
				searchFrm.submit();
			}
			
		}
		
		
		
		
	</script>








	<!-- Modal -->
	<form name="frmEdit">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="modal_boardno1"></h4>
						<input class="form-control input-lg" id="modal_boardno"
							name="boardno" type="hidden" value="">
					</div>
					<div class="modal-body">

						<label for="inputlg">게시물 이름</label> <input
							class="form-control input-lg" type="text" id="modal_subject"
							name="subject" value=""> <label for="inputlg" onclick="desc()" >게시물
							내용</label> <input style="height: 500px;" class="form-control input-lg"
							id="modal_contents" name="board_contents" type="text" value="">
					


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="boardEdit()">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</form>

	<%-- 게시물에 담긴 제품을 삭제하는 form --%>
	<form name="frmDel">
		<input type="hidden" name="boardno">
	</form>







</body>
</html>