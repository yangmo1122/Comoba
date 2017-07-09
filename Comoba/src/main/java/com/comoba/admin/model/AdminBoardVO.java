package com.comoba.admin.model;

import org.springframework.web.multipart.MultipartFile;

public class AdminBoardVO {
	
	

	private String board_no;         // 글번호
 	private String memberno_fk;      // 사용자ID
 	private String nickname;        // 글쓴이름
 	private String subject;     // 글제목
 	private String pw;          // 글암호
 	private String readCount;   // 글조회수
 	private String writedate;     // 글쓴시간
 	private String status;      // 글삭제여부  1:사용가능한글,  0:삭제된글  
	
 	private String board_contents;     // 글내용  
 	
// 	===== #94. commentCount 프로퍼티 추가하기
// 	            먼저 spring_tblBoard 테이블에 commentCount 컬럼을 추가한 다음에 해야 한다. =====
 	private String commentCount; // 댓글수
 	
//  ===== #116. 답변형 게시판을 위한 멤버변수 추가하기
//              먼저, spring_tblBoard 테이블과 spring_tblComment 테이블을 기존것은 제거한후 
//              새로이 만든 다음에 아래와 같이 한다. 
 	private String groupno;
 	/*
 	 답변글쓰기에 있어서 그룹번호
      원글(부모글)과 답변글은 동일한 groupno 를 가진다. 
      답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다. 
 	 */
 	
 	private String fk_seq;
 /*
    fk_seq 컬럼은 절대로 foreign key가 아니다.
    fk_seq 컬럼은 자신의 글(답변글)에 있어서 
    원글(부모글)이 누구인지에 대한 정보값이다.
    답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
    원글(부모글)의 seq 컬럼의 값을 가지게 되며,
    답변글이 아닌 원글일 경우 0 을 가지도록 한다. 	
  */
 	
 	private String depthno;
 /*
    답변글쓰기에 있어서 답변글 이라면                                                
    원글(부모글)의 depthno + 1 을 가지게 되며,
    답변글이 아닌 원글일 경우 0 을 가지도록 한다. 	
  */
 
/* 	
 ===== #131. 파일첨부를 하도록 VO 수정하기
              먼저, 오라클에서 spring_tblBoard 테이블에
            3개 컬럼(fileName, orgFilename, fileSize)을 추가한 다음에
              아래의 작업을 해야 한다. ======
*/
 	
 	private String fileName;    // WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
 	private String orgFilename; // 진짜 파일명(강아지.png)  사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
 	private String fileSize;    // 파일크기
 	
 	private MultipartFile attach; // 진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
 	    // MultipartFile attach 는 오라클 데이터베이스 spring_tblBoard 테이블의 컬럼이 아니다.!!!!!
 	
 	 	
 	public AdminBoardVO() { }
 	
 	public AdminBoardVO(String board_no, String memberno_fk, String nickname, String subject, String board_contents, String pw, String readCount, String writedate,
			String status, String commentCount,
			String groupno, String fk_seq, String depthno,
			String fileName, String orgFilename, String fileSize) {
		this.board_no = board_no;
		this.memberno_fk = memberno_fk;
		this.nickname = nickname;
		this.subject = subject;
		this.board_contents = board_contents;
		this.pw = pw;
		this.readCount = readCount;
		this.writedate = writedate;
		this.status = status;
		
		this.commentCount = commentCount;
		
		this.groupno = groupno;
		this.fk_seq = fk_seq;
		this.depthno = depthno;
		
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		
	}
		


	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getMemberno_fk() {
		return memberno_fk;
	}

	public void setMemberno_fk(String memberno_fk) {
		this.memberno_fk = memberno_fk;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	
	
	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getBoard_contents() {
		return board_contents;
	}

	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getGroupno() {
		return groupno;
	}

	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	public String getFk_seq() {
		return fk_seq;
	}

	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOrgFilename() {
		return orgFilename;
	}

	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}	
	
	
}
