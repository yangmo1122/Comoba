package com.comoba.ourroom.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.comoba.ourroom.model.BoardVO;
import com.comoba.ourroom.model.CommentVO;
import com.comoba.ourroom.model.QnaVO;

public interface InterOurroomService {

	String getSequenceno();
	
	int add_withFile(BoardVO boardvo); // 파일첨부가 있는 글쓰기

	
	int getTotalCount(HashMap<String, String> map); // 총 게시물 건수 구하기
	
	List<BoardVO> boardList(HashMap<String, String> map, RowBounds rowbounds);
	// 글목록 보여주기(검색어가 없는 전체글목록 보여주기)
	
	int add(BoardVO boardvo); // 글쓰기(파일첨부가 없는 글쓰기)

/*
	BoardVO getView(String board_no);// 1개 글 보여주기(먼저 글조회수 1증가 한후)


	BoardVO getViewWithNoAddCount(String board_no); // 1개 글 보여주기(글조회수 1증가 없이)
*/

	int edit(HashMap<String, String> map); // 1개 글 수정하기
	
	
	int del(HashMap<String, String> map); //글삭제

	
	int addComment(CommentVO commentvo) throws Throwable; // 댓글쓰기

	
	List<CommentVO> listComment(String board_no); // 댓글내용 보여주기
	
	List<String> getnickname(List<CommentVO> commentList);  	// commetList meberno_fk 를 가지고 닉네임 가져오기

	List<QnaVO> Qnaourroom();
	
	List<QnaVO> Qnalive();
	
	List<QnaVO> Qnastory();

	int commentdel(HashMap<String, String> map); //댓글삭제하기
	
	int commentedit(HashMap<String, String> map); //댓글 수정하기 

	int qnasearch(HashMap<String, String> map); // qna 검색

	int getmemberCount();// 멤버수 가져오기

	BoardVO getViewWithNoAddCount(String rno);

	BoardVO getView(String rno); 
	
	int getcommentselectone(HashMap<String, String> map); //댓글수정
	
}
