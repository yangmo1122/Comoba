package com.comoba.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//===== #28. DAO 선언 =====
@Repository
public class AdminDAO implements InterAdminDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public int getstudyroom_no() {
		int studyroom_no = sqlsession.selectOne("main.getstudyroom_no");
		return studyroom_no;
	}
	
	
	
	@Override
	public int addStudyroom(HashMap<String, String> mapStudyroom) {
		int n = sqlsession.insert("main.addStudyroom", mapStudyroom);
		return n;
	}
	
	@Override
	public int addContents(HashMap<String, String> mapStudyroom) {
		int n = sqlsession.insert("main.addContents", mapStudyroom);
		return n;
	}

	
	
	@Override
	public int addStudyroomimage(HashMap<String, String> mapStudyroomimage) {
		int n = sqlsession.insert("main.addStudyroomimage", mapStudyroomimage);
		return n;
	}
	
	
	@Override
	public List<AdminBoardVO> boardList(HashMap<String, String> map) {

		List<AdminBoardVO> boardList = sqlsession.selectList("main.boardList", map );
		
		return boardList;
	}
	
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("main.getTotalCount", map);
		return count;
	}


	@Override
	public int getBoardCntList(HashMap<Object, Object> map) {

		int count = sqlsession.selectOne("main.getBoardCntList", map);
		
		return count;
	}

	@Override
	public int getliveCntList(HashMap<Object, Object> map) {
		
		int count = sqlsession.selectOne("main.getliveCntList", map);
		
		return count;
	}


	@Override
	public int getstoryCntList(HashMap<Object, Object> map) {
		
		int count = sqlsession.selectOne("main.getstoryCntList", map);
		
		return count;
	}


	@Override
	public int getorderCntList(HashMap<Object, Object> map) {

		int count = sqlsession.selectOne("main.getorderCntList", map);
		
		return count;
	}


	@Override
	public int getseoulOrderCnt(HashMap<Object, Object> map) {
		
		int count = sqlsession.selectOne("main.getseoulOrderCnt", map);
		
		return count;
	}



	@Override
	public List<HashMap<Object, Object>> getBoardYearCnt() {
		
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getBoardYearCnt");
		return list;
	}


	@Override
	public List<HashMap<Object, Object>> getLiveYearCnt() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getLiveYearCnt");
		return list;
	}


	@Override
	public List<HashMap<Object, Object>> getstoryYearCnt() {
		
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getstoryYearCnt");
		return list;
	}


	@Override
	public List<HashMap<Object, Object>> getorderYearCnt() {
		
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getorderYearCnt");
		return list;
	}


	@Override
	public List<HashMap<Object, Object>> getMonthSales0() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getMonthSales0");
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales1() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getMonthSales1");
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales2() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getMonthSales2");
		return list;
	}

	@Override
	public List<HashMap<Object, Object>> getMonthSales3() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getMonthSales3");
		return list;
	}
	
	@Override
	public List<HashMap<Object, Object>> getMonthSales4() {
		List<HashMap<Object, Object>> list = sqlsession.selectList("main.getMonthSales4");
		return list;
	}


	@Override
	public AdminBoardVO getView(String Board_no) {
		AdminBoardVO boardvo = sqlsession.selectOne("main.getView", Board_no);
		return boardvo;
	}


	@Override
	public int del(String board_no) {
		int n = sqlsession.update("main.boardDel", board_no );
		return n;
	}


	@Override
	public int boardEdit(AdminBoardVO avo) {
		int n = sqlsession.update("main.Edit", avo );
		return n;
	}


	@Override
	public int boardContentsEdit(AdminBoardVO avo) {
		int n = sqlsession.update("main.boardContentsEdit", avo );
		return n;
	}


	// ===== #150. Ajax 로 검색어 입력시 자동글 완성하기 5 =====	
		@Override
		public List<HashMap<String, String>> searchWordCompleteList(HashMap<String, String> map) {
			List<HashMap<String, String>> list = sqlsession.selectList("main.searchWordCompleteList", map);
			return list;
		}


		@Override
		public List<AdminMemberVO> memberList() {
			List<AdminMemberVO> memberList = sqlsession.selectList("main.memberList");
			
			return memberList;
		}


		@Override
		public int memberEdit(AdminMemberVO avo) {
		
			System.out.println("avo.getPwd() : "+avo.getPwd());
			System.out.println("avo.getMemberno() : "+avo.getMemberno());
			System.out.println("avo.getEmail() : "+avo.getEmail());
			System.out.println("avo.getNickname() : "+avo.getNickname());
			int n = sqlsession.update("main.memberEdit", avo );
			return n;
		}


		@Override
		public int memberDel(String memberno) {
			int n = sqlsession.update("main.memberDel", memberno );
			return n;
		}


		@Override
		public int getMemberCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("main.getMemberCount", map);
			return count;
		}


		@Override
		public int addStudyroomtitle(HashMap<String, String> hashMap) {
			int n = sqlsession.update("main.addStudyroomtitle", hashMap);
			return n;
		}
		
		@Override
		// 맴버에서 서치값이 있을시 해쉬맵에 검색된 것만 담아 리스트를 뽑아준다.
		public List<HashMap<String, String>> searchList(HashMap<String, String> map) {
		
			List<HashMap<String, String>> list = sqlsession.selectList("main.searchList", map);
			return list;
		}
		
		
		@Override
		// 맴버에서 서치값이 null 해쉬맵에 전체를 담아 리스트를 뽑아준다.
		public List<HashMap<String, String>> searchList() {
		
			List<HashMap<String, String>> list = sqlsession.selectList("main.memberAllList");
			return list;
		}


		@Override
		// 회원의 정보를 복귀 하는 메소드
		public int comeback(String memberno) {
			int n = sqlsession.update("main.comeback", memberno );
			return n;
		}
	
	
	
	
}
