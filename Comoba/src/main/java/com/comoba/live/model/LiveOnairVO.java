package com.comoba.live.model;

public class LiveOnairVO {

	// 방송내역테이블
	private int onair_no;
	private int live_no_fk;
	private String starttime;
	private String finishtime;
	private String gong_link;
	private String comments;
	private int status;
	
	public LiveOnairVO(){}

	
	public LiveOnairVO(int onair_no, int live_no_fk, String starttime, String finishtime, String gong_link,
			String comments, int status) {
		
		this.onair_no = onair_no;
		this.live_no_fk = live_no_fk;
		this.starttime = starttime;
		this.finishtime = finishtime;
		this.gong_link = gong_link;
		this.comments = comments;
		this.status = status;
	}


	public int getOnair_no() {
		return onair_no;
	}

	public void setOnair_no(int onair_no) {
		this.onair_no = onair_no;
	}

	public int getLive_no_fk() {
		return live_no_fk;
	}

	public void setLive_no_fk(int live_no_fk) {
		this.live_no_fk = live_no_fk;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}

	public String getGong_link() {
		return gong_link;
	}

	public void setGong_link(String gong_link) {
		this.gong_link = gong_link;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
		
	
}
