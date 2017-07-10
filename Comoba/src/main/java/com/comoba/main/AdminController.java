package com.comoba.main;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.comoba.admin.model.AdminBoardVO;
import com.comoba.admin.model.AdminMemberVO;
import com.comoba.admin.service.AdminService;
import com.comoba.common.FileManager;


@Controller
@Component
public class AdminController {

	// ===== #33. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private AdminService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private ThumbnailManager thumbnailManager;

	// ===== #맴버관리 페이지 요청. =====
	@RequestMapping(value = "/admin/memberManagement.action", method = { RequestMethod.GET })
	public String memberManagement(HttpServletRequest req, HttpSession session) {

		
		
		List<AdminMemberVO> memberList = service.memberList();

	
		req.setAttribute("memberList", memberList);

		
		return "admin/memberManagement.tiles";
		// /comoba/src/main/webapp/WEB-INF/views/admin/memberManagement.jsp 파일을
		// 생성한다.
	}
	
	
	
	
	
	// ===== #맴버관리 ajax  요청. =====

	@RequestMapping(value = "/admin/searchshow.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<HashMap<String, Object>> searchShow(HttpServletRequest req) {

		List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>();

		String search = req.getParameter("search");
	
		System.out.println("search : " +search);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
	

		List<HashMap<String, String>> searchList = service.searchList(map);

		if (searchList != null) {
			for (HashMap<String, String> datamap : searchList) {

				HashMap<String, Object> submap = new HashMap<String, Object>();
				submap.put("MEMBERNO", datamap.get("MEMBERNO"));
				submap.put("NICKNAME", datamap.get("NICKNAME"));
				submap.put("PWD", datamap.get("PWD"));
				submap.put("EMAIL", datamap.get("EMAIL"));
				submap.put("STATUS", datamap.get("STATUS"));
				submap.put("STUDYCNT", datamap.get("STUDYCNT"));
				submap.put("JOINDATE", datamap.get("JOINDATE"));
				submap.put("IMAGESTATUS", datamap.get("IMAGESTATUS"));
			
				returnmapList.add(submap);
			}
		}

		return returnmapList;
	}
	
	
	
	

	// ===== #공스토리룸 추가하는 페이지 요청. =====
	@RequestMapping(value = "/admin/addStudyroom.action", method = { RequestMethod.GET })
	public String addStudyroom(HttpServletRequest req) {

		return "admin/addStudyroom.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/addStudyroom.jsp 파일을 생성한다.
	}

