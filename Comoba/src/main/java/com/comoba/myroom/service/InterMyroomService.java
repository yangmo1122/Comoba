package com.comoba.myroom.service;

import java.util.HashMap;
import java.util.List;

import com.comoba.main.model.MemberVO;

//Service 단 인터페이스 선언
public interface InterMyroomService {

	int scheWrite(HashMap<String, String> map); 		// 스케쥴 테이블, 내용 테이블 insert
	
	int addschefile(HashMap<String, String> schefile); // 라이브 첨부파일 저장
	
	int ddayWrite(HashMap<String, String> map); 	//dday 설정
	
	int missionwrite(HashMap<String, String> map, List<String> contentList); // mission 설정
	
	List<HashMap<String,String>> getscheduleList(String memberno, String nowmonth);  // 스제큘 가져오기.....ㅠ
	
	List<HashMap<String, String>> getdday(int memberno);    // dday 가져오기.....
	
	List<HashMap<String, String>> getdday(HashMap<String, String> ddaymap);    // 해당 날짜 dday 가져오기.....
	
	List<HashMap<String,String>> scheduleAllList(String memberno, String clickdate);  // 스제큘 내용 포함....ㅠ
	
	List<HashMap<String, String>> scheFileList(String memberno, String clickdate); 	//파일 뽑기
	
	List<HashMap<String, String>> scheAllList(HashMap<String, String> ddaymap, List<HashMap<String, String>> scheList); 
	
	
	List<HashMap<String, String>> missionList(HashMap<String, String> ddaymap);	// 미션뽑기
	
	int micomplete(String missionNum);	// 미션 체트하기
	
	int selectdday(String ddayno);			// dday 설정하기
	
	List<HashMap<String,String>> getcaldetailList(HashMap<String,String> detailmap); 		// ajax 주간 3개 구하기
	
	
}
