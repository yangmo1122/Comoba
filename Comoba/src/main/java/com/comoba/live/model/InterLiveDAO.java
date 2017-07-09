package com.comoba.live.model;

import java.util.HashMap;
import java.util.List;

import com.comoba.main.model.MemberVO;
import com.comoba.ourroom.model.CommentVO;

//model단(DAO)의 인터페이스 생성
public interface InterLiveDAO {

	String getSequenceno(); // 라이브 작성전 시퀀스번호 가져오기
	
	int writeLive(HashMap<String, String> mapLive); // 라이브작성
	
	int editLive(HashMap<String, String> editmap); // 라이브 수정
	
	int deleteLive(String delliveno); // 라이브 삭제하기
	
	int addLivetitleimg(HashMap<String, String> livetitleimg); // 라이브 대표이미지 저장하기
	
	int editLivetitleimg(HashMap<String, String> livetitleimg); // 라이브 대표이미지 수정하기
	
	int addLiveimg(HashMap<String, String> liveimage); // 라이브 첨부파일 저장
	
	List<HashMap<String, String>> getLivelist(String memberno); // 회원번호에 해당하는 회원의 라이브 가져오기
	
	int onairLive(HashMap<String, String> maponair); // 라이브 방송내역 테이블 작성(온에어)
	
	void setAddGongliveviews(String live_no); // 글 조회수 1증가
	
	List<HashMap<String, String>> getOnairlist(); // 생방송 중인 공라이브 가져오기
	
	HashMap<String, String> getLivedetail(String live_no); // 라이브 번호에 해당하는 라이브 상세 페이지 가져오기
	
	int getOnaircnt(String live_no); // 라이브 방송 횟수 가져오기
	
	void addLiveviewcnt(String onairno); // 라이브 방송 시청횟수 올리기
	
	List<HashMap<String, String>> getaddfile(String live_no); // 첨부파일 가져오기
	
	void givestars(HashMap<String, String> starmap); // 별점 주기
	
	double getStars(String live_no); // 별점 가져오기
	
	void updateStarpoint(HashMap<String, Object> updatestarmap); // 별점 업데이트하기
	
	int checkstar(HashMap<String, String> checkmap); // 로그인유저가 별점을 줬는지 안줬는지 검사
	
	int getLivecnt(String memberno); // 회원번호에 해당하는 라이브 갯수가져오기
	
	int liveaddComment(CommentVO commentvo); // 댓글쓰기

	List<CommentVO> getliveComment(String board_no); // 댓글내용 보여주기
	
	int getcommentCnt(String live_no);	// 댓글 갯수 가져오기
	
	//양모 시작
	int followCnt(int memberno);	//내가 팔로우 한 사람
	int followingcnt(int memberno);		// 날 팔로우
	
	List<Integer> followList(int memberno);		//내가 팔로우 한 사람 번호 뽑기
	List<MemberVO> followInfo(List<Integer> followList);	//위 번호들을 받아와서 정보 뽑기
	
	List<MemberVO> followingInfo(int memberno);		//날 팔로우 하는 사람 번호 뽑기
	//List<MemberVO> followingInfo(List<Integer> followingList);		//위 번호들을 받아와서 정보 뽑기
	
	List<HashMap<String, String>> myStoryList(int memberno); // 글 뽑기
	//양모거 끝
}
