package com.comoba.story.model;

import org.springframework.web.multipart.MultipartFile;

public class StoryVO {

	private String story_no;  				//-- 공스토리번호
	private String memberno_fk;   			//-- 회원번호 
	private String story_tag;       	//-- 해쉬태그   ????
	private String regDate;				// 글쓴시간
	private String likeCount;			// 좋아요 개수
	private String readCount;			// 조회수
	private String story_contents;  //-- 공스토리테이블내용
	private String story_publicStatus;  //-- 공개설정여부  
	private String story_status;           //-- 게시물삭제유무 

	
	
	private String file_no;    			//-- 첨부파일번호
	private String fileName;    // WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
 	private String orgFilename; // 진짜 파일명(강아지.png)  사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
 	private String fileSize;    // 파일크기
	
	private MultipartFile attach; // 진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
	    // MultipartFile attach 는 오라클 데이터베이스 spring_tblBoard 테이블의 컬럼이 아니다.!!!!!
	
	
	public StoryVO () { }
		public StoryVO(String story_no, String memberno_fk, String story_tag, String regDate, String likeCount, String readCount,
				String story_contents, String story_publicStatus, String story_status, String file_no, String fileName,
				String orgFilename, String fileSize) {
			
			this.story_no = story_no;
			this.memberno_fk = memberno_fk;
			this.story_tag = story_tag;
			this.likeCount = likeCount;
			this.regDate = regDate;
			this.readCount = readCount;
			this.story_contents = story_contents;
			this.story_publicStatus = story_publicStatus;
			this.story_status = story_status;
			this.file_no = file_no;
			this.fileName = fileName;
			this.orgFilename = orgFilename;
			this.fileSize = fileSize;
		}
		public String getStory_no() {
			return story_no;
		}
		public void setStory_no(String story_no) {
			this.story_no = story_no;
		}
		public String getMemberno_fk() {
			return memberno_fk;
		}
		public void setMemberno_fk(String memberno_fk) {
			this.memberno_fk = memberno_fk;
		}
		public String getStory_tag() {
			return story_tag;
		}
		public void setStory_tag(String story_tag) {
			this.story_tag = story_tag;
		}
		public String getLikeCount() {
			return likeCount;
		}
		public void setLikeCount(String likeCount) {
			this.likeCount = likeCount;
		}
		public String getRegDate() {
			return regDate;
		}
		public void setRegDate(String regDate) {
			this.regDate = regDate;
		}
		public String getReadCount() {
			return readCount;
		}
		public void setReadCount(String readCount) {
			this.readCount = readCount;
		}
		public String getStory_contents() {
			return story_contents;
		}
		public void setStory_contents(String story_contents) {
			this.story_contents = story_contents;
		}
		public String getStory_publicStatus() {
			return story_publicStatus;
		}
		public void setStory_publicStatus(String story_publicStatus) {
			this.story_publicStatus = story_publicStatus;
		}
		public String getStory_status() {
			return story_status;
		}
		public void setStory_status(String story_status) {
			this.story_status = story_status;
		}
		public String getFile_no() {
			return file_no;
		}
		public void setFile_no(String file_no) {
			this.file_no = file_no;
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
