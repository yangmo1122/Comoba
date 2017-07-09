package com.comoba.main.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int memberno; // 회원번호
	private String nickname; // 닉네임
	private String pwd; // 암호
	private String email; // 이메일
	private String status; // 회원상태(1:회원 / 0:회원불)
	private int studycnt; // 스터디카운트
	private String comments; // 코멘트
	private String joindate; // 가입일자

	private String fileName; // WAS(톰캣)에 저장될
								// 파일명(20161121324325454354353333432.png)
	private String orgFilename; // 진짜 파일명(강아지.png) 사용자가 파일을 업로드 하거나 파일을 다운로드 할때
								// 사용되어지는 파일명
	private String fileSize; // 파일크기
	private MultipartFile attach; // 진짜파일 ==> WAS(톰캣) 디스크에 저장됨.

	public MemberVO() {
	};

	public MemberVO(int memberno, String nickname, String pwd, String email, String status, int studycnt,
			String comments, String joindate, String fileName, String orgFilename, String fileSize,
			MultipartFile attach) {
		this.memberno = memberno;
		this.nickname = nickname;
		this.pwd = pwd;
		this.email = email;
		this.status = status;
		this.studycnt = studycnt;
		this.comments = comments;
		this.joindate = joindate;
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.attach = attach;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
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

	public int getStudycnt() {
		return studycnt;
	}

	public void setStudycnt(int studycnt) {
		this.studycnt = studycnt;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
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
	
	
	/*
	var days = Math.floor(sm_count / (1000 * 60 * 60 * 24));
    var hours = Math.floor((sm_count % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((sm_count % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((sm_count % (1000 * 60)) / 1000);
    */

	public int getHours() {
		int hours =  (int) Math.floor(studycnt  / (1000 * 60 * 60)); 
		return hours;
	}


	public int getMinutes() {
		
		int minutes = (int) Math.floor((studycnt % (1000 * 60 * 60)) / (1000 * 60));
		return minutes;
	}

	public int getSeconds() {
		int seconds = (int) Math.floor((studycnt % (1000 * 60)) / 1000);
		return seconds;
	}

	
}




