package com.comoba.ourroom.model;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//===== #28. DAO 선언 =====
@Repository
public class OurroomDAO implements InterOurroomDAO{

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	// ===== #122. spring_tblBoard 테이블에서 groupno 컬럼의 최대값 구하기 =====
		@Override
		public int getGroupMaxno() {
			int max = sqlsession.selectOne("ourroom.getGroupMaxno");
			return max;
		}

	//===== #138. 첨부파일이 있는 경우의 글쓰기 =====
		@Override
		public int add_withFile(BoardVO boardvo) {
			int n = sqlsession.insert("ourroom.add_withFile", boardvo);
			return n;
		}
		
		// ===== #113. 총 게시물 건수 구하기
		//             총 게시물 건수는 검색조건이 없을때와 있을때로 나뉘어진다. ===== 	
		@Override
		public int getTotalCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("ourroom.getTotalCount", map);
			return count;
		}

		// ===== 게시판목록
		
		@Override
	public List<BoardVO> boardList(HashMap<String, String> map,  RowBounds rowbounds) {
		List<BoardVO> boardList = sqlsession.selectList("ourroom.boardList", map , rowbounds);
		
		return boardList;
	}
	
	
	
	
	// ===== #57. 글쓰기를 해주는 int add(BoardVO boardvo) 메소드 생성하기 =====
	@Override
	public int add(BoardVO boardvo) {
	   int n = sqlsession.insert("ourroom.add", boardvo);
	   
	   return n;	
	}

	// ===== #73. 1개 글수정 하기 =====
	@Override
	public int updateContent(HashMap<String, String> map) {
		int n = sqlsession.update("ourroom.updateContent", map);
		return n;
	}
	
		// ===== #65. 글 1개를 볼때 조회수(readCount) 1증가 시키기 =====
		@Override
		public void setAddReadCount(String board_no) {
			sqlsession.update("ourroom.setAddReadCount", board_no);
		}

		// ===== #65. 글 1개 보여주는 BoardVO getView(String seq) 메소드 생성하기 =====
		@Override
		public BoardVO getView(String rno) {
			BoardVO boardvo = sqlsession.selectOne("ourroom.getView", rno);
			return boardvo;
		}
		
		
		
		@Override
		public String getSequenceno() {
			String nextval = String.valueOf(sqlsession.selectOne("ourroom.getSequenceno"));
			return nextval;
		}
		
	//글삭제 
		@Override
		public int del(HashMap<String, String> map) {
			int del = sqlsession.update("ourroom.del", map);
			
			return del;
		}

		// ===== #86. 댓글쓰기 =====
		@Override
		public int addComment(CommentVO commentvo) {
			int n = sqlsession.insert("ourroom.addComment", commentvo);
			return n;
		}


		// ====== #91. 댓글내용 보여주기 ======
		@Override
		public List<CommentVO> listComment(String parentSeq) {
			List<CommentVO> list = sqlsession.selectList("ourroom.listComment", parentSeq);
			return list;
		}

		public List<String> getnickname(List<CommentVO> commentList) {
			
			List<String> getnickname = new ArrayList<String>();
			
			for(CommentVO covo : commentList) {
    			
				String number = covo.getMemberno_fk();
				int num = Integer.parseInt(number);
				
				String nickname =	sqlsession.selectOne("ourroom.getnickname", num);
    	
				getnickname.add(nickname);
    		}
			
			
			return getnickname;
		}
		
		
		
		// ======내방======
		@Override
		public List<QnaVO> qnaList() {
			List<QnaVO> qnaList = sqlsession.selectList("ourroom.qnaList");
			return qnaList;
		}
		
		
		// ======우리방
		@Override
		public List<QnaVO> Qnaourroom() {
			List<QnaVO> Qnaourroom = sqlsession.selectList("ourroom.Qnaourroom");
			return Qnaourroom;
		}
		
		// ====== 공라이브
		@Override
		public List<QnaVO> Qnalive() {
			List<QnaVO> Qnalive = sqlsession.selectList("ourroom.Qnalive");
			return Qnalive;
		}
		// ====== 공스토리
		@Override
		public List<QnaVO> Qnastory() {
			List<QnaVO> Qnastory = sqlsession.selectList("ourroom.Qnastory");
			return Qnastory;
		}

		// ====== 댓글삭제하기
		@Override
		public int commentdel(HashMap<String, String> map) {
			int commentdel = sqlsession.update("ourroom.commentdel", map);
			return commentdel;
		}
		
		
		// ====== 댓글 수정 하기 
		@Override
		public int commentedit(HashMap<String, String> map) {
			int commentedit = sqlsession.update("ourroom.commentedit", map);
			return commentedit;
		}

		
		/*qna 댓글*/
		@Override
		public int qnasearch(HashMap<String, String> map) {
			int count = sqlsession.selectOne("ourroom.getqnaTotalCount", map);
			return count;
		}
		
		
			//멤버수 가져오기
		@Override
		public int getmemberCount() {
			int memberCount = sqlsession.selectOne("ourroom.getmemberCount");
			return memberCount;
		}

		public String getcount() {
			String Count = sqlsession.selectOne("ourroom.getCount");
			return Count;
		}

		

		//댓글수정
		public int getcommentselectone(HashMap<String, String> map) {
			int n = sqlsession.selectOne("ourroom.getcommentselectone", map);
			return n;
		}

	
	
	}




