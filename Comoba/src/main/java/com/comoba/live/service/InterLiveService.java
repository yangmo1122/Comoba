package com.comoba.live.service;

import java.util.HashMap;
import java.util.List;

import com.comoba.main.model.MemberVO;
import com.comoba.ourroom.model.CommentVO;

//Service 단 인터페이스 선언
public interface InterLiveService {
	
	String getSequenceno();	// 라이브 작성전 시퀀스번호 가져오기
	
	int writeLive(HashMap<String, String> mapLive); // 라이브 작성
	
	int editLive(HashMap<String, String> editmap); // 라이브 수정
	
	int deleteLive(String delliveno); // 라이브 삭제하기
	
	int addLivetitleimg(HashMap<String, String> livetitleimg); // 라이브 대표이미지 저장
	
	int editLivetitleimg(HashMap<String, String> livetitleimg); // 대표 이미지 수정하기
	
	int addLiveimg(HashMap<String, String> liveimage); // 라이브 첨부파일 저장
	
	List<HashMap<String, String>> getLivelist(String memeberno); // 회원번호에 해당하는 회원의 라이브 가져오기
	
	int onairLive(HashMap<String, String> maponair); // 라이브 방송내역 테이블 작성(온에어)
	
	List<HashMap<String, String>> getOnairlist(); // 생방송 중인 공라이브 가져오기 
	
	HashMap<String, String> getLivedetail(String live_no); // 라이브 번호에 해당하는 라이브 상세 페이지 가져오기(조회수 1증가)
	
	HashMap<String, String> getLivedetailWithnoAdd(String live_no); // 라이브 번호에 해당하는 라이브 상세 페이지 가져오기(조회수 1증가 없이)
	
	int getOnaircnt(String live_no); // 라이브 방송 횟수 가져오기
	
	void addLiveviewcnt(String onairno); // 라이브 방송 시청횟수 올리기
	
	List<HashMap<String, String>> getaddfile(String live_no); // 첨부파일 가져오기
	
	void givestars(HashMap<String, String> starmap); // 별점 주기
	
	double getStars(String live_no); // 별점 가져오기
	
	int checkstar(HashMap<String, String> checkmap); // 로그인유저가 별점을 줬는지 안줬는지 검사
	
	void updateStarpoint(HashMap<String, Object> updatestarmap); // 별점 업데이트하기
	
	int getLivecnt(String memberno); // 회원번호에 해당하는 라이브 갯수가져오기
	
	int liveaddComment(CommentVO commentvo) throws Throwable; // 댓글쓰기

	List<CommentVO> getliveComment(String board_no); // 댓글내용 보여주기
	
	int getcommentCnt(String live_no);	// 댓글 갯수 가져오기
	
	
	//양모 내방 작성
	HashMap<String, Object> followCnt(int memberno);   // 팔로우, 팔로워 수 가져오기
	
	List<MemberVO> followInfo(int memberno);  // 내가 팔로우 한 사람 정보 가져오기
	
	List<MemberVO> followingInfo(int memberno);   // 날 팔로우 한 사람 정보 가져오기
	
	List<HashMap<String, String>> myStoryList(int memberno); // 글 뽑기
	//양모 내방 작성 끝 -------------------------------------------------------
}
