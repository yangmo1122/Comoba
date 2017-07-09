package com.comoba.main.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.comoba.main.model.MainDAO;
import com.comoba.main.model.MemberVO;

//===== #30. Service 선언 =====
@Service
public class MainService implements InterMainService {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private MainDAO dao;

	// ==== 로그인 여부 알아오기 =====
	@Override
	public int loginEnd(HashMap<String, String> map) {
		int n = dao.loginEnd(map);
		return n;
	}

	// ==== 로그인 성공한 사용자 정보 가져오기 =====
	@Override
	public MemberVO getLoginMember(String email) {
		MemberVO loginUser = dao.getLoginMember(email);
		return loginUser;
	}

	// ==== 회원가입 =====
	@Override
	public int memberInsert(HashMap<String, String> map) {
		int n = dao.memberInsert(map);
		return n;
	}

	// ==== 회원가입2=====
	@Override
	public int Insertwithphoto(HashMap<String, String> map) {
		int n = dao.Insertwithphoto(map);
		return n;
	}

	// ==== 회원번호 가져오기=====
	@Override
	public int getmemberno(int memberno) {
		int n = dao.getmemberno(memberno);
		return n;
	}
	
	// ==== 회원가입 이미지 포함 =====
	@Override
	public int Insert_withFile(HashMap<String, String> map) {
		int n = dao.Insert_withFile(map);
		//System.out.println("확인용n"+n);
		return n;
	}

	// ===== 메인 페이지 오늘의 게시글=====
	@Override
	public List<HashMap<String, String>> getTodayList() {
		List<HashMap<String, String>> todayList = dao.getTodayList();
		//System.out.println("확인용1"+todayList);
		return todayList;
	}
	
	// ===== 메인 페이지 오늘의 자극글=====
	@Override
	public List<HashMap<String, String>> getMotivateList() {
		List<HashMap<String, String>> motivateList = dao.getMotivateList();
		//System.out.println("확인용2"+motivateList);
		return motivateList;
	}

	// ===== 메인 페이지 오늘의 게시글 갯수 =====
	@Override
	public List<HashMap<String, String>> gettodayno() {
		List<HashMap<String, String>> todayno = dao.gettodayno();
		return todayno;
	}
	
	// ===== 메인 페이지 오늘의 자극글 갯수 =====
	@Override
	public List<HashMap<String, String>> getmotiveno() {
		List<HashMap<String, String>> motiveno = dao.getmotiveno();
		return motiveno;
	}	
	
	// ===== 회원정보수정 =====
	@Override
	public int edituser(HashMap<String, String> map) {
		int n = dao.edituser(map);
		//System.out.println("확인용serv1"+n);
		return n;
	}

	// ===== 회원정보수정2 =====
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	public int edit_withFile(HashMap<String, String> map) {
		int n = dao.edituser(map);
		//System.out.println("확인용serv2"+n);
		int m = dao.edit_withFile(map);
		//System.out.println("확인용serv2"+m);
		return n * m;
	}

	// ==== 암호받기 ====
	@Override
	public int getUser(String email) {
		int n = dao.getUser(email);
		return n;
	}

	// ==== 회원이미지 받기 ====
	@Override
	public String getuserimage(String memberno) {
		String thumbnailfilename = dao.getuserimage(memberno);
		//System.out.println("확인용daouserimage"+thumbnailfilename);
		return thumbnailfilename;
	}
	
	// 회원정보 가져오기
	@Override
	public MemberVO getMemberinfo(String memberno) {
		
		MemberVO membervo = dao.getMemberinfo(memberno);
		return membervo;
	}

	// 비밀번호 수정
	@Override
	public int changepwd(HashMap<String, String> map) {
		int n = dao.changepwd(map);
		return n;
	}

	// ===== 나의 d-day 현황 ====
	@Override
	public String getremaindate(HashMap<String, String> map) {
		String remaindate = dao.getremaindate(map);
		//System.out.println("확인용remaindate"+remaindate);
		return remaindate;
	}
	
	// 날짜 받아오기
	@Override
	public int getdate(HashMap<String, String> map) {
		 int date = dao.getdate(map);
		 //System.out.println("확인용2date"+date);
		return date;
	}

	// DDAY를 정한 날짜로 부터 DDAY까지의 일수 중 출석한 날짜의 총
	@Override
	public int checkattandce(HashMap<String, String> map) {
		int n = dao.checkattandce(map);
		//System.out.println("확인용2n"+n);
		return n;
	}

	// dday_no_fk를 불러오기
	@Override
	public int getdday_no_fk(HashMap<String, String> map) {
		int dday_no_fk = dao.getdday_no_fk(map);
		//System.out.println("확인용2dday_no_fk"+dday_no_fk);
		return dday_no_fk;
	}

	// 오늘의 출첵
	@Override
	public int dailyattance(HashMap<String, String> map) {
		int n = dao.dailyattance(map);
		return n;
	}

	// 오늘의 출첵가져오기
	@Override
	public int getMaxattand(HashMap<String, String> map){
		int attandedno = dao.getMaxattand(map);
		return attandedno;
	}
	
	// memberno_fk 불러오기
	@Override
	public String getmemberno_fk(HashMap<String, String> map) {
		String memberno_fk = dao.getmemberno_fk(map);
		return memberno_fk;
	}
	
	// 미션성공율
	@Override
	public int getmissionrate(HashMap<String, String> map) {
		int missionrate = dao.getmissionrate(map);
		return missionrate;
	}

	// 출석율 랭킹
	@Override
	public List<HashMap<String, String>> getattandanceList(HashMap<String, String> map) {
		List<HashMap<String, String>> attandanceList = dao.getattandanceList(map);
		//System.out.println("확인용2"+attandanceList);
		return attandanceList;
	}
	
	// 미션 달성율 랭킹
	@Override
	public List<HashMap<String, String>> getmissionrateList(HashMap<String, String> map) {
		List<HashMap<String, String>> missionrateList = dao.getmissionrateList(map);
		System.out.println("확인용2"+missionrateList);
		return missionrateList;
	}

	// 스탑워치 시간 더하기
	@Override
	public int addCount(HashMap<String, Object> map) {
		int n = dao.addCount(map);
		return n;
	}

	// 팔로우하기
	@Override
	public void following(HashMap<String, String> followmap) {
		dao.following(followmap);

	}

	// 팔로우 검사하기
	@Override
	public int checkfollowing(HashMap<String, String> followmap) {
		int checkfollow = dao.checkfollowing(followmap);
		return checkfollow;
	}

	// 팔로우 취소하기
	@Override
	public void unfollowing(HashMap<String, String> followmap) {
		dao.unfollowing(followmap);
	}

}
