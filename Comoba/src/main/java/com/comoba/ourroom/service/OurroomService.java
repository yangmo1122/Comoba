package com.comoba.ourroom.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.comoba.ourroom.model.OurroomDAO;
import com.comoba.ourroom.model.QnaVO;
import com.comoba.ourroom.model.BoardVO;
import com.comoba.ourroom.model.CommentVO;

//=====  Service 선언 =====
@Service
public class OurroomService implements InterOurroomService {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private OurroomDAO dao;

	// ===== #112. 총 게시물 건수 구하기
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = dao.getTotalCount(map);
		return count;
	}

	@Override
	public List<BoardVO> boardList(HashMap<String, String> map, RowBounds rowbounds) {

		List<BoardVO> boardList = dao.boardList(map, rowbounds);

		return boardList;
	}

	// ===== #56. 글쓰기를 해주는 서비스단 int add(BoardVO boardvo) 메소드 생성하기 =====
	@Override
	public int add(BoardVO boardvo) {

		if (boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {

			int groupno = dao.getGroupMaxno() + 1;
			boardvo.setGroupno(String.valueOf(groupno));
		}

		int n = dao.add(boardvo);
		return n;
	}

	// ===== #137. 파일첨부가 있는 글쓰기 =====
	@Override
	public int add_withFile(BoardVO boardvo) {

		// 원글쓰기인지, 답변글쓰기인지 구분하기
		if (boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {
			// 원글쓰기인 경우
			int groupno = dao.getGroupMaxno() + 1;
			boardvo.setGroupno(String.valueOf(groupno));
		}

		int n = dao.add_withFile(boardvo); // 첨부파일이 있는 경우
		return n;
	}

	// ===== #64. 글 1개를 보여주는(먼저 조회수 1증가 한후) 서비스단 BoardVO getView(String seq) 메소드
	// 생성하기 =====
	@Override
	public BoardVO getView(String rno) {

		BoardVO boardvo = dao.getView(rno); // 글 1개를 보여주는것

		return boardvo;
	}

	// ===== #69. 글 1개를 보여주는(조회수 1증가 없이) 서비스단 BoardVO getView(String seq) 메소드
	// 생성하기 =====
	@Override
	public BoardVO getViewWithNoAddCount(String rno) {

		BoardVO boardvo = dao.getView(rno); // 글 1개를 보여주는것
		return boardvo;
	}

	@Override
	public String getSequenceno() {
		String nextval = dao.getSequenceno();
		return nextval;
	}

	// ===== #72. 1개글 수정하기
	@Override
	public int edit(HashMap<String, String> map) {

		int n = dao.updateContent(map); // 글 1개 수정하기

		return n;

	}

	// ========글삭제========
	@Override
	public int del(HashMap<String, String> map) {
		int n = dao.del(map);
		return n;
	}

	// ===== #85. 댓글쓰기 =====
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	public int addComment(CommentVO commentvo) throws Throwable {

		int n = dao.addComment(commentvo);
		return n;
	}

	// ===== #90. 댓글내용 보여주기 =====

	@Override
	public List<CommentVO> listComment(String board_no) {
		List<CommentVO> list = dao.listComment(board_no);
		return list;
	}

	public List<String> getnickname(List<CommentVO> commentList) {

		List<String> nickname = dao.getnickname(commentList);

		return nickname;

	}

	/*
	 * // =====(1번) 내방 Q&A public List<QnaVO> Qnalive() { // TODO Auto-generated
	 * method stub return null; }
	 */
	// =====(2번) 내방 Q&A

	public List<QnaVO> Qnalive() {
		List<QnaVO> Qnalive = dao.Qnalive();
		return Qnalive;
	}

	// =====(3번) 내방 Q&A
	public List<QnaVO> getQnalist() {
		List<QnaVO> qnaList = dao.qnaList();
		return qnaList;
	}

	// =====(4번) 우리방 Q&A

	@Override
	public List<QnaVO> Qnaourroom() {
		List<QnaVO> Qnaourroom = dao.Qnaourroom();
		return Qnaourroom;
	}

	// =====(1번) Q&A 스토리
	public List<QnaVO> Qnastory() {
		List<QnaVO> Qnastory = dao.Qnastory();
		return Qnastory;
	}

	// ===== 댓글삭제 보여주기 =====
	@Override
	public int commentdel(HashMap<String, String> map) {
		int n = dao.commentdel(map);
		return n;
	}

	// ===== 댓글 수정 하기 ====
	@Override
	public int commentedit(HashMap<String, String> map) {
		int n = dao.commentedit(map);
		return n;
	}

	/* qna 검색 */
	@Override
	public int qnasearch(HashMap<String, String> map) {
		int qnasearch = dao.getTotalCount(map);
		return qnasearch;
	}

	// 멤버수 가져오기
	@Override
	public int getmemberCount() {
		int memberCount = dao.getmemberCount();
		return memberCount;
	}

	public String getCount() {
		String Count = dao.getcount();
		return Count;
	}

	public void countup(String board_no) {

		dao.setAddReadCount(board_no); // 글 조회수 1증가
	}

	// 댓글 수정하기
	@Override
	public int getcommentselectone(HashMap<String, String> map) {
		int n = dao.getcommentselectone(map);
		return n;
	}

	// 스터디룸 가져오기
	@Override
	public List<HashMap<String, String>> getStudyroom() {
		List<HashMap<String, String>> studyroommap = dao.getStudyroom();
		return studyroommap;
	}

	// 서치룸 마커 가져오기
	@Override
	public List<HashMap<String, String>> searchmarkerList(HashMap<String, String> map) {
		List<HashMap<String, String>> list = dao.searchmarkerList(map);
		return list;
	}

}
