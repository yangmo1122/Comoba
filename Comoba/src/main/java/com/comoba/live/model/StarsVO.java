package com.comoba.live.model;

public class StarsVO {

	private int stars_no;        // 별점번호
	private int live_no_fk;      // 공라이브번호 
	private int memberno_fk;     // 회원번호 
	private int stars;           // 별점
	
	
	
	public StarsVO() {}
	
	public StarsVO(int stars_no, int live_no_fk, int memberno_fk, int stars) {
		
		this.stars_no = stars_no;
		this.live_no_fk = live_no_fk;
		this.memberno_fk = memberno_fk;
		this.stars = stars;
	}
	
	
	public int getStars_no() {
		return stars_no;
	}
	public void setStars_no(int stars_no) {
		this.stars_no = stars_no;
	}
	public int getLive_no_fk() {
		return live_no_fk;
	}
	public void setLive_no_fk(int live_no_fk) {
		this.live_no_fk = live_no_fk;
	}
	public int getMemberno_fk() {
		return memberno_fk;
	}
	public void setMemberno_fk(int memberno_fk) {
		this.memberno_fk = memberno_fk;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	
	
}
