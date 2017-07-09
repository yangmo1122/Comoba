package com.comoba.live.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.comoba.main.model.MemberVO;
import com.comoba.ourroom.model.CommentVO;


//===== #28. DAO 선언 =====
@Repository
public class LiveDAO implements InterLiveDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 라이브 작성 전 시퀀스번호 가져오기
	@Override
	public String getSequenceno() {
		String nextval = String.valueOf(sqlsession.selectOne("main.getSequenceno"));
		
		return nextval;
	}

	// 라이브 작성하기
	@Override
	public int writeLive(HashMap<String, String> mapLive) {
		
		int n = sqlsession.insert("main.writeLive", mapLive);
		
		return n;
	}

	// 라이브 수정하기
	@Override
	public int editLive(HashMap<String, String> editmap) {
		int n = sqlsession.update("main.editLive", editmap);
		return n;
	}
	
	// 라이브 삭제하기
	@Override
	public int deleteLive(String delliveno) {
		int n = sqlsession.delete("main.deleteLive", delliveno);
		return n;
	}

	// 라이브 대표이미지 저장하기
	@Override
	public int addLivetitleimg(HashMap<String, String> livetitleimg) {

		int n = sqlsession.insert("main.addLivetitleimg", livetitleimg);
		
		return n;
	}
	
	// 라이브 대표이미지 수정하기
	@Override
	public int editLivetitleimg(HashMap<String, String> livetitleimg) {
		int n = sqlsession.update("main.editLivetitleimg", livetitleimg);
		return n;
	}

	// 라이브 첨부파일 저장
	@Override
	public int addLiveimg(HashMap<String, String> liveimage) {
		int n = sqlsession.insert("main.addLiveimg", liveimage);
		return n;
	}

	// 회원번호에 해당하는 회원의 라이브 가져오기
	@Override
	public List<HashMap<String, String>> getLivelist(String memberno) {
		
		List<HashMap<String, String>> livelist = sqlsession.selectList("main.getLivelist", memberno);
		return livelist;
	}

	// 라이브 방송내역 테이블 작성(온에어)
	@Override
	public int onairLive(HashMap<String, String> maponair) {
		
		int n = sqlsession.insert("main.onairList", maponair);
		return n;
	}

	
	// 생방송 중인 공라이브 가져오기
	@Override
	public List<HashMap<String, String>> getOnairlist() {

		List<HashMap<String, String>> onairlist = sqlsession.selectList("main.getOnairlist");
		return onairlist;
	}

	// 라이브 번호에 해당하는 라이브 상세 페이지 가져오기
	@Override
	public HashMap<String, String> getLivedetail(String live_no) {
		
		HashMap<String, String> livedetail = sqlsession.selectOne("main.getLivedetail", live_no);
		return livedetail;
	}

	// 라이브 방송 횟수 가져오기
	@Override
	public int getOnaircnt(String live_no) {
		int onaircnt = sqlsession.selectOne("main.getOnaircnt", live_no);
		return onaircnt;
	}

	// 글 조회수 1증가
	@Override
	public void setAddGongliveviews(String live_no) {
		sqlsession.update("main.setAddGongliveviews", live_no);
		
	}

	// 라이브 방송 시청횟수 올리기
	@Override
	public void addLiveviewcnt(String onairno) {
		sqlsession.update("main.addLiveviewcnt", onairno);
		
	}

	// 첨부파일 가져오기
	@Override
	public List<HashMap<String, String>> getaddfile(String live_no) {
		List<HashMap<String, String>> filelist = sqlsession.selectList("main.getaddfile", live_no); // 첨부파일 가져오기
		return filelist;
	}

	// 별점 주기
	@Override
	public void givestars(HashMap<String, String> starmap) {
		sqlsession.insert("main.givestars", starmap);
		
	}

	// 별점 가져오기
	@Override
	public double getStars(String live_no) {
		double stars = sqlsession.selectOne("main.getStars", live_no);
		return stars;
	}

	// 로그인유저가 별점을 줬는지 안줬는지 검사
	@Override
	public int checkstar(HashMap<String, String> checkmap) {
		int checkstar = sqlsession.selectOne("main.checkstar", checkmap);
		return checkstar;
	}

	

	@Override
	public int followCnt(int memberno) {
			int cnt = sqlsession.selectOne("myroom.followCnt", memberno);
		return cnt;
	}

	@Override
	public int followingcnt(int memberno) {
		int cnt = sqlsession.selectOne("myroom.followingcnt", memberno);
		return cnt;
	}

	
	//내가 팔로우 한 사람 번호 뽑기
	@Override
	public List<Integer> followList(int memberno) {
	
		List<Integer> followList = sqlsession.selectList("myroom.followList", memberno);
				
		return followList;
	}

	//내가 팔로우 한 사람 번호로 정보 뽑기
	@Override
	public List<MemberVO> followInfo(List<Integer> followList) {
		List<MemberVO> followInfo = new ArrayList<MemberVO>();
		
		for(int followno : followList){
		MemberVO info = sqlsession.selectOne("myroom.followInfo", followno);
	
		followInfo.add(info);
		}
		return followInfo;
	}

	//날 팔로우 한 사람 번호 뽑아서 정보뽑기
	@Override
	public List<MemberVO> followingInfo(int memberno) {
		List<Integer> followingList = sqlsession.selectList("myroom.followingList", memberno);
				//번호 리스트 뽑기
		
		
		List<MemberVO> followingInfo = new ArrayList<MemberVO>();
		
		for(int followingno : followingList){
		MemberVO info = sqlsession.selectOne("myroom.followingInfo", followingno);
		// 번호 리스트로 정보 뽑기
		System.out.println("날 팔로우하는애들");
		followingInfo.add(info);
		}
		
		
		
		return followingInfo;
	}

	// 스토리 리스트 보여주기
	@Override
	public List<HashMap<String, String>> myStoryList(int memberno) {
		List<HashMap<String, String>> storyList = sqlsession.selectList("myroom.myStoryList", memberno);
		return storyList;
	}
	
	// 회원번호에 해당하는 라이브 갯수가져오기
	@Override
	public int getLivecnt(String memberno) {
		int livecnt = sqlsession.selectOne("main.getLivecnt", memberno);
		return livecnt;
	}
	// 별점 업데이트하기
	@Override
	public void updateStarpoint(HashMap<String, Object> updatestarmap) {
		sqlsession.update("main.updateStarpoint", updatestarmap);
		
	}

	
	// ===== 댓글쓰기 =====
	@Override
	public int liveaddComment(CommentVO commentvo) {
		int n = sqlsession.insert("main.liveaddComment", commentvo);
		return n;
	}


	// ====== 댓글내용 보여주기 ======
	@Override
	public List<CommentVO> getliveComment(String parentSeq) {
		List<CommentVO> list = sqlsession.selectList("main.getliveComment", parentSeq);
		return list;
	}

	// 댓글 갯수 가져오기
	@Override
	public int getcommentCnt(String live_no) {
		int commentcnt = sqlsession.selectOne("main.getcommentCnt", live_no);
		return commentcnt;
	}
	
	


}
