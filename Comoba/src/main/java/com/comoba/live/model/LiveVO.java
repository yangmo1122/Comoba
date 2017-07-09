package com.comoba.live.model;

import org.springframework.web.multipart.MultipartFile;

public class LiveVO {

	private int live_no;       		// 공라이브번호
	private int memberno_fk;      	// 회원번호 
	private String gong_title;      // 제목 
	private int gong_views;         // 조회수 
	private String gong_link;       // 영상링크 
	private String writedate;        // 글쓴 날짜
	private int gong_status;        // 게시물삭제유무
	private String gonglive_contents;     // 공라이브테이블내용
	
	
	private int addfile_no; 		  // 이미지번호
	private String fileName;          // 저장되어지는 파일명
	private String orgFilename;       // 사용되어지는 파일명
	private int fileSize;			  // 파일크기
	private int fileStatus;           // 대표이미지:1, 나머지 첨부파일: 2
	
	private MultipartFile attach; // 진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
	// MultipartFile attach 는 오라클 데이터베이스 spring_tblBoard 테이블의 컬럼이 아니다.!!!!!
	
	
	public LiveVO(){}

	public LiveVO(int live_no, int memberno_fk, String gong_title, int gong_views, String gong_link,
			String writedate,  int gong_status, String gonglive_contents,
			int addfile_no, String fileName, String orgFilename, int fileSize, int fileStatus) {
		super();
		this.live_no = live_no;
		this.memberno_fk = memberno_fk;
		this.gong_title = gong_title;
		this.gong_views = gong_views;
		this.gong_link = gong_link;
		this.writedate = writedate;
		this.gong_status = gong_status;
		this.gonglive_contents = gonglive_contents;
		this.addfile_no = addfile_no;
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.fileStatus = fileStatus;
	}
	
	public int getLive_no() {
		return live_no;
	}
	public void setLive_no(int live_no) {
		this.live_no = live_no;
	}
	public int getMemberno_fk() {
		return memberno_fk;
	}
	public void setMemberno_fk(int memberno_fk) {
		this.memberno_fk = memberno_fk;
	}
	public String getGong_title() {
		return gong_title;
	}
	public void setGong_title(String gong_title) {
		this.gong_title = gong_title;
	}
	public int getGong_views() {
		return gong_views;
	}
	public void setGong_views(int gong_views) {
		this.gong_views = gong_views;
	}
	public String getGong_link() {
		return gong_link;
	}
	public void setGong_link(String gong_link) {
		this.gong_link = gong_link;
	}
	
	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getGong_status() {
		return gong_status;
	}
	public void setGong_status(int gong_status) {
		this.gong_status = gong_status;
	}
	public String getGonglive_contents() {
		return gonglive_contents;
	}
	public void setGonglive_contents(String gonglive_contents) {
		this.gonglive_contents = gonglive_contents;
	}
	public int getAddfile_no() {
		return addfile_no;
	}
	public void setAddfile_no(int addfile_no) {
		this.addfile_no = addfile_no;
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
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public int getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	
	
	
	
	
	
}
