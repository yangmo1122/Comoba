package com.comoba.myroom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comoba.myroom.model.MyroomDAO;

//===== #30. Service 선언 =====
@Service
public class MyroomService implements InterMyroomService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private MyroomDAO dao;


	// 스케쥴 테이블, 내용 테이블 insert
	@Override
	public int scheWrite(HashMap<String, String> map) {
		
			int n = dao.scheWrite(map);
			
			
		return n;
	}

	//스케쥴 파일첨부 저장
	@Override
	public int addschefile(HashMap<String, String> schefile) {

		int n = dao.addschefile(schefile);
		
		return n;
	}

	//dday 작성
	@Override
	public int ddayWrite(HashMap<String, String> map) {

		int n = dao.ddayWrite(map);
		
		return n;
	}

	@Override
	public int missionwrite(HashMap<String, String> map, List<String> contentList) {
		
		int n = dao.missionwrite(map,contentList);
		
		return n;
	}

	@Override
	public List<HashMap<String, String>> getscheduleList(String memberno, String nowmonth) {
		List<HashMap<String, String>> list = dao.getscheduleList(memberno, nowmonth);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getdday(int memberno) {
		List<HashMap<String, String>> list = dao.getdday(memberno);
		
		return list;
	}

	@Override
	public List<HashMap<String, String>> getdday(HashMap<String, String> ddaymap) {
List<HashMap<String, String>> list = dao.getdday(ddaymap);
		
		return list;
	}

	@Override
	public List<HashMap<String, String>> scheduleAllList(String memberno, String clickdate) {
		List<HashMap<String, String>> list = dao.scheduleAllList(memberno, clickdate);
		return list;
	}
	
	
	@Override
	public List<HashMap<String, String>> scheFileList(String memberno, String clickdate) {
		List<HashMap<String, String>> list = dao.scheFileList(memberno, clickdate);
		return list;
	}
	
	@Override
	public List<HashMap<String, String>> missionList(HashMap<String, String> ddaymap) {
		List<HashMap<String, String>> list = dao.missionList(ddaymap);
		
		return list;
	}

	@Override
	public List<HashMap<String, String>> scheAllList(HashMap<String, String> ddaymap,
			List<HashMap<String, String>> scheList) {
		List<HashMap<String, String>> list = dao.scheAllList(ddaymap,scheList);
		
		return list;
	}

	@Override
	public int micomplete(String missionNum) {
		int n = dao.micomplete(missionNum);
		
		return n;
	}

	@Override
	public int selectdday(String ddayno) {
		int n = dao.selectdday(ddayno);
		
		return n;
	}

	@Override
	public List<HashMap<String, String>> getcaldetailList(HashMap<String, String> detailmap) {
		List<HashMap<String, String>> list = dao.getcaldetailList(detailmap);
		
		return list;
	}
}
