package com.comoba.admin.model;

import java.util.HashMap;
import java.util.List;

//model단(DAO)의 인터페이스 생성
public interface InterAdminDAO {


	int getstudyroom_no();	//admin 계정의 회원번호 를 가져오는 메소드 생성
	
	int addStudyroom(HashMap<String, String> mapStudyroom);
	
	int addContents(HashMap<String, String> mapStudyroom);
	
	int addStudyroomimage(HashMap<String, String> mapStudyroomimage);

	List<AdminBoardVO> boardList(HashMap<String, String> map);

	int getTotalCount(HashMap<String, String> map);

		
	int getBoardCntList(HashMap<Object, Object> map);

	int getliveCntList(HashMap<Object, Object> map);
	
	int getstoryCntList(HashMap<Object, Object> map);

	int getorderCntList(HashMap<Object, Object> map);

	int getseoulOrderCnt(HashMap<Object, Object> map);

	List<HashMap<Object, Object>> getBoardYearCnt();

	List<HashMap<Object, Object>> getLiveYearCnt();

	List<HashMap<Object, Object>> getstoryYearCnt();

	List<HashMap<Object, Object>> getorderYearCnt();

	List<HashMap<Object, Object>> getMonthSales0();

	List<HashMap<Object, Object>> getMonthSales1();

	List<HashMap<Object, Object>> getMonthSales2();

	List<HashMap<Object, Object>> getMonthSales3();

	List<HashMap<Object, Object>> getMonthSales4();

	AdminBoardVO getView(String seq);

	int del(String board_no);

	int boardEdit(AdminBoardVO avo);

	int boardContentsEdit(AdminBoardVO avo);

	List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map);

	int memberEdit(AdminMemberVO avo);

	int memberDel(String memberno);

	List<AdminMemberVO> memberList(); // 멤버 리스트 가져오는 메소드

	List<HashMap<String, String>> searchList(HashMap<String, String> map); // 맴버관리에서 서치값이 있을시 멤버리스트를 가져오는 메소드

	int addStudyroomtitle(HashMap<String, String> hashMap);

	int getMemberCount(HashMap<String, String> map);

	List<HashMap<String, String>> searchList();

	int comeback(String memberno);  // 회원을 복귀 시키는 메소드
	
	

	
	
	
	
}
