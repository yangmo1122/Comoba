package com.comoba.main;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.comoba.common.FileManager;
import com.comoba.common.GoogleMail;
import com.comoba.main.model.MemberVO;
import com.comoba.main.service.MainService;

@Controller
@Component
public class MainController {

	// ==== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private MainService service;
	
	@Autowired
	private FileManager fileManager;

	@Autowired
	private ThumbnailManager thumbnailManager;

	// ===== 1.초기 페이지 요청 =====
	@RequestMapping(value = "/index.action", method = { RequestMethod.GET })
	public String index(HttpServletRequest req) {

		return "index.notiles";
		// /Comoba/src/main/webapp/WEB-INF/views/index.jsp 파일을 생성한다.
	}

	// ===== 2.메인 페이지 요청 =====
	@RequestMapping(value = "/intro.action", method = { RequestMethod.GET })
	public String introList(HttpServletRequest req) {
		
		List<HashMap<String, String>> todayList = service.getTodayList();
		//System.out.println("확인용todayList:"+todayList);
		req.setAttribute("todayList", todayList);
		
		List<HashMap<String, String>> todayno = service.gettodayno();
		//System.out.println("확인용todayno:"+todayno);
		req.setAttribute("todayno", todayno);
		
		List<HashMap<String, String>> motivateList = service.getMotivateList();
		//System.out.println("확인용motivateList:"+motivateList);		
		req.setAttribute("motivateList", motivateList);
		
		List<HashMap<String, String>> motiveno = service.getmotiveno();
		//System.out.println("확인용motiveno:"+motiveno);
		req.setAttribute("motiveno", motiveno);
				
		return "intro/intro.tiles";
		// /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
	}

