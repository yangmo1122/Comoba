package com.comoba.main.model;

public class UserdetailVO {

	private int seq;   		//시퀀스번호
	private String name;	//성명 
	private String tel;		//연락처
	private String address;	//주소
	
	public UserdetailVO(){};
	
	public UserdetailVO(int seq, String name, String tel, String address) {

		this.seq = seq;
		this.name = name;
		this.tel = tel;
		this.address = address;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
