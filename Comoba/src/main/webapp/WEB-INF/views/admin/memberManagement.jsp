<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   

        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--side menu plugin-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/hoe-nav/hoe.css" rel="stylesheet">
        <!-- icons-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- dataTables -->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
          <link href="<%=request.getContextPath()%>/resources/jaeyeon/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--template custom css file-->
        <link href="<%=request.getContextPath()%>/resources/jaeyeon/css/style.css" rel="stylesheet">

     <!--    <script src="assets/js/modernizr.js"></script> -->
        
        
        <!-- alert2  --> 
          <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.css" rel="stylesheet">
          <script src=" https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.common.min.js"></script>
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
     
    </head>
    <body >

     


                <!--start main content-->
                <section id="main-content">
                    <div class="space-30"></div>
                    <div class="container">

                        <div class="row">

                            <div class="col-md-12">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h1 class="panel-title">회원조회 관리자용</h1>
                                    </header>
                                    <div class="panel-body">
                                     
                                     
                                     
                                      <span style="float: right;"><input type="text" name="search" id="search" size="40px" /></span>
                                                 
                                                  
                                                                    
                                        <table id="datatable" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                             
                                                    <th>회원 번호</th>
                                                    <th>닉네임</th>
                                                    <th>이메일</th>
                                                    <th>마지막 회원접속 날짜</th>
                                                    <th>회원상태</th>
                                                    
                                                </tr>
                                            </thead>

                                            <tbody id="tables">
                                            
                                            
									<c:forEach var="membervo" items="${memberList}"
										varStatus="status">
										
										<tr>
											<td>${membervo.memberno}</td>
											<td>${membervo.nickname}</td>
											<td>${membervo.email}</td>
											<td>${membervo.joindate}</td>
											<c:if test="${membervo.status ==1}">
											<td>회원활동중</td><td>
											<button type="button" class="btn btn-danger"
													onClick="del('${membervo.memberno}')"
													style="float: right; height: 25px; font-size: 8pt;">탈퇴시키기</button>
													
											<button type="button" class="btn btn-primary" id="edit"
													data-toggle="modal" data-target="#myModal"
													data-title="Test Title"
													style="float: right; height: 25px; font-size: 8pt;"
													data-memberno="${membervo.memberno}"
													data-nickname="${membervo.nickname}"
													data-email="${membervo.email}"
													data-joindate="${membervo.joindate}"
													data-status="${membervo.status}" 
													data-pwd="${membervo.pwd}">수정</button>
											</c:if>
											<c:if test="${membervo.status ==0}">
											<td><span style="color: red">탈퇴중</span></td><td>
											
											<button type="button" class="btn btn-success"
													onClick="comeback('${membervo.memberno}')"
													style="float: right; width:126.64px; height: 25px; font-size: 8pt;">복귀시키기</button>
											</c:if>
												
												

											</td>
										</tr>

									

									</c:forEach>
                                            
                                                             
                                                                    
                                            </tbody>
                                            
                                            
                                        </table>
                                    </div><!--panel body end-->
                                </div><!--end panel-->
                            </div><!--col end-->
                        </div><!--row end-->
                    </div><!--container end-->

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
            


        <!-- Datatables-->
        <script src="<%=request.getContextPath()%>/resources/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/datatables/dataTables.responsive.min.js"></script>
     
     
     
     <script>
           
            
     $(document).ready(function() {
    	 
    	 $("#search").keyup(function(){
    	
    		 $("#tables").hide();
    		 
    		 
    		 var form_data = { search : $("#search").val(),  // 키값 : 밸류값 
    						        // 키값 : 밸류값 
    						 };
    		 
    		 $.ajax({
    					 
    			 url: "/main/admin/searchshow.action",
		    		type: "GET",
		    		data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
		    		dataType: "JSON", 
		    		success: function(data){
		    			
		    			   var resultHTML = "";
			    			  
		    			   $.each(data, function(entryIndex, entry){
		    				   var memberno = entry.MEMBERNO.trim();
		    				   var nickname = entry.NICKNAME.trim();
		    				   var pwd = entry.PWD.trim();
		    				   var email = entry.EMAIL.trim();
		    				   var status = entry.STATUS.trim();
		    				   var studycnt = entry.STUDYCNT.trim();
		    				   var joindate = entry.JOINDATE.trim();
		    				   var imagestatus = entry.IMAGESTATUS.trim();
		    				   
		    				
		    				
	                           var result = "";
	                           
	                           result  =  "<tr><td>"+memberno+"</td>"
							           +  "<td>"+nickname+"</td>"
							           +  "<td>"+email+"</td>"
							           +  "<td>"+joindate+"</td>"
							           
							 if(status == 1) {
								result += "<td>회원활동중</td>"
								       + "<td><button type='button' class='btn btn-danger'   onClick='del("+memberno+")'  style='float: right; height: 25px; font-size: 8pt;'>탈퇴시키기</button>"
								 	   + "<button type='button' class='btn btn-primary' id='edit' data-toggle='modal' data-target='#myModal' data-title='Test Title' style='float: right; height: 25px; font-size: 8pt;'"
							           +  "data-memberno='"+memberno+"' data-nickname='"+nickname+"' data-email='"+email+"' data-joindate='"+joindate+"' data-status='"+status+"' "
							           +  "data-pwd='"+pwd+"'>수정</button>"
							           +  "</td></tr>";
							 }          
							 else{
						  	    result += "<td><span style='color: red'>탈퇴중</span></td>"
						  	            + "<td><button type='button' class='btn btn-success'  onClick='del("+memberno+")'  style='float: right; width:126.64px; height: 25px; font-size: 8pt;'>복귀시키기</button>"
							 }          
							   /*        
							    result += "<button type='button' class='btn btn-primary' id='edit' data-toggle='modal' data-target='#myModal' data-title='Test Title' style='float: right; height: 25px; font-size: 8pt;'"
							           +  "data-memberno='"+memberno+"' data-nickname='"+nickname+"' data-email='"+email+"' data-joindate='"+joindate+"' data-status='"+status+"' "
							           +  "data-pwd='"+pwd+"'>수정</button>"
							           +  "</td></tr>";
							   */
								resultHTML += result; 	   
		    			   });
		    			
		    				$("#tables").html(resultHTML);
		    				$("#tables").show();
		    			   
		    			   
		    			   
		    		},
		    		error: function(){
		   				  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); 
		   		    }
	        		
    			 
    			 
    		 });
    		 
    		 
    		 
    		 
    	 });
    	 
    	 
    	 
     });
         
		    	
            
            
 function del(memberno) {
	 
	 var memberno = memberno;

                
            	swal({
            		  title: '정말 탈퇴 시킵니까?',
            		  text : " ",
            		  type: 'warning',
            		  showCancelButton: true,
            		  confirmButtonColor: '#3085d6',
            		  cancelButtonColor: '#d33',
            		  confirmButtonText: '예! 삭제 합니다',
            		  cancelButtonText: '아뇨 취소 할게요',
            		  confirmButtonClass: 'btn btn-success',
            		  cancelButtonClass: 'btn btn-danger',
            		  buttonsStyling: false
            		}).then(function () {
            		  swal(
            		    '탈퇴완료!',
            		    '회원의 상태를 탈퇴시켰습니다.',
            		    'success'
            		  )
            		  
            		  document.frmDel.memberno.value = memberno;
					  document.frmDel.action = "/main/admin/memberDel.action";
					  document.frmDel.method = "GET";
					  document.frmDel.submit();
            		  
            		}, function (dismiss) {

				  if (dismiss === 'cancel') {
            		    swal(
            		      '취소',
            		      '탈퇴를 취소 합니다 :)',
            		      'error'
            		    )
            		  }
            		});
                
            };
            
            
            function comeback(memberno) {
           	 
           	 var memberno = memberno;

                           
                       	swal({
                       		  title: '정말 복귀 하십니까? :)',
                       		  text : " ",
                       		  type: 'warning',
                       		  showCancelButton: true,
                       		  confirmButtonColor: '#3085d6',
                       		  cancelButtonColor: '#d33',
                       		  confirmButtonText: '예! 복귀 합니다',
                       		  cancelButtonText: '아뇨 취소 할게요',
                       		  confirmButtonClass: 'btn btn-success',
                       		  cancelButtonClass: 'btn btn-danger',
                       		  buttonsStyling: false
                       		}).then(function () {
                       		  swal(
                       		    '복귀완료!',
                       		    '회원의 상태를 복귀 시켰습니다.',
                       		    'success'
                       		  )
                       		  
                       		  document.frmDel.memberno.value = memberno;
           					
           						document.frmDel.action = "/main/admin/comeback.action";
           						document.frmDel.method = "GET";
           						document.frmDel.submit();
                       		  
                       		}, function (dismiss) {
                       		
                       			if (dismiss === 'cancel') {
                       		    swal(
                       		      '취소',
                       		      '복귀를 취소 합니다 :)',
                       		      'error'
                       		    )
                       		  }
                       		});
                           
                       };        
            
            
            
            
        	$(document).on("click", "#edit", function(e) {
    			var _target = $(e.target);

    			// alert(_target.data("pwd"));

    			$("#modal_memberno").html("회원번호 : " + _target.data("memberno"));

    			$("#modal_memberno1").val(_target.data("memberno"));
    			$("#modal_nickname").val(_target.data("nickname"));
    			$("#modal_email").val(_target.data("email"));
    			$("#modal_status").val(_target.data("status"));
    			$("#modal_pwd").val(_target.data("pwd"));
    		});
            
        	function memberEdit() {

    			var frmEdit = document.frmEdit;
    			frmEdit.action = "/main/admin/memberEdit.action";
    			document.frmEdit.method = "GET";
    			document.frmEdit.submit();
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
						<h4 class="modal-title" id="modal_memberno"></h4>
						<input class="form-control input-lg" id="modal_memberno1"
							name="memberno" type="hidden" value="">
					</div>
					<div class="modal-body">

						<label for="inputlg">회원 이름</label> 
						<input class="form-control input-lg" type="text" id="modal_nickname" name="nickname" value=""> 
						<label for="inputlg"  >회원 이메일</label> 
						<input style="height: 100px;" class="form-control input-lg" id="modal_email" name="email" type="text" value="">
						<label for="inputlg"  >새로운 비밀번호</label> 
						<input style="height: 50px;" class="form-control input-lg" id="modal_newpwd" name="newpwd" type="text" value="" placeholder="미기입시 기존 비밀번호사용">
						<input style="height: 50px;" class="form-control input-lg" id="modal_pwd" name="pwd" type="hidden" value="">
						
							
					


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="memberEdit()">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</form>
	
	<%-- 게시물에 담긴 제품을 삭제하는 form --%>
	<form name="frmDel">
		<input type="hidden" name="memberno">
	</form>

        
        
        
    </body>
</html>