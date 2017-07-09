package com.comoba.admin.service;

import java.util.HashMap;
import java.util.List;

import com.comoba.admin.model.AdminBoardVO;
import com.comoba.admin.model.AdminMemberVO;

//Service 단 인터페이스 선언
public interface InterAdminService {

	
	int getstudyroom_no();  //admin 계정의 회원번호 를 가져오는 메소드 생성
	
	int addStudyroom(HashMap<String, String> mapStoryroom ) throws Throwable ; // cmb_studyroom 에 스토리룸을 추가하는 메소드 생성 
	
	
	
	int addStudyroomimage(HashMap<String, String> mapStoryroomimage); //cmb_studyroom_addfile 에 스토리룸을 추가하는 메소드 생성 

	List<AdminBoardVO> boardList(HashMap<String, String> map); // 자유게시판 글목록 보여주기(검색어가 있는 전체글목록 보여주기)

	int getTotalCount(HashMap<String, String> map); // 총 자유게시판 게시물 건수 구하기 

	

	int boardCntList(HashMap<Object, Object> map);

	int storyCntList(HashMap<Object, Object> map);

	int liveCntList(HashMap<Object, Object> map);

	int orderCntList(HashMap<Object, Object> map);

	int seoulOrderCnt(HashMap<Object, Object> map);

	List<HashMap<Object, Object>> getBoardYearCnt();

	List<HashMap<Object, Object>> getLiveYearCnt();

	List<HashMap<Object, Object>> getstoryYearCnt();

	List<HashMap<Object, Object>> getorderYearCnt();

	List<HashMap<Object, Object>> getMonthSales0();

	List<HashMap<Object, Object>> getMonthSales1();

	List<HashMap<Object, Object>> getMonthSales2();

	List<HashMap<Object, Object>> getMonthSales3();

	List<HashMap<Object, Object>> getMonthSales4();

	AdminBoardVO getMemberno_fk(String seq);

	int del(String board_no);

	int boardEdit(AdminBoardVO avo);

	List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map);

	int memberEdit(AdminMemberVO avo);

	int memberDel(String memberno);

	int getMemberCount(HashMap<String, String> map);

	int addStudyroomtitle(HashMap<String, String> hashMap);

	List<AdminMemberVO> memberList(); // 맴버 리스트 가져오는 메소드

	List<HashMap<String, String>> searchList(HashMap<String, String> map); //// 단어 검색시 ajax 리스트 가져오는 메소드

	int comeback(String memberno); // 회원을 복귀 시키는 메소드

	
	
	
}

