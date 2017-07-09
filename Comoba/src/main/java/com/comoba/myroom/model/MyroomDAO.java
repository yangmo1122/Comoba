package com.comoba.myroom.model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



//===== #28. DAO 선언 =====
@Repository
public class MyroomDAO implements InterMyroomDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public int scheWrite(HashMap<String, String> map) {
		int n = 0;
		int n2 = 0;
		int n1 = sqlsession.insert("myroom.writesche", map);
		//sche 테이블에 인서트
		
		if(n1>0){
		 n2 = sqlsession.insert("myroom.writeschecontent", map);
		//내용 테이블에 인서트
		}
		if(n1 > 0 && n2 > 0){
			n = 1;
		}
		
		return n;
	}

	@Override
	public int addschefile(HashMap<String, String> schefile) {
		int n = sqlsession.insert("myroom.addschefile", schefile);
		return n;
	}

	@Override
	public int ddayWrite(HashMap<String, String> map) {
		int n = sqlsession.insert("myroom.ddayWrite", map);
		return n;
	}

	@Override
	public int missionwrite(HashMap<String, String> map, List<String> contentList) {
		
		String memberno = map.get("memberno");
		String missiondate = map.get("missiondate");
		String string_missioncnt = map.get("missioncnt");
		int missioncnt = Integer.parseInt(string_missioncnt);
	
  		HashMap<String, String> daomap = new HashMap<String, String>();
  		daomap.put("memberno", memberno);
  		daomap.put("missiondate", missiondate);

  		int n = 0;
  		int result = 0;
  		int cnt = 0;
  		for(int i=0; i<missioncnt; i++){
		System.out.println(contentList.get(i));
  			daomap.put("content", contentList.get(i));
  			result = sqlsession.insert("myroom.missionwrite", daomap);
  			if(result == 1){
  				cnt++;
  			}
  		}
		if(cnt == missioncnt){
			n 	= 1;
		}
		return n;
	}

	@Override
	public List<HashMap<String, String>> getscheduleList(String memberno, String nowmonth) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberno", memberno);
		map.put("nowmonth", nowmonth);
		System.out.println("memberno="+memberno+"//nowmonth"+nowmonth);
		
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.getscheduleList", map);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getdday(int memberno) {
		
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.getdday", String.valueOf(memberno));
		return list;
	}

	@Override
	public List<HashMap<String, String>> getdday(HashMap<String, String> ddaymap) {
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.getclickdday", ddaymap);
		return list;
	}

	@Override
	public List<HashMap<String, String>> scheduleAllList(String memberno, String clickdate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberno", memberno);
		map.put("clickdate", clickdate);
		System.out.println("memberno="+memberno+"//nowmonth"+clickdate);
		
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.scheduleAllList", map);
		String scheno = "";
		for(int i=0; i<list.size(); i++){
			 scheno = list.get(i).get("SCHEDULE_NO");
			 int intscheno = Integer.parseInt(scheno);
			 
			 System.out.println("스트링"+scheno+"//인트"+intscheno);
			int count = sqlsession.selectOne("myroom.scheFileCount", intscheno);
			String st_count = Integer.toString(count);
			System.out.println(st_count);
			list.get(i).put("SCHECOUNT", st_count);
		}
		
		return list;
	}

	@Override
	public List<HashMap<String, String>> scheFileList(String memberno, String clickdate) {
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.scheFileList", memberno);
		return list;
	}

	@Override
	public List<HashMap<String, String>> missionList(HashMap<String, String> ddaymap) {
		List<HashMap<String, String>> list = sqlsession.selectList("myroom.missionList", ddaymap);
		return list;
	}


	@Override
	public List<HashMap<String, String>> scheAllList(HashMap<String, String> ddaymap,
			List<HashMap<String, String>> scheList) {

		/*List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<scheList.size(); i++){
			String scheno = scheList.get(i).get("SCHEDULE_NO");
			
			list = sqlsession.selectList("myroom.scheFileList", scheno);
		}
		System.out.println();
		
		*/
		
		return null;
	}

	@Override
	public int micomplete(String missionNum) {
		
		int n = sqlsession.update("myroom.micomplete", missionNum);
		
		return n;
	}

	@Override
	public int selectdday(String ddayno) {

		int a = sqlsession.update("myroom.origindday", ddayno);
		int b = sqlsession.update("myroom.selectdday", ddayno);
		int n = 0;
		if((a+b) == 2){
			n = 1;
		}
		return n;
	}

	@Override
	public List<HashMap<String, String>> getcaldetailList(HashMap<String, String> detailmap) {
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		
		List<Integer> ddayno = sqlsession.selectList("myroom.getddaycnt", detailmap);
		
		
		List<Integer> scheno = sqlsession.selectList("myroom.getschenocnt", detailmap);
		List<Integer> missionno = sqlsession.selectList("myroom.getmissioncnt", detailmap);
		List<String> dateno = sqlsession.selectList("myroom.getdate", detailmap);
		for(int i=0; i<7; i++){
			HashMap<String, String> alllist = new HashMap<String, String>();
			String dday =  Integer.toString(ddayno.get(i));
			String sche =  Integer.toString(scheno.get(i));
			String mission =  Integer.toString(missionno.get(i));
			String date = dateno.get(i);
			
			alllist.put("dday", dday);
			alllist.put("sche", sche);
			alllist.put("mission", mission);
			alllist.put("date", date);
			list.add(alllist);
			
		}

		
		return list;
	}
	

	
	
}
