package com.comoba.main.model;

import java.util.HashMap;
import java.util.List;

public interface InterMainDAO {

	int loginEnd(HashMap<String, String> map);				// ==== 로그인 여부 알아오기 =====
	
	MemberVO getLoginMember(String email);					// ==== 로그인 성공한 사용자 정보 가져오기 =====

	int memberInsert(HashMap<String, String> map);			// ==== 회원가입  =====

	String getuserimage(String memberno);					// 회원 이미지 가져오기 

	int Insert_withFile(HashMap<String, String> map);		// ==== 회원가입 이미지 포함  =====
	
	int Insertwithphoto(HashMap<String, String> map);		// ==== 회원가입2+이미지 =====

	List<HashMap<String, String>> getTodayList();			// ===== 메인 페이지 게시글 =====

	List<HashMap<String, String>> gettodayno();				// ===== 메인 페이지 게시글 수=====
	
	List<HashMap<String, String>> getMotivateList();		// ===== 메인 페이지 자극글 =====
	
	List<HashMap<String, String>> getmotiveno();			// ===== 메인 페이지 자극글 수=====
	
	int edituser(HashMap<String, String> map);				// ===== 회원정보수정 =====
	
	int edit_withFile(HashMap<String, String> map);			// ===== 회원정보수정2 =====
	
	int getUser(String email);								// ==== 암호받기 ====
	
	MemberVO getMemberinfo(String memberno);				// 회원정보 가져오기

	int getmemberno(int memberno);							// ==== 회원번호 가져오기=====

	int changepwd(HashMap<String, String> map);				// 비밀번호 수정
	
	String getremaindate(HashMap<String, String> map);		// ===== 나의 d-day 현황 ====
	
	int getdate(HashMap<String, String> map); 				// 날짜 받아오기
	
	int checkattandce(HashMap<String, String> map);			// DDAY를 정한 날짜로 부터 DDAY까지의 일수 중 출석한 날짜의 총

	int getdday_no_fk(HashMap<String, String> map);			// dday_no_fk를 불러오기

	int dailyattance(HashMap<String, String> map);			// 오늘의 출첵
	
	int getMaxattand(HashMap<String, String> map);			// 오늘의 출첵 가져오기

	String getmemberno_fk(HashMap<String, String> map);		// dday_no_fk를 받기 위해서 dday_no받아오기

	int getmissionrate(HashMap<String, String> map);		// 미션성공율
	
	List<HashMap<String, String>> getattandanceList(HashMap<String, String> map); // 출석율 랭킹
	
	public List<HashMap<String, String>> getmissionrateList(HashMap<String, String> map);	// 미션 달성율 랭킹
	
	int addCount(HashMap<String,Object> map); 				// 스탑워치 시간 더하기
	
	void following(HashMap<String, String> followmap); 		// 팔로우하기
	
	void unfollowing(HashMap<String, String> followmap);	// 팔로우취소하기
	
	int checkfollowing(HashMap<String, String> followmap); 	// 팔로잉 했는지 안했는지 검사
}
