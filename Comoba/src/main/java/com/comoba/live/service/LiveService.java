package com.comoba.live.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.comoba.live.model.LiveDAO;
import com.comoba.main.model.MemberVO;
import com.comoba.ourroom.model.CommentVO;

//===== #30. Service 선언 =====
@Service
public class LiveService implements InterLiveService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private LiveDAO dao;

	// 라이브 작성전 시퀀스번호 가져오기
	@Override
	public String getSequenceno() {
		String nextval = dao.getSequenceno();
		
		return nextval;
	}
	
	// 라이브 작성하기
	@Override
	public int writeLive(HashMap<String, String> mapLive) {
		
		int n = dao.writeLive(mapLive);
		
		return n;
	}
	
	// 라이브 수정하기
	@Override
	public int editLive(HashMap<String, String> editmap) {
		int n = dao.editLive(editmap);
		return n;
	}
	
	
	// 라이브 삭제하기
	@Override
	public int deleteLive(String delliveno) {
		int n = dao.deleteLive(delliveno);
		return n;
	}


	// 라이브 대표이미지 저장하기
	@Override
	public int addLivetitleimg(HashMap<String, String> livetitleimg) {
		
		int n = dao.addLivetitleimg(livetitleimg);
		
		return n;
		
	}
	
	// 라이브 대표이미지 수정하기
	@Override
	public int editLivetitleimg(HashMap<String, String> livetitleimg) {
		int n = dao.editLivetitleimg(livetitleimg);
		return n;
	}

	// 라이브 첨부파일 저장
	@Override
	public int addLiveimg(HashMap<String, String> liveimage) {

		int n = dao.addLiveimg(liveimage);
		
		return n;
	}

	// 회원번호에 해당하는 회원의 라이브 가져오기
	@Override
	public List<HashMap<String, String>> getLivelist(String memberno) {

		List<HashMap<String, String>> livelist = dao.getLivelist(memberno);
		return livelist;
	}

	
	// 라이브 방송내역 테이블 작성(온에어)
	@Override
	public int onairLive(HashMap<String, String> maponair) {

		int n = dao.onairLive(maponair);
		return n;
	}

	// 생방송 중인 공라이브 가져오기 
	@Override
	public List<HashMap<String, String>> getOnairlist() {
		
		List<HashMap<String, String>> onairlist = dao.getOnairlist();
		return onairlist;
	}
	
	// 라이브 번호에 해당하는 라이브 상세 페이지 가져오기
	@Override
	public HashMap<String, String> getLivedetail(String live_no) {

		dao.setAddGongliveviews(live_no);
		HashMap<String, String> livedetail = dao.getLivedetail(live_no);
		return livedetail;
	}

	
	// 라이브 번호에 해당하는 라이브 상세 페이지 가져오기(조회수 증가 없이)
	@Override
	public HashMap<String, String> getLivedetailWithnoAdd(String live_no) {
		HashMap<String, String> livedetail = dao.getLivedetail(live_no);
		return livedetail;
	}

	
	// 라이브 방송 횟수 가져오기
	@Override
	public int getOnaircnt(String live_no) {
		
		int onaircnt = dao.getOnaircnt(live_no);
		return onaircnt;
	}

	// 라이브 방송 시청횟수 올리기
	@Override
	public void addLiveviewcnt(String onairno) {
		dao.addLiveviewcnt(onairno);		
	
	}

	// 첨부파일 가져오기
	@Override
	public List<HashMap<String, String>> getaddfile(String live_no) {
		List<HashMap<String, String>> filelist = dao.getaddfile(live_no); // 첨부파일 가져오기
		return filelist;
	}

	// 별점 주기
	@Override
	public void givestars(HashMap<String, String> starmap) {
		dao.givestars(starmap);
		
	}

	// 별점 가져오기
	@Override
	public double getStars(String live_no) {
		double stars = dao.getStars(live_no);
		return stars;
	}

	// 로그인유저가 별점을 줬는지 안줬는지 검사
	@Override
	public int checkstar(HashMap<String, String> checkmap) {
		int checkstar = dao.checkstar(checkmap);
		return checkstar;
	}

	

	//팔로워 수  구하기
	@Override
	public HashMap<String, Object> followCnt(int memberno) {
		 int followcnt = dao.followCnt(memberno);
		 int followingcnt = dao.followingcnt(memberno);
		 
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("followcnt", Integer.toString(followcnt));
		 map.put("followingcnt", Integer.toString(followingcnt));
		return map;
	}

	
	////내가 팔로우 한 사람 번호 뽑아서 정보까지 뽑기
	@Override
	public List<MemberVO> followInfo(int memberno) {
		List<Integer> followList = dao.followList(memberno);
		//팔로우 한 사람들의 번호 리스트로 뽑기
		List<MemberVO> followInfo = dao.followInfo(followList);
		// 팔로우 한 사람들의 번호 리스트를 받아서 정보를 뽑기
		return followInfo;
	}
	
////날 팔로우 한 사람 번호 뽑아서 정보까지 뽑기
	@Override
	public List<MemberVO> followingInfo(int memberno) {
		
		List<MemberVO> followingInfo = dao.followingInfo(memberno);
	////날 팔로우 한 사람 번호 뽑아서 정보까지 뽑기
		return followingInfo;
	}
	
	// 스토리 리스트 보여주기
	@Override
	public List<HashMap<String, String>> myStoryList(int memberno) {
		
		List<HashMap<String, String>> storyList = dao.myStoryList(memberno);
		
		return storyList;
	}
	
	// 스토리 리스트 보여주기(비밀글)
	@Override
	public List<HashMap<String, String>> mysecretStoryList(int memberno) {
		
		List<HashMap<String, String>> storyList = dao.mysecretStoryList(memberno);
		
		return storyList;
	}

	// 회원번호에 해당하는 라이브 갯수가져오기
	@Override
	public int getLivecnt(String memberno) {
		int livecnt = dao.getLivecnt(memberno);
		return livecnt;
	}

	// 별점 업데이트하기
	@Override
	public void updateStarpoint(HashMap<String, Object> updatestarmap) {
		dao.updateStarpoint(updatestarmap);
		
	}
	
	// ===== 댓글쓰기 =====
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int liveaddComment(CommentVO commentvo) throws Throwable {
		
		int n = dao.liveaddComment(commentvo);
		return n;
	}

	// ===== #90. 댓글내용 보여주기 =====
	
	@Override
	public List<CommentVO> getliveComment(String board_no) {
		List<CommentVO> list = dao.getliveComment(board_no);
		return list;
	}

	// 댓글 갯수 가져오기
	@Override
	public int getcommentCnt(String live_no) {
		int n = dao.getcommentCnt(live_no);
		return n;
	}


	
	
}
