<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	

</style>

<script type="text/javascript">
    
    function goWrite(){
    	alert(${boardvo.rno});
    	var addWriteFrm = document.addWriteFrm;
    	
    	
    	addWriteFrm.submit();
    }
    
</script>
 <body>
 

                <section id="main-content">
                   
                    <div class="container">

                        <div class="row">
                        

                            <div class="col-sm-9" align="center;">
                                <div class="panel" align="center;">
                                
                                    <div class="panel-body" >
                                        <div class="row mail-header">
                                            <div class="col-md-6 mail-open-header">
                                              
                                                <p><strong>제목 :  ${boardvo.subject}</strong></p>
                                              <div style="color: gray;" >Name. ${boardvo.nickname}</div>
                                            
                                            </div>
                                            <div class="col-md-6">
                                                <div class="pull-right tooltip-show">
                                                     
                                              <div style="color: gray;">no. ${boardvo.board_no}  　  조회수 : ${boardvo.readCount}</div>
                                              <div style="color: gray;"> ${boardvo.writedate}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                      
                                        <div class="mail-content margin-b-20"   style="height: 200px;">
                                   		    ${boardvo.content}
                                        </div>
                                    
   
   
      <hr>
   
                                     <c:if test="${boardvo.fileSize != null}">  
                                        <div class="mail-attachment">
                                            <p>
                                                <span><i class="fa fa-file-powerpoint-o"></i> 첨부파일 </span>
                                              <div>
                                              <a href="<%= request.getContextPath() %>/ourroom/download.action?board_no=${boardvo.board_no}"> 
													 ${boardvo.orgFilename} 
													   </a>	&nbsp;&nbsp;
													   ${boardvo.fileSize} &nbsp; (bytes)
                                             </div>
                                            </div>
                                            </p>
                                              
                                             </c:if> 
                                               <div class="mail-body text-right tooltip-demo">
                                         <a class="btn btn-sm btn-default"  href="javascript:location.href='<%= request.getContextPath() %>/ourroom/freeboard.action'" data-placement="top" data-toggle="tooltip" data-original-title="Reply"><i class="ion-reply"></i> Reply</a>
                                         
                                         
                                             
                                            <a class="btn btn-sm btn-default" href="javascript:location.href='<%= request.getContextPath() %>/edit.action?board_no=${boardvo.board_no}&rno=${boardvo.rno}'">
                                      	 	<i class="fa fa-pencil" style="font-size:12px">&nbsp;&nbsp;Edit</i></a>
                                      
                                        <a class="btn btn-sm btn-default" href="javascript:location.href='<%= request.getContextPath() %>/ourroom/del.action?board_no=${boardvo.board_no}&memberno_fk=${boardvo.memberno_fk}'">
                                       <i class="ion-trash-b"></i>Delete</a>
                                        </div>
                                             
                                            <div class="attachment">
                                              
                                                 
                                                
									</div>     
                                
                                </div>
	   <hr>
	<br/>
	<br/>
	<br/>
	
	<!-- === 댓글쓰기 폼 추가 ===== -->
	
	<div align="center">
	
	
	<form name="addWriteFrm" action="<%= request.getContextPath() %>/addComment.action" method="get" >     
	  	     <input type="hidden" name="email" value="${sessionScope.loginuser.email}" readonly />
	  	     <input type="hidden" name="rno" value="${boardvo.rno}" readonly />
	     <div>
            <div>글쓴이 : <input type="text" name="nickname" value="${sessionScope.loginuser.nickname}"  style="width: 10%" readonly /> 
                                         댓글 : <input type="text" id="comment_content" name="comment_content" class="long"  style="width: 50%" />
           <input type="button" value="입력" id="createbt" onClick="goWrite();" /></div>
          </div>
	     
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글) -->
	    <input type="hidden" id="together_no" name="together_no" value="${boardvo.board_no}" />    
	    <input type="hidden" id="boardtype"  name="boardtype" value="3" />    
	  </form>
</div>
	
	
	<!-- ===== #93. 댓글 내용 보여주기 ===== -->

                    <div class="comment-post">
                        <h3><i class="fa fa-comment-o" style="font-size:36px"></i></h3>
                          <c:forEach var="commentvo" items="${commentList}"  varStatus="status" >
                      
                            <div class="col-md-12" style="margin-top: 50px;">
                            
                                <div class="comment-list">
                                    <h4> <img src="https://static.nid.naver.com/images/web/user/default.png" class="img-responsive">
                                     
                                      	      ${commentvo.comment_date}
                                              ${nickname.get((status.index))} 
                                              
                                              
                                              &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-xs btn-theme-dark">Reply</a>
                                              <a class="btn btn-xs btn-theme-dark" href="javascript:location.href='<%= request.getContextPath() %>/ourroom/commentdel.action?comment_no=${commentvo.comment_no}&memberno_fk=${commentvo.memberno_fk}&rno=${boardvo.rno}&together_no=${commentvo.together_no}'">Delete</a>
                                      
                                  
                             	  				<!-- 댓글수정 -->
			                                    <a class="btn btn-xs btn-theme-dark"
			                                    href="javascript:location.href='<%=request.getContextPath()%>/ourroom/commentedit.action?comment_no=${commentvo.comment_no}&memberno_fk=${commentvo.memberno_fk}&rno=${boardvo.rno}&together_no=${commentvo.together_no}&comment_content=${commentvo.comment_content}&nickname=${nickname.get((status.index))}'">edit</a>
			                                   
                                  </h4>
                                     <p>
                                      ${commentvo.comment_content}
                                       </p>
                                <hr>
                                </div>
                            </div>
                            </c:forEach>
                      
             
                    
	<!-- 이전페이지 다음페이지 이동 -->
<c:if test="${boardvo.rno == 1}">
			<ul class="pager">
                       <li class="next"><a href='/main/view.action?rno=${boardvo.rno +1}&board_no=${nextboardno}'>Next Page &rarr;</a></li>
                       </ul><!--pager-->
		</c:if>
    			
	
	<c:if test="${boardvo.rno!=1 && count != boardvo.rno}" >
					<ul class="pager">
                        <li class="previous"><a href='/main/view.action?rno=${boardvo.rno -1}&board_no=${preboardno}'>&larr; Previous Page</a></li>
                        <li class="next"><a href='/main/view.action?rno=${boardvo.rno +1}&board_no=${nextboardno}'>Next Page &rarr;</a></li>
                    </ul><!--pager-->
		</c:if>	
		
		
		<c:if test="${count == boardvo.rno}">
			<ul class="pager">
                        <li class="previous"><a href='/main/view.action?rno=${boardvo.rno -1}&board_no=${preboardno}'>&larr; Previous Page</a></li>
                       </ul><!--pager-->
		</c:if>
   											<div class="clearfix"></div>
                                      
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                </section>
    </body>
</html>
