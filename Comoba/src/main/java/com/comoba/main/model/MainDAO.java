package com.comoba.main.model;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//===== #28. DAO 선언 =====
@Repository
public class MainDAO implements InterMainDAO {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// ==== 로그인 여부 알아오기 =====
	@Override
	public int loginEnd(HashMap<String, String> map) {
		int n = sqlsession.selectOne("main.loginEnd", map);
		return n;
	}

	// ==== 로그인 성공한 사용자 정보 가져오기 =====
	@Override
	public MemberVO getLoginMember(String email) {
		MemberVO loginUser = sqlsession.selectOne("main.getLoginMember", email);
		return loginUser;
	}

	// ==== 회원가입 w/o photo=====
	@Override
	public int memberInsert(HashMap<String, String> map) {
		int n = sqlsession.insert("main.memberInsert", map);
		return n;
	}

	// ==== 회원가입2=====
	@Override
	public int Insertwithphoto(HashMap<String, String> map) {
		int n = sqlsession.insert("main.Insertwithphoto", map);
		// System.out.println("확인용daon"+n);
		return n;
	}

	// ==== 회원번호 가져오기 =====
	@Override
	public int getmemberno(int memberno) {
		int n = sqlsession.selectOne("main.getmemberno", memberno);
		return n;
	}

	// ==== 회원가입 이미지 포함 =====
	@Override
	public int Insert_withFile(HashMap<String, String> map) {
		int n = sqlsession.insert("main.Insert_withFile", map);
		// System.out.println("확인용daom"+n);
		return n;
	}

	// ===== 메인 페이지 오늘의 게시글=====
	@Override
	public List<HashMap<String, String>> getTodayList() {
		List<HashMap<String, String>> todayList = sqlsession.selectList("main.getTodayList");
		return todayList;
	}

	// ===== 메인 페이지 오늘의 자극글갯수=====
	@Override
	public List<HashMap<String, String>> gettodayno() {
		List<HashMap<String, String>> todayno = sqlsession.selectList("main.gettodayno");
		return todayno;
	}

	// ===== 메인 페이지 자극글 =====
	@Override
	public List<HashMap<String, String>> getMotivateList() {
		List<HashMap<String, String>> motivateList = sqlsession.selectList("main.getMotivateList");
		return motivateList;
	}

	// ===== 메인 페이지 오늘의 자극글 갯수 =====
	@Override
	public List<HashMap<String, String>> getmotiveno() {
		List<HashMap<String, String>> motiveno = sqlsession.selectList("main.getmotiveno");
		return motiveno;
	}

	// ===== 회원정보수정 =====
	@Override
	public int edituser(HashMap<String, String> map) {
		int n = sqlsession.update("main.edituser", map);
		// System.out.println("확인용dao1n"+n);
		return n;
	}

	// ===== 회원정보수정2 =====
	@Override
	public int edit_withFile(HashMap<String, String> map) {
		int n = sqlsession.update("main.edit_withFile", map);
		// System.out.println("확인용dao2n"+n);
		return n;
	}

	// ==== 암호받기 ====
	@Override
	public int getUser(String email) {
		int n = sqlsession.selectOne("main.getUser", email);
		return n;
	}

	// 회원이미지 가져오기
	@Override
	public String getuserimage(String memberno) {
		String thumbnailfilename = sqlsession.selectOne("main.getuserimage", memberno);
		return thumbnailfilename;
	}

	// 회원정보 가져오기
	@Override
	public MemberVO getMemberinfo(String memberno) {
		MemberVO membervo = sqlsession.selectOne("main.getMemberinfo", memberno);
		return membervo;
	}

	// 비밀번호 수정
	@Override
	public int changepwd(HashMap<String, String> map) {
		int n = sqlsession.update("main.changepwd", map);
		return n;
	}

	// ===== 나의 d-day 현황 ====
	@Override
	public String getremaindate(HashMap<String, String> map) {
		String remaindate = sqlsession.selectOne("main.getremaindate", map);
		// System.out.println("확인용remaindate"+remaindate);
		return remaindate;
	}

	// 날짜 받아오기
	@Override
	public int getdate(HashMap<String, String> map) {
		int date = sqlsession.selectOne("main.getdate", map);
		// System.out.println("확인용1date"+date);
		return date;
	}

	// DDAY를 정한 날짜로 부터 DDAY까지의 일수 중 출석한 날짜의 총
	@Override
	public int checkattandce(HashMap<String, String> map) {
		int n = sqlsession.selectOne("main.checkattandce", map);
		// System.out.println("확인용1n"+n);
		return n;
	}

	// dday_no_fk를 불러오기
	@Override
	public int getdday_no_fk(HashMap<String, String> map) {
		int dday_no_fk = sqlsession.selectOne("main.getdday_no_fk", map);
		// System.out.println("확인용1dday_no_fk"+dday_no_fk);
		return dday_no_fk;
	}

	// 오늘의 출첵
	@Override
	public int dailyattance(HashMap<String, String> map) {
		int n = sqlsession.insert("main.dailyattance", map);
		return n;
	}

	// 미션성공율 출첵
	@Override
	public String getmemberno_fk(HashMap<String, String> map) {
		String memberno_fk = sqlsession.selectOne("main.getmemberno_fk", map);
		return memberno_fk;
	}

	// 미션성공율
	@Override
	public int getmissionrate(HashMap<String, String> map) {
		int missionrate = sqlsession.selectOne("main.getmissionrate", map);
		return missionrate;
	}

	// 오늘의 출첵 가져오기
	@Override
	public int getMaxattand(HashMap<String, String> map) {
		int attandedno = sqlsession.selectOne("main.getMaxattand", map);
		return attandedno;
	}

	// 출석율 랭킹
	@Override
	public List<HashMap<String, String>> getattandanceList(HashMap<String, String> map) {
		List<HashMap<String, String>> attandanceList = sqlsession.selectList("main.getattandanceList", map);
		// System.out.println("확인용1"+attandanceList);
		return attandanceList;
	}

	// 미션 달성율 랭킹
	@Override
	public List<HashMap<String, String>> getmissionrateList(HashMap<String, String> map) {
		List<HashMap<String, String>> missionrateList = sqlsession.selectList("main.getmissionrateList", map);
		System.out.println("확인용1" + missionrateList);
		return missionrateList;
	}

	// 스탑워치 시간 더하기
	@Override
	public int addCount(HashMap<String, Object> map) {
		int n = sqlsession.update("main.addCount", map);
		return n;
	}

	// 팔로우 하기
	@Override
	public void following(HashMap<String, String> followmap) {
		sqlsession.insert("main.following", followmap);

	}

	// 팔로우 검사하기
	@Override
	public int checkfollowing(HashMap<String, String> followmap) {
		int checkfollow = sqlsession.selectOne("main.checkfollowing", followmap);
		return checkfollow;
	}

	// 팔로우 취소하기
	@Override
	public void unfollowing(HashMap<String, String> followmap) {
		sqlsession.delete("main.unfollowing", followmap);

	}

}
