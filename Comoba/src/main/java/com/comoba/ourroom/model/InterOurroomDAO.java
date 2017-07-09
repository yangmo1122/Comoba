package com.comoba.ourroom.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

//model단(DAO)의 인터페이스 생성
public interface InterOurroomDAO {

	String getSequenceno(); //파일첨부

	int getGroupMaxno();

	int getTotalCount(HashMap<String, String> map);

	List<BoardVO> boardList(HashMap<String, String> map, RowBounds rowbounds);

	int add(BoardVO boardvo);// 글쓰기(파일첨부가 없는 글쓰기)
	int add_withFile(BoardVO boardvo);	// 첨부파일이 있는 경우의 글쓰기
	
	/*
	void setAddReadCount(String board_no);// 글 조회수 1증가
	BoardVO getView(String board_no);   // 글 1개를 보여주는것
*/
	int updateContent(HashMap<String, String> map); // 글수정
	
	int del(HashMap<String, String> map); // 글삭제
	
	
	int addComment(CommentVO commentvo); // 댓글쓰기

	List<CommentVO> listComment(String board_no); // 댓글내용 보여주기

	List<String> getnickname(List<CommentVO> commentList);  	// commetList meberno_fk 를 가지고 닉네임 가져오기

	List<QnaVO> qnaList(); //qna

	List<QnaVO> Qnalive();
	
	List<QnaVO> Qnaourroom();
	
	List<QnaVO> Qnastory();

	int commentdel(HashMap<String, String> map); //댓글삭제하기 

	int commentedit(HashMap<String, String> map); // 댓글수정하기 

	int qnasearch(HashMap<String, String> map); // qna 검색
	
	int getmemberCount();// 멤버수 가져오기

	void setAddReadCount(String rno);

	BoardVO getView(String rno);
	
	int getcommentselectone(HashMap<String, String> map); //댓글수정
}
