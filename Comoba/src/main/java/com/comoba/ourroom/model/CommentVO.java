package com.comoba.ourroom.model;

public class CommentVO {

	private String comment_no;  		 //댓글 번호
	private String memberno_fk;          //회원 번호
	private String together_no;    		 //같이쓴다 그랬음...!!!!(공스토리 번호, 공라이브 번호, 자유게시판 번호)
	
	private String comment_content; 	 //댓글내용
	private String comment_date;    	 //댓글작성일자
	private String comment_status;		 //댓글삭제유무'
	private String nickname;		     //닉네임
	private String boardtype;

	

	public String getNickname() {
		return nickname;
	}


	public CommentVO(String nickname) {
		super();
		this.nickname = nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public CommentVO() { }


	public String getComment_no() {
		return comment_no;
	}


	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}


	public String getMemberno_fk() {
		return memberno_fk;
	}


	public void setMemberno_fk(String memberno_fk) {
		this.memberno_fk = memberno_fk;
	}


	public String getTogether_no() {
		return together_no;
	}


	public void setTogether_no(String together_no) {
		this.together_no = together_no;
	}


	public String getBoardtype() {
		return boardtype;
	}


	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}


	public String getComment_content() {
		return comment_content;
	}


	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}


	public String getComment_date() {
		return comment_date;
	}


	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}


	public String getComment_status() {
		return comment_status;
	}


	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}


	public CommentVO(String comment_no, String memberno_fk, String together_no, String boardtype,
			String comment_content, String comment_date, String comment_status) {
		
		this.comment_no = comment_no;
		this.memberno_fk = memberno_fk;
		this.together_no = together_no;
		this.boardtype = boardtype;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.comment_status = comment_status;
		
	}




}