	// ===== #공스토리룸 추가하는 페이지 요청. =====
		@RequestMapping(value = "/admin/addStudyroomEnd.action", method = { RequestMethod.POST })
		public String addStudyRoom(MultipartHttpServletRequest req, HttpServletResponse res) throws Throwable {

			String studyroom_no = String.valueOf(service.getstudyroom_no());// 다음
																			// 시퀀스
																			// 번호

			System.out.println("studyroom_no : " + studyroom_no);

			String studyroom_name = req.getParameter("studyroom_name");
			String addr1 = req.getParameter("addr1");
			String addr2 = req.getParameter("addr2");
			String hp = req.getParameter("hp");
			String cost = req.getParameter("cost");
			String latitude = req.getParameter("latitude");
			String longitude = req.getParameter("longitude");
			String studyroom_contents = req.getParameter("studyroom_contents");
			
			studyroom_contents = studyroom_contents.replaceAll("\r\n", "<br>");
			
			
			List<MultipartFile> attachList = req.getFiles("attach");

			HashMap<String, String> mapStudyroom = new HashMap<String, String>();
			mapStudyroom.put("studyroom_name", studyroom_name);
			mapStudyroom.put("addr1", addr1);
			mapStudyroom.put("addr2", addr2);
			mapStudyroom.put("hp", hp);
			mapStudyroom.put("cost", cost);
			mapStudyroom.put("studyroom_no", studyroom_no);
			mapStudyroom.put("latitude", latitude);
			mapStudyroom.put("longitude", longitude);
			
			
			mapStudyroom.put("studyroom_contents", studyroom_contents);

			List<HashMap<String, String>> mapStudyroomimageList = new ArrayList<HashMap<String, String>>();
			if (attachList != null) {
				// WAS 의 webapp 의 절대경로를 알아와야 한다.
				HttpSession session = req.getSession();
				String root = session.getServletContext().getRealPath("/");
				String path = root + "resources" + File.separator + "files";
				// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.

				System.out.println("path  :  "+path);
				String newFileName = "";
				// WAS(톰캣) 디스크에 저장할 파일명

				byte[] bytes = null;
				// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도

				long fileSize = 0;
				// 파일크기를 읽어오기 위한 용도

				String thumbnailFileName = "";
				// WAS 디스크에 저장될 thumbnail 파일명

				for (int i = 0; i < attachList.size(); i++) {
					try {
						bytes = attachList.get(i).getBytes();

						newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);

						fileSize = attachList.get(i).getSize();

						// === >>>> thumbnail 파일 생성을 위한 작업 <<<< ========= //
						thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path);
						// =================================================== //

						HashMap<String, String> mapProductimage = new HashMap<String, String>();

						System.out.println();

						mapProductimage.put("studyroom_no", studyroom_no);
						mapProductimage.put("imagefilename", newFileName);
						mapProductimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
						mapProductimage.put("imagefileSize", String.valueOf(fileSize));
						mapProductimage.put("thumbnailFileName", thumbnailFileName);

						System.out.println("fk_studyroom_no : " + studyroom_no);
						System.out.println("imagefilename : " + newFileName);
						System.out.println("imageorgFilename : " + attachList.get(i).getOriginalFilename());
						System.out.println("imagefileSize : " + String.valueOf(fileSize));
						System.out.println("thumbnailFileName : " + thumbnailFileName);

						mapStudyroomimageList.add(mapProductimage);

					} catch (Exception e) {

					}

				} // end of for-------------------------

			} // end of if------------------------------

			// **** 폼에서 입력받은 제품입력정보 값을
			// Service 단으로 넘겨서 테이블에 insert 하기로 한다.

			// 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
			// Service 단으로 호출하기
			int n = 0;
			int m = 0;
			int count = 0;

			if (attachList == null) { // 파일 첨부된것이 없다면
				n = service.addStudyroom(mapStudyroom);

			} else if (attachList != null) { // 파일 첨부된것이 있다면
				n = service.addStudyroom(mapStudyroom);

				n = service.addStudyroomtitle(mapStudyroomimageList.get(0));
				
				for (int i = 0; i < mapStudyroomimageList.size(); i++) {
					m = service.addStudyroomimage(mapStudyroomimageList.get(i));
					if (m == 1)
						count++;
				}

				if (mapStudyroomimageList.size() == count) {
					n = 1;
				} else {
					n = 0;
				}
			}

			String msg = "";
			String loc = "";
			if (n == 1) {
				msg = "제품입력 성공!!";
				loc = "/main/intro.action";
			} else {
				msg = "제품입력 실패!!";
				loc = "javascript:history.back();";
			}

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

			return "msg.notiles";

			// return "admin/addStoryroomEnd.tiles";
			// /Board/src/main/webapp/WEB-INF/views/admin/boardManagement.jsp 파일을
			// 생성한다.
		};

	// ===== #자유게시판 관리하는 페이지 요청. =====
	@RequestMapping(value = "/admin/boardManagement.action", method = { RequestMethod.GET })
	public String boardManagement(HttpServletRequest req, HttpSession session) {

		// 페이징 처리하기 =====
		// 페이징처리는 URL 주소창에 예를들어 /admin/boardManagement.action?pageNo=3 와 같이 해주어야
		// 한다.

		String pageNo = req.getParameter("pageNo");

		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10)
		int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)

		int start = 0; // 시작 행 번호
		int end = 0; // 끝 행 번호
		int startPageNo = 0; // 페이지바에서 시작될 페이지 번호
		/*
		 * "페이지바" 란?
		 * 
		 * 이전5페이지 [1][2][3][4][5] 다음5페이지 이전5페이지 [6][7][8][9][10] 다음5페이지 와 같이
		 * 이전5페이지 [1][2][3][4][5] 다음5페이지 또는 이전5페이지 [6][7][8][9][10] 다음5페이지 를
		 * "페이지바" 라고 부른다. startPageNo 는 1 또는 6 을 말한다.
		 */

		int loop = 0; // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
		int blocksize = 5; // "페이지바" 에 보여줄 페이지의 갯수

		if (pageNo == null) {
			// 게시판 초기화면에 보여지는 것은
			// req.getParameter("pageNo"); 값이 없으므로
			// pageNo 는 null 이 된다.

			currentShowPageNo = 1;
			// 즉, 초기화면은 /admin/boardManagement.action?pageNo=1 로 하겠다는 말이다.

		} else {
			currentShowPageNo = Integer.parseInt(pageNo);
			// GET 방식으로 파라미터 pageNo 에 넘어온 값을
			// 현재 보여주고자 하는 페이지로 설정한다.
		}

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo start end -------------------------------------- 1
		 * page ==> 1 5 2 page ==> 6 10 3 page ==> 11 15 4 page ==> 16 20 5 page
		 * ==> 21 25 6 page ==> 26 30 7 page ==> 31 35
		 */

		start = ((currentShowPageNo - 1) * sizePerPage) + 1;
		end = start + sizePerPage - 1;

		/*
		 * ==================================================== List<BoardVO>
		 * boardList = service.boardList();
		 * ====================================================
		 */
		// ===== 검색어가 포함되었으므로
		// 먼저 위의 List<BoardVO> boardList = service.boardList(); 부분을
		// 주석처리하고서 아래와 같이 한다. =====
		String colname = req.getParameter("colname");
		String search = req.getParameter("search");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("colname", colname);
		map.put("search", search);

		// ===== 페이징 처리를 위해 start, end 를 map 에 추가하여 DB에서 select 되어지도록 한다. =====
		map.put("start", String.valueOf(start)); // 키값 start, 밸류값은 해쉬맵이 String
													// 타입인데 start 는 int 타입이어서
													// String 타입으로 변경함.
		map.put("end", String.valueOf(end)); // 키값 end, 밸류값은 해쉬맵이 String 타입인데
												// end 는 int 타입이어서 String 타입으로
												// 변경함.

		List<AdminBoardVO> boardList = service.boardList(map);

		// ===== 페이징 작업의 계속(페이지바에 나타낼 총 페이지 갯수 구하기) =====
		/*
		 * 검색조건이 없을때의 총페이지수와 검색조건이 있을때의 총페이지수를 구해야 한다.
		 * 
		 * 검색조건이 없을때란 --> colname , search 값이 null 인 경우임. 검색조건이 있을때란 --> colname
		 * , search 값이 null 인 아닌경우임.
		 */

		// 총페이지수를 구하기 위해서는 먼저 총 게시물 건수를 구한다.
		// 총 게시물 건수는 검색조건이 있을 때와 없을때로 나뉘어진다.
		totalCount = service.getTotalCount(map);

		// System.out.println(">>>> 확인용 totalCount : " + totalCount);

		// ==== 이제부터 페이지바 작성을 위한 작업에 들어간다. ====
		// 43.0/10 ==> 4.3 --> 5 페이지가 필요함.
		// 43.0/5 ==> 8.6 --> 9 페이지가 필요함.
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		String pagebar = "";
		pagebar += "<ul>";
		/*
		 * 우리는 위에서 blocksize 를 5로 설정했으므로 아래와 같은 페이지바가 생성되도록 해야 한다.
		 * 
		 * 이전5페이지 [1][2][3][4][5] 다음5페이지 이전5페이지 [6][7][8][9][10] 다음5페이지 이전5페이지
		 * [11][12][13] 다음5페이지
		 * 
		 * 페이지번호는 1씩 증가하므로 페이지번호를 증가시켜주는 반복변수가 필요하다. 이것은 위에서 선언한 loop 를 사용한다. 이때
		 * loop 는 blocksize 의 크기보다 크면 안된다.!!
		 */

		loop = 1;

		// **** !!! 페이지바의 시작 페이지번호(startPageNo)값 만들기 --- 공식임 !!!!
		startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;
	
	
		// **** 이전5페이지 만들기 ****
		if (startPageNo == 1) {
			// 첫 페이지바에 도달한 경우
			pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
		} else {
			// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우

			if (colname == null || search == null) {
				// 검색어가 없는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;",
						startPageNo - 1, blocksize); // 처음 %d 에는 startPageNo값 ,
														// 두번째 %d 에는 페이지바에 나타낼
														// startPageNo값 이다.
			}

			else {
				// 검색어가 있는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d&colname=%s&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;",
						startPageNo - 1, colname, search, blocksize); // 검색어 있는
																		// 경우
			}
		}

		// **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
		while (!(loop > blocksize || startPageNo > totalPage)) {

			if (startPageNo == currentShowPageNo) {
				pagebar += String.format(
						"&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;",
						startPageNo);
			} else {
				if (colname == null || search == null) {
					// 검색어가 없는 경우
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d'>%d</a>&nbsp;&nbsp;",
							startPageNo, startPageNo); // 처음 %d 에는 startPageNo값
														// , 두번째 %d 에는 페이지바에 나타낼
														// startPageNo값 이다.
				} else {
					// 검색어가 있는 경우
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;",
							startPageNo, colname, search, startPageNo); // 검색어
																		// 있는 경우
				}
			}

			loop++;
			startPageNo++;

		} // end of while--------------------

		// **** 다음5페이지 만들기 ****
		if (startPageNo > totalPage) {
			// 마지막 페이지바에 도달한 경우
			pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
		} else {
			// 마지막 페이지바가 아닌 경우

			if (colname == null || search == null) {
				// 검색어가 없는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;",
						startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째
													// %d 에는 페이지바에 나타낼
													// startPageNo값 이다.
			} else {
				// 검색어가 있는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/admin/boardManagement.action?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;",
						startPageNo, colname, search, blocksize); // 검색어 있는 경우
			}
		}

		pagebar += "</ul>";

		req.setAttribute("pagebar", pagebar);
		req.setAttribute("colname", colname);
		req.setAttribute("search", search);

		req.setAttribute("boardList", boardList);

		/*
		 * ===== #68. 글조회수(readCount)증가(DML문 update)는 반드시 해당 글제목을 클릭했을 경우에만 증가되고
		 * 웹브라우저에서 새로고침(F5)을 했을 경우에는 증가가 안되도록 한다. 이것을 하기 위해서 우리는 session 을 사용하여
		 * 처리한다. =====
		 */
		session.setAttribute("readCountPermission", "yes");
		/*
		 * 글목록 페이지(list.action)에 접속하면 세션의 "readCountPermission" 값은 "yes" 로 되어진다.
		 */

		return "admin/boardManagement.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/boardManagement.jsp 파일을
		// 생성한다.
	};

	// ===== #76. 글삭제 페이지 요청 =====
	@RequestMapping(value = "/admin/del.action", method = { RequestMethod.GET })
	public String del(HttpServletRequest req) {

		// 삭제해야할 글번호 가져오기

		String boardno = req.getParameter("boardno");

		// System.out.println("req.getParameter('boardno') : " +
		// req.getParameter("boardno"));

		// System.out.println("Board_no : "+boardno);

		int n = service.del(boardno);

		req.setAttribute("n", n);

		return "admin/delEnd.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

	};


	// ===== #76. 맴버 탈퇴 페이지 요청 =====
	@RequestMapping(value = "/admin/memberDel.action", method = { RequestMethod.GET })
	public String memberDel(HttpServletRequest req) {

		// 삭제해야할 글번호 가져오기

		String memberno = req.getParameter("memberno");

		// System.out.println("req.getParameter('boardno') : " +
		

		System.out.println("memberno : "+memberno);

		int n = service.memberDel(memberno);

		req.setAttribute("n", n);

		return "admin/delEnd2.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

	};
	

	// ===== #76. 맴버 탈퇴 페이지 요청 =====
	@RequestMapping(value = "/admin/comeback.action", method = { RequestMethod.GET })
	public String comback(HttpServletRequest req) {

		// 삭제해야할 글번호 가져오기

		String memberno = req.getParameter("memberno");

		// System.out.println("req.getParameter('boardno') : " +
		

		System.out.println("memberno : "+memberno);

		int n = service.comeback(memberno);

		req.setAttribute("n", n);

		return "admin/comeback2.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

	};

	
	
	
	// ===== #글수정 페이지 요청 =====
	@RequestMapping(value = "/admin/boardEdit.action", method = { RequestMethod.GET })
	public String boardEdit(HttpServletRequest req) {

		// 수정해야할 글번호 가져오기

		String boardno = req.getParameter("boardno");
		String subject = req.getParameter("subject");
		String board_contents = req.getParameter("board_contents");

		// System.out.println("req.getParameter('boardno') : " +
		// req.getParameter("boardno"));

		// System.out.println("req.getParameter('subject') : " +
		// req.getParameter("subject"));
		// System.out.println("req.getParameter('board_contents') : " +
		// req.getParameter("board_contents"));
		// System.out.println("Board_no : "+boardno);

		AdminBoardVO avo = new AdminBoardVO();

		avo.setBoard_no(boardno);
		// System.out.println("avo.getBoard_no() : "+ avo.getBoard_no());
		avo.setSubject(subject);
		avo.setBoard_contents(board_contents);

		int n = service.boardEdit(avo);

		req.setAttribute("n", n);

		return "admin/editEnd.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

	};
	
	
		// ===== #맴버수정 페이지 요청 =====
		@RequestMapping(value = "/admin/memberEdit.action", method = { RequestMethod.GET })
		public String memberEdit(HttpServletRequest req) {

			// 삭제해야할 글번호 가져오기
			String memberno = req.getParameter("memberno");
			String nickname = req.getParameter("nickname");
			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");
			
			String newpwd = req.getParameter("newpwd");

			System.out.println("req.getParameter('memberno') : " + req.getParameter("memberno"));
			
			System.out.println("req.getParameter('newpwd') : " + req.getParameter("newpwd"));

			System.out.println("req.getParameter('pwd') : " + req.getParameter("pwd"));
			// System.out.println("req.getParameter('subject') : " +
			// req.getParameter("subject"));
			// System.out.println("req.getParameter('board_contents') : " +
			// req.getParameter("board_contents"));
			// System.out.println("Board_no : "+boardno);

			AdminMemberVO avo = new AdminMemberVO();

			avo.setMemberno(memberno);
			avo.setNickname(nickname);
			// System.out.println("avo.getBoard_no() : "+ avo.getBoard_no());
			avo.setEmail(email);
			if (newpwd.length() > 0) {
				
				pwd = newpwd;
				
				avo.setPwd(pwd);
			}
	
			else{
				avo.setPwd(pwd);
			}

			int n = service.memberEdit(avo);

			req.setAttribute("n", n);

			return "admin/editEnd2.tiles";
			// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

		};
	
	
		// 어드민 자유게시판에서 단어 검색시 ajax 나오는 매소드
	@RequestMapping(value = "/admin/wordSearchShow.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<HashMap<String, Object>> wordSearchShow(HttpServletRequest req) {

		List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>();

		String colname = req.getParameter("colname");
		String search = req.getParameter("search");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("colname", colname);
		map.put("search", search);

		List<HashMap<String, String>> searchWordCompleteList = service.searchWordCompleteList(map);

		if (searchWordCompleteList != null) {
			for (HashMap<String, String> datamap : searchWordCompleteList) {

				HashMap<String, Object> submap = new HashMap<String, Object>();
				submap.put("RESULTDATA", datamap.get("SEARCHDATA"));

				returnmapList.add(submap);
			}
		}

		return returnmapList;
	}

	// 차트의 값을 가져오는 메소드
	@RequestMapping(value = "/admin/boardCnt.action", method = { RequestMethod.GET })
	public String boardCnt(HttpServletRequest req) {

		// 1번쨰 차트

		List<HashMap<Object, Object>> boardCnt = service.getBoardYearCnt();
		req.setAttribute("boardCnt", boardCnt);

		List<HashMap<Object, Object>> liveCnt = service.getLiveYearCnt();
		req.setAttribute("liveCnt", liveCnt);

		List<HashMap<Object, Object>> storyCnt = service.getstoryYearCnt();
		req.setAttribute("storyCnt", storyCnt);

		// 2번 차트
		List<HashMap<Object, Object>> orderCnt = service.getorderYearCnt();
		req.setAttribute("orderCnt", orderCnt);

		// 3번째 차트
		HashMap<Object, Object> map = new HashMap<Object, Object>();

		int seoulOrderCnt = 0;
		int sumCnt = 0;
		for (int i = 0; i < 5; i++) {

			map.put("i", i);

			seoulOrderCnt = service.seoulOrderCnt(map);

			// System.out.println(" seoulOrderCnt : " + seoulOrderCnt);

			sumCnt += seoulOrderCnt;

			req.setAttribute("seoulOrderCnt" + i, seoulOrderCnt);

		}
		// System.out.println("sumCnt : "+sumCnt);
		req.setAttribute("sumCnt", sumCnt);

		// 4번째 매출액 차트
		// 0 강남의 1강서 2 강북 4 강동 5중구
		List<HashMap<Object, Object>> monthSales0 = new ArrayList<HashMap<Object, Object>>();
		monthSales0 = service.getMonthSales0();

		req.setAttribute("monthSales0", monthSales0);
		System.out.println("monthSales :  " + monthSales0);

		List<HashMap<Object, Object>> monthSales1 = new ArrayList<HashMap<Object, Object>>();
		monthSales1 = service.getMonthSales1();

		req.setAttribute("monthSales1", monthSales1);
		System.out.println("monthSales :  " + monthSales1);

		List<HashMap<Object, Object>> monthSales2 = new ArrayList<HashMap<Object, Object>>();
		monthSales2 = service.getMonthSales2();

		req.setAttribute("monthSales2", monthSales2);
		System.out.println("monthSales :  " + monthSales2);

		List<HashMap<Object, Object>> monthSales3 = new ArrayList<HashMap<Object, Object>>();
		monthSales3 = service.getMonthSales3();

		req.setAttribute("monthSales3", monthSales3);
		System.out.println("monthSales :  " + monthSales3);

		List<HashMap<Object, Object>> monthSales4 = new ArrayList<HashMap<Object, Object>>();
		monthSales4 = service.getMonthSales4();

		req.setAttribute("monthSales4", monthSales4);
		System.out.println("monthSales :  " + monthSales4);

		return "admin/boardCnt.tiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/boardCnt.jsp 파일을 생성한다.
	};

	// 스터디룸 등록할시 지도를 보여주는 
	@RequestMapping(value = "/admin/searchMap.action", method = { RequestMethod.GET })
	public String searchmap (HttpServletRequest req) {

		
		
		 return "searchmap.notiles";
		// /Board/src/main/webapp/WEB-INF/views/admin/delEnd.jsp 파일을 생성한다.

	};
	
	
	
	
	
}
