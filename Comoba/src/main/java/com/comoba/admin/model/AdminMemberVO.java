package com.comoba.admin.model;

public class AdminMemberVO {
	
	private String memberno;     // 회원번호
	private String nickname;    // 닉네임 
	private String pwd;          // 암호
	private String email;        // 이메일
	private String status;       // 회원상태(1:회원 / 0:회원불)
	
	
	private String studycnt;
	
	private String joindate;
	
	private String comments;
	
	
	public AdminMemberVO(){}


	public AdminMemberVO(String memberno, String nickname, String pwd, String email, String status, String studycnt,
			String joindate, String comments) {
		
		this.memberno = memberno;
		this.nickname = nickname;
		this.pwd = pwd;
		this.email = email;
		this.status = status;
		this.studycnt = studycnt;
		this.joindate = joindate;
		this.comments = comments;
	}


	public String getMemberno() {
		return memberno;
	}


	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getStudycnt() {
		return studycnt;
	}


	public void setStudycnt(String studycnt) {
		this.studycnt = studycnt;
	}


	public String getJoindate() {
		return joindate;
	}


	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	

}