	// ===== 3.로그인 폼 페이지 요청 =====
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest req) {

		return "login/loginform.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/loginform.jsp 파일을 생성한다.
	}

	// ===== 4.회원가입 폼 페이지 요청 =====
	@RequestMapping(value = "/register.action", method = { RequestMethod.GET})
	public String register(HttpServletRequest req) {

		return "login/registerform.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/registerform.jsp 파일을 생성한다.
	}

	// ===== 5.회원가입 =====
	@RequestMapping(value = "/memberInsert.action", method = { RequestMethod.POST })
	public String memberInsert(MemberVO uservo,  MultipartHttpServletRequest req, HttpSession session) {

		String nickname = req.getParameter("nickname");
		System.out.println("확인용nickname:"+nickname);
		String email = req.getParameter("email");
		System.out.println("확인용email:"+email);
		String pwd = req.getParameter("pwd");
		System.out.println("확인용pwd:"+pwd);

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("nickname", nickname);
		map.put("email", email);
		map.put("pwd", pwd);
		
		String thumbnailFileName = "";

		if (!uservo.getAttach().isEmpty()) {

			String rootpath = session.getServletContext().getRealPath("/");
			String path = rootpath + "resources" + File.separator + "files";
			String newFileName = "";

			byte[] bytes = null;

			long filesize = 0;

			try {

				bytes = uservo.getAttach().getBytes();
				newFileName = fileManager.doFileUpload(bytes, uservo.getAttach().getOriginalFilename(), path);
				uservo.setFileName(newFileName);
				uservo.setOrgFilename(uservo.getAttach().getOriginalFilename());
				filesize = uservo.getAttach().getSize();

				// === >>>> thumbnail 파일 생성을 위한 작업 <<<< ========= //
				thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path);
				// =================================================== //

				map.put("fileName", newFileName);
				 //System.out.println("확인용"+newFileName);
				map.put("orgFilename", uservo.getAttach().getOriginalFilename());
				 //System.out.println("확인용"+uservo.getAttach().getOriginalFilename());
				map.put("fileSize", String.valueOf(filesize));
				 //System.out.println("확인용"+String.valueOf(filesize));
				map.put("thumbnailFileName", thumbnailFileName);
				 //System.out.println("확인용"+thumbnailFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end of if-----------------

		int n = 0;
		int memberno = 0;
		if (uservo.getAttach().isEmpty()) {
			// 회원이미지 없을경우
			n = service.memberInsert(map);
		} else {
			// 회원이미지 있다면
			memberno = service.Insertwithphoto(map);
			int userno = service.getmemberno(memberno);
			//System.out.println("확인용memberno:"+userno);
			map.put("memberno", String.valueOf(userno));
			n = service.Insert_withFile(map);
		}

		req.setAttribute("n", n);

		return "login/regEnd.tiles";
	}

	// ===== 6.회원정보수정 폼 =====
	@RequestMapping(value = "/userdetail.action", method = { RequestMethod.GET })
	public String userdetail(HttpServletRequest req, HttpSession session)throws Exception {
		
		try {
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

			if(loginuser != null){
				String thumbnailFileName = service.getuserimage(String.valueOf(loginuser.getMemberno()));
				req.setAttribute("thumbnailFileName", thumbnailFileName);
				//System.out.println("확인용" + thumbnailFileName);
			}

		} catch (Exception e) {
			e.getMessage();
		}

		return "login/useredit.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/userdetail.jsp 파일을 생성한다.
	}

	// ==== 7.회원이미지 가져오기 ====
	@RequestMapping(value = "/getuserimage.action", method = { RequestMethod.GET })
	@ResponseBody
	public HashMap<String, String> getuserimage(HttpServletRequest req, HttpSession session) {

		String memberno = req.getParameter("memberno"); 
		String thumbnailFileName = req.getParameter("thumbnailFileName"); 

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberno", memberno);
		map.put("thumbnailFileName", thumbnailFileName);

		String userimage = service.getuserimage(String.valueOf(loginuser.getMemberno()));

		HashMap<String, String> returnmap = new HashMap<String, String>();

		returnmap.put("userimage", userimage);

		return returnmap;
	}

	// ===== 8.회원정보수정 =====
	@RequestMapping(value = "/edituser.action", method = { RequestMethod.POST })
	public String edituser(MemberVO uservo, MemberVO loginuser, MultipartHttpServletRequest req, HttpSession session) {

		String memberno = req.getParameter("memberno");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");
		String pwd = req.getParameter("pwd");
		String comments = req.getParameter("comments");

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memberno", memberno);
		//System.out.println("확인용"+memberno);
		map.put("email", email);
		 //System.out.println("확인용"+email);
		map.put("nickname", nickname);
		 //System.out.println("확인용"+nickname);
		map.put("pwd", pwd);
		// System.out.println("확인용"+pwd);
		map.put("comments", comments);
		 //System.out.println("확인용"+comments);

		String thumbnailFileName = "";

		if (!uservo.getAttach().isEmpty()) {

			String rootpath = session.getServletContext().getRealPath("/");
			String path = rootpath + "resources" + File.separator + "files";
			String newFileName = "";

			byte[] bytes = null;

			long filesize = 0;

			try {

				bytes = uservo.getAttach().getBytes();
				newFileName = fileManager.doFileUpload(bytes, uservo.getAttach().getOriginalFilename(), path);
				uservo.setFileName(newFileName);
				uservo.setOrgFilename(uservo.getAttach().getOriginalFilename());
				filesize = uservo.getAttach().getSize();

				// === >>>> thumbnail 파일 생성을 위한 작업 <<<< ========= //
				thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path);
				// =================================================== //

				map.put("fileName", newFileName);
				 //System.out.println("확인용"+newFileName);
				map.put("orgFilename", uservo.getAttach().getOriginalFilename());
				 //System.out.println("확인용"+uservo.getAttach().getOriginalFilename());
				map.put("fileSize", String.valueOf(filesize));
				 //System.out.println("확인용"+String.valueOf(filesize));
				map.put("thumbnailFileName", thumbnailFileName);
				 //System.out.println("확인용"+thumbnailFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end of if-----------------

		int n = 0;

		if (uservo.getAttach().isEmpty()) {
			// 회원이미지 없을경우
			n = service.edituser(map);
			//System.out.println("확인용contrn1"+n);
		} else {
			// 회원이미지 있다면
			n = service.edit_withFile(map);
			//System.out.println("확인용contrn2"+n);
		}

		if (n == 1) {
			loginuser = service.getLoginMember(email);
			session.setAttribute("loginuser", loginuser);
		}
		
		//System.out.println("확인용contrn3"+n);
		req.setAttribute("n", n);

		return "login/editEnd.tiles";
	}

	// ===== 9.회원정보추가 폼 =====
	@RequestMapping(value = "/adduserdetail.action", method = { RequestMethod.GET })
	public String adduserdetail(HttpServletRequest req) {

		return "login/adduserdetail.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/adduserdetail.jsp 파일을
		// 생성한다.
	}
	
	// ===== 10.게시글 상세 폼 페이지 요청
	@RequestMapping(value = "/writedetail.action", method = { RequestMethod.GET })
	public String writedetail(HttpServletRequest req) {

		return "writedetail/writedetailform.tiles";
		// /Board/src/main/webapp/WEB-INF/views/writedetail/writedetailform.jsp
		// 파일을 생성한다.
	}

	// ===== 11.로그인 =====
	@RequestMapping(value = "/loginEnd.action", method = { RequestMethod.POST })
	public String loginEnd(HttpServletRequest req, MemberVO loginuser, HttpSession session) {

		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pwd);

		int n = service.loginEnd(map);

		req.setAttribute("n", n);

		if (n == 1) {
			loginuser = service.getLoginMember(email);
			session.setAttribute("loginuser", loginuser);
		}

		return "login/loginEnd.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/loginEnd.jsp 파일을 생성한다.
	}

	// ===== 12.로그아웃 완료 =====
	@RequestMapping(value = "/logout.action", method = { RequestMethod.GET })
	public String logout(HttpServletRequest req, HttpSession session) {

		session.invalidate();

		return "login/logout.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/logout.jsp 파일을 생성한다.
	}

	// ===== 13.암호 찾기 폼 =====
	@RequestMapping(value = "/findpwd.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String findpwd(HttpServletRequest req) {

		String method = req.getMethod();
		req.setAttribute("method", method);

		if ("POST".equalsIgnoreCase(method)) {

			String email = req.getParameter("email");

			int n = service.getUser(email);

			if (n == 1) {
				// 비밀번호 찾기를 위해 입력한 사용자아이디와 이메일이 DB에 등록된 경우
				// ***** 인증메일 발송 ******

				GoogleMail mail = new GoogleMail();

				// 인증키를 생성한다.
				Random rnd = new Random();

				try {
					char randchar = ' ';
					int randnum = 0;
					String certificationCode = "";

					for (int i = 0; i < 5; i++) {
						// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
						// int rndnum = rnd.nextInt(max - min + 1) + min;

						randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
						certificationCode += randchar;
					}

					for (int i = 0; i < 7; i++) {
						randnum = rnd.nextInt(9 - 0 + 1) + 0;
						certificationCode += randnum;
					}

					mail.sendmail(email, certificationCode);
					req.setAttribute("certificationCode", certificationCode);
					System.out.println("===> 확인용 certificationCode : " + certificationCode);

				} catch (Exception e) {
					e.printStackTrace();

					n = -1;
					req.setAttribute("n", n);
					req.setAttribute("sendFailmsg", "메일발송이 실패했습니다.");

				} // end of try ~ catch---------------------

			} else {
				// 비밀번호 찾기를 위해 입력한 이메일이
				// DB에 없는 경우
				n = 0;
			}

			req.setAttribute("n", n);
			req.setAttribute("email", email);
			req.setAttribute("method", "POST");
		}

		return "login/findpwd.tiles";
	}
	
	// ===== 14.인증 폼 =====
	@RequestMapping(value = "/pwdConfirm.action", method = { RequestMethod.POST})
	public String pwdConfirm(HttpServletRequest req, HttpSession session) {
		
		String email = req.getParameter("email");
		req.setAttribute("email", email);
		
		return "login/pwdConfirm.tiles";
	}	
	
	// ===== 15.암호 수정 폼 =====
	@RequestMapping(value = "/changepwd.action", method = { RequestMethod.POST})
	public String changepwd(HttpServletRequest req) {
		
		String email = req.getParameter("email");
		//System.out.println("===> 확인용1 email : " + email);
		String pwd = req.getParameter("pwd");
		//System.out.println("===> 확인용1 pwd : " + pwd);		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email",email);
		map.put("pwd",pwd);
		
		int n = service.changepwd(map);
		//System.out.println("===> 확인용1 n : " + n);
		
		if(n == 1){
			req.setAttribute("n", n);
		}
		
		return "login/changepwdEnd.tiles";
	}
	
	// ===== 16. 나의 d-day 현황 ====
	@RequestMapping(value = "/state.action", method = {RequestMethod.GET})
	public String state(HttpServletRequest req, HttpSession session) throws Exception {
				
		try{
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			String memberno = String.valueOf(loginuser.getMemberno());
			//System.out.println("확인용memberno==>"+memberno);
			String userno_fk = String.valueOf(loginuser.getMemberno());
			//System.out.println("확인용userno_fk==>"+userno_fk);
			String nickname = loginuser.getNickname();
			System.out.println("확인용nickname===>"+nickname);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberno", memberno);
			map.put("userno_fk", userno_fk);
			map.put("nickname", nickname);

			String remaindate = service.getremaindate(map);
			//System.out.println("확인용remaindate==>"+remaindate);
			
			String memberno_fk = service.getmemberno_fk(map);
			//System.out.println("확인용memberno_fk==>"+memberno_fk);
			map.put("memberno_fk", memberno_fk);
			
			String dday_no_fk = String.valueOf(service.getdday_no_fk(map));
			//System.out.println("확인용dday_no_fk==>"+dday_no_fk);
			map.put("dday_no_fk", dday_no_fk);
			
			List<HashMap<String, String>> attandanceList = service.getattandanceList(map);
			//System.out.println("확인용attandanceList"+attandanceList);
			
			List<HashMap<String, String>> missionrateList = service.getmissionrateList(map);
			System.out.println("확인용missionrateList"+missionrateList);
			
			int date = service.getdate(map);
			//System.out.println("확인용date==>"+date);
						
			int n = service.checkattandce(map);
			//System.out.println("확인용n===>"+n);
			
			if(n > 0){
				int attandedno = service.getMaxattand(map);
				//System.out.println("확인용attandedno===>"+attandedno);
				req.setAttribute("attandedno", attandedno);
			}
			
			int missionrate = service.getmissionrate(map);
			//System.out.println("확인용missionrate==>"+missionrate);
			
			req.setAttribute("date", date);
			req.setAttribute("remaindate", remaindate);
			req.setAttribute("missionrate", missionrate);
			req.setAttribute("attandanceList", attandanceList);
			req.setAttribute("missionrateList", missionrateList);
			
		} catch (Exception e) {
			e.getMessage();
		}
			
		return "myroom/state.tiles";
	}
	
	// 17. DDAY를 정한 날짜로 부터 DDAY까지의 일수출석일수 구하기
	@RequestMapping(value ="/attandance.action", method = {RequestMethod.POST})
	public String attandance(HttpServletRequest req, HttpSession session)throws Exception{

		try {
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			if(loginuser != null){
				String userno_fk = String.valueOf(loginuser.getMemberno());
				System.out.println("확인용userno_fk==>"+userno_fk);
						
				String name_fk = loginuser.getNickname();
				System.out.println("확인용name==>"+name_fk);
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("name_fk", name_fk);
				map.put("userno_fk", userno_fk);
				map.put("memberno_fk", userno_fk);
				
				String dday_no_fk = String.valueOf(service.getdday_no_fk(map));
				System.out.println("확인용dday_no_fk==>"+dday_no_fk);
				map.put("dday_no_fk", dday_no_fk);
				
				int n = service.dailyattance(map);
				//System.out.println("확인용n==>"+n);
				
				if(n == 1 ){
					req.setAttribute("n", n);
				}
			}

		} catch (Exception e) {
			e.getMessage();
		}

		return "myroom/stateEnd.tiles";
	}	
	
	// ===== 스톱워치 사이드바 완료(리셋버튼 누를때) 요청
	@RequestMapping(value = "/stoptest3.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<HashMap<String, Object>> stoptest3(HttpServletRequest req, HttpSession session) {

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String email = loginuser.getEmail();

		String sm_count = req.getParameter("sm_count");
		String sm_switch = req.getParameter("sm_switch");
		String sm_auto = req.getParameter("sm_auto");
		String reset_switch = req.getParameter("reset_switch");

		if (sm_count == null) {

			sm_count = "0";
			sm_switch = "0";
			sm_auto = "0";
			reset_switch = "0";
		}
		List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>();

		// System.out.println("sm_switch="+sm_switch+"sm_count"+sm_count);
		HashMap<String, Object> submap = new HashMap<String, Object>();
		submap.put("sm_count", sm_count);
		submap.put("sm_switch", sm_switch);
		submap.put("sm_auto", sm_auto);
		submap.put("reset_switch", reset_switch);

		HashMap<String, Object> addcntmap = new HashMap<String, Object>();
		addcntmap.put("addcnt", Integer.parseInt(sm_count));
		addcntmap.put("email", email);

		if (sm_switch != null && Integer.parseInt(sm_count) != 0) {
			System.out.println("리셋 눌렀으니 이걸 넣어주렴 sm_count=" + sm_count);

		//	int n = service.addCount(addcntmap);
			loginuser = service.getLoginMember(email);
			session.setAttribute("loginuser", loginuser);

		}

		/*
		 * if(sm_switch.equals("3")){ System.out.println("sm_switch가 "+
		 * sm_switch +", 즉 3이면 나는 sm_count의 값"+sm_count+"를 업데이트 해줄고야");
		 * 
		 * //service. }
		 */

		req.setAttribute("sm_count", sm_count);
		req.setAttribute("sm_switch", sm_switch);
		returnmapList.add(submap);
		return returnmapList;
		// /Board/src/main/webapp/WEB-INF/views/login/logout.jsp 파일을 생성한다.
	}

	// ===== 스톱워치 사이드바 페이지 이동시 세션 요청
	@RequestMapping(value = "/session.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<HashMap<String, Object>> session(HttpServletRequest req, HttpSession session) {

		String sm_count = req.getParameter("sm_count");
		String sm_switch = req.getParameter("sm_switch");
		String sm_auto = req.getParameter("sm_auto");
		String startt = req.getParameter("startt");
		String stopp = req.getParameter("stopp");
		String second_start = req.getParameter("second_start");
		// System.out.println("하하핳"+second_start);

		session.setAttribute("sm_count", sm_count);
		session.setAttribute("sm_auto", sm_auto);
		session.setAttribute("startt", startt);
		session.setAttribute("stopp", stopp);
		session.setAttribute("second_start", second_start);
		// String a = (String) session.getAttribute("sm_auto");
		// System.out.println("bbbbb:"+ a);
		List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>();

		// System.out.println("sm_switch="+sm_switch+", sm_count"+sm_count+",
		// auto"+sm_auto+", startt="+startt);
		HashMap<String, Object> submap = new HashMap<String, Object>();
		submap.put("sm_count", sm_count);
		submap.put("sm_switch", sm_switch);
		submap.put("sm_auto", sm_auto);

		req.setAttribute("sm_count", sm_count);
		req.setAttribute("sm_switch", sm_switch);

		returnmapList.add(submap);
		return returnmapList;
		// /Board/src/main/webapp/WEB-INF/views/login/logout.jsp 파일을 생성한다.
	}

} // end of class------------------