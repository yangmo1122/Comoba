package com.comoba.admin.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.comoba.admin.model.AdminBoardVO;
import com.comoba.admin.model.AdminDAO;
import com.comoba.admin.model.AdminMemberVO;

//===== #30. Service 선언 =====
@Service
public class AdminService implements InterAdminService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private AdminDAO dao;

	@Override
	public int getstudyroom_no() {
		int Memberseq = dao.getstudyroom_no();
		return Memberseq;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int addStudyroom(HashMap<String, String> mapStudyroom) throws Throwable  {
		
		int n = dao.addStudyroom(mapStudyroom);
		
		int result = 0;
		
		
		
		if(n==1) {
		    result = dao.addContents(mapStudyroom);
		}
		
		return result;
	}

	@Override
	public int addStudyroomimage(HashMap<String, String> mapStudyroomimage) {
		int n = dao.addStudyroomimage(mapStudyroomimage);
		return n;
	}

	@Override
	public List<AdminBoardVO> boardList(HashMap<String, String> map) {
		List<AdminBoardVO> boardList = dao.boardList(map);
		return boardList;
	}
	
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = dao.getTotalCount(map);
		return count;
	}
/////////////////
	@Override
	// @Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int boardCntList(HashMap<Object, Object> map) {
	
		 int boardCntList = dao.getBoardCntList(map);
		
	/*	 List<HashMap<String, String>> storyList = dao.getStoryList(map);
		
		 List<HashMap<String, String>> liveList = dao.getLiveList(map);
		
	*/
		return boardCntList;
	}

	
	@Override
	public int liveCntList(HashMap<Object, Object> map) {
	
		int liveCntList = dao.getliveCntList(map);
		
		return liveCntList;
	}
	
	
	@Override
	public int storyCntList(HashMap<Object, Object> map) {
	
		int storyCntList = dao.getstoryCntList(map);
		
		return storyCntList;
	}
		
	@Override
	public int orderCntList(HashMap<Object, Object> map) {

		int orderCntList = dao.getorderCntList(map);
		
		return orderCntList;
	}

	
	@Override
	public int seoulOrderCnt(HashMap<Object, Object> map) {

		int seoulOrderCnt = dao.getseoulOrderCnt(map);
		
		return seoulOrderCnt;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 아래부터 새로
	@Override
	public List<HashMap<Object, Object>> getBoardYearCnt() {
		List<HashMap<Object, Object>> list = dao.getBoardYearCnt();
		return list;
	}
	
	@Override
	public List<HashMap<Object, Object>> getLiveYearCnt() {
		List<HashMap<Object, Object>> list = dao.getLiveYearCnt();
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getstoryYearCnt() {
		List<HashMap<Object, Object>> list = dao.getstoryYearCnt();
		return list;
	}
	
	@Override
	public List<HashMap<Object, Object>> getorderYearCnt() {
		List<HashMap<Object, Object>> list = dao.getorderYearCnt();
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales0() {
		List<HashMap<Object, Object>> list = dao.getMonthSales0();
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales1() {
		List<HashMap<Object, Object>> list = dao.getMonthSales1();
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales2() {
		List<HashMap<Object, Object>> list = dao.getMonthSales2();
		return list;
	}


	@Override
	public List<HashMap<Object, Object>> getMonthSales3() {
		List<HashMap<Object, Object>> list = dao.getMonthSales3();
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales4() {
		List<HashMap<Object, Object>> list = dao.getMonthSales4();
		return list;
	}

	// 글 한개로 VO 정보를 얻어오기 위한 메소드
	@Override
	public AdminBoardVO getMemberno_fk(String Board_no) {
		
		AdminBoardVO boardvo = dao.getView(Board_no); // 글 1개를 보여주는것
		return boardvo;
	}

	@Override
	public int del(String board_no) {
		
		int n = dao.del(board_no); 
		
		return n;
	}

	@Override
	public int boardEdit(AdminBoardVO avo) {
		
		int n = dao.boardEdit(avo);
	
		int result = 0;
		
		if(n==1) {
			
		    result = dao.boardContentsEdit(avo);
		}
		
		return result;
		
	
	}
	
	@Override
	public List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map) {
		
		if(!map.get("search").trim().isEmpty()) {
			List<HashMap<String, String>> list = dao.searchWordCompleteList(map);
			return list;
		}
		else {
			return null;
		}
	}

	@Override
	public List<AdminMemberVO> memberList() {
		List<AdminMemberVO> memberList = dao.memberList();
		return memberList;
	}

	@Override
	public int memberEdit(AdminMemberVO avo) {
		int n = dao.memberEdit(avo);
		return n;
	}
	
	@Override
	public int memberDel(String memberno) {
	
		int n = dao.memberDel(memberno); 
		
		return n;
	}
	@Override
	public int getMemberCount(HashMap<String, String> map) {
		int count = dao.getMemberCount(map);
		return count;
	}
	@Override
	public int addStudyroomtitle(HashMap<String, String> hashMap) {
		int n = dao.addStudyroomtitle(hashMap);
		return n;
	}
	// 단어 검색시 ajax 리스트 가져오는 메소드 
	@Override 
	public List<HashMap<String, String>> searchList(HashMap<String, String> map) {


		if(!map.get("search").trim().isEmpty()) { // 서치값이 비어있지 않으면
			List<HashMap<String, String>> list = dao.searchList(map);
			return list;
		}
		else { // 서치값이 비어있으면
			List<HashMap<String, String>> list = dao.searchList();
			return list;
		}
		
	}
	@Override 
	// 회원의 정보를 복귀 하는 메소드
	public int comeback(String memberno) {
		
		int n = dao.comeback(memberno); 
		
		return n;
	}

	

	
	
}
