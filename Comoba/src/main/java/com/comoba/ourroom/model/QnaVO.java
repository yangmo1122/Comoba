package com.comoba.ourroom.model;

// ===== #55. VO 생성하기 =====
//       먼저, 오라클에서 spring_tblBoard 테이블을 생성해야 한다.


public class QnaVO {
	//qna 테이블
	private String question_no;// 질문번호
	private String category;   // 카테고리 	
	private String title;      // 제목
	private String contents;      // 내용
	
	
	public QnaVO() { }
	
	
	
	public String getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(String question_no) {
		this.question_no = question_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	
	public QnaVO(String question_no, String category, String title, String contents) {
		
	
		
		this.question_no = question_no;
		this.category = category;
		this.title = title;
		this.contents = contents;
	}

	
}
	

