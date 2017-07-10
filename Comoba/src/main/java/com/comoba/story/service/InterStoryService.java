package com.comoba.story.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.comoba.ourroom.model.CommentVO;

//Service 단 인터페이스 선언
public interface InterStoryService {

//	List<String> getImgfilenameList(); // 메인이미지 
	

	// ===== #57. 글쓰기를 해주는 int add(BoardVO boardvo) 메소드 생성하기 =====
	// 글쓰기(파일첨부가 없는 글쓰기)
	
	int storywrite(HashMap<String, String> mapStory) throws Throwable;

	//===== #138. 첨부파일이 있는 경우의 글쓰기 =====
	// 파일첨부가 있는 글쓰기
	
	int storywrite_addFile(HashMap<String, String> mapStory_fileList); 
	
	int getStory_no();  // 스토리글 다음번호 따오기
	
	/*// 스토리 리스트 보여주기
	List<HashMap<String, String>> getListStory();*/
	List<HashMap<String, String>> getListStory(HashMap<String, String> searchmap);
	
	// 좋아요 리스트 보여주기
	List<HashMap<String, String>> getListLike();
	
	// 공스토리 상세 페이지
	HashMap<String, String> getstoryDetail(String story_no);
	
	// 공스토리 상세 페이지(조회수 1증가)
	HashMap<String, String> getstoryDetailcount(String story_no);
	
	// 공스토리 상세 페이지
	List<HashMap<String, String>> getstoryDetailImage(String story_no);
	/*
	// 좋아요 눌렀쪙!!
	int likeUp(HashMap<String, String> mapLike); 
	
	// 좋아요 없앴쪙!!	
	int likeDown(HashMap<String, String> mapLike);
	*/
	
	// 좋아요 불들어오기
	String getlikeon(HashMap<String, String> map);
	
	// 멤버 테이블의 좋아요 상승
	String getlikeUp(HashMap<String, String> map);
	
	// 좋아요 불꺼지기
	String getlikeoff(HashMap<String, String> map);
	
	// 멤버 테이블의 좋아요 하락
	String getlikeDown(HashMap<String, String> map);
	
	// 좋아요 개수 가져오기
	int getLikeNumber(HashMap<String, String> map);  
	
	// 첨부파일 없는 글수정
	int storyedit(HashMap<String, String> mapEdit);
	
	// 첨부파일 있는 글수정
	int storydelete_addFile(HashMap<String, String> mapEdit); 
	
	int storyedit_addFile(HashMap<String, String> mapEdit_fileList);

	// 글 삭제
	int storydelete(String story_no);
	
	// 댓글쓰기
	int addComment(CommentVO commentvo) throws Throwable;
	
	// 댓글 내용 가져오기
	List<CommentVO> listcomment(String story_no, RowBounds rowbounds); 
	
	// 총 댓글 수 구하기
	int getTotalCount(String story_no);
	
	// 댓글 닉네임 가져오기
	List<String> getnickname(List<CommentVO> commentList);  	
	
	// 글게시물에 대한 멤버넘버 가져오기
	int getmemberno(String story_no);
	
}
