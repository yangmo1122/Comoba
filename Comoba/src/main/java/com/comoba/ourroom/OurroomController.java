package com.comoba.ourroom;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.comoba.main.model.MemberVO;
import com.comoba.ourroom.model.BoardVO;
import com.comoba.ourroom.model.CommentVO;
import com.comoba.ourroom.model.QnaVO;
import com.comoba.admin.service.AdminService;
import com.comoba.common.FileManager;
import com.comoba.ourroom.service.OurroomService;

@Controller
@Component
public class OurroomController {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private OurroomService service;

	@Autowired
	private AdminService service2;

	// ===== #130. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI :
	// DependencyInjection) =====
	@Autowired
	private FileManager fileManager;

	// ===== 스터디룸찾기 만들기
	@RequestMapping(value = "/ourroom/studysearch.action", method = { RequestMethod.GET })
	public String studysearch(HttpServletRequest req, HttpSession session) {

		List<HashMap<String, String>> studyroommap = service.getStudyroom(); // 스터디룸
																				// 가져오기

		/*MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");*/

		
		req.setAttribute("studyroommap", studyroommap);
		
		return "ourroom/studysearch.tiles";
	}

	// ===== 스터디룸 marker 리스트 가져오기

	@RequestMapping(value = "/ourroom/searchmarker.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<HashMap<String, Object>> searchmarker(HttpServletRequest req) {

		List<HashMap<String, Object>> markerList = new ArrayList<HashMap<String, Object>>();

		String latitude = req.getParameter("latitude");
		String longitude = req.getParameter("longitude");
		System.out.println("latitude = " + latitude);
		System.out.println("longitude = " + longitude);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("latitude", latitude);
		map.put("longitude", longitude);

		List<HashMap<String, String>> searchmarkerList = service.searchmarkerList(map);
		System.out.println("##############" + searchmarkerList.size());
		if (searchmarkerList != null) {
			for (HashMap<String, String> datamap : searchmarkerList) {

				HashMap<String, Object> submap = new HashMap<String, Object>();

				submap.put("RNO", datamap.get("RNO"));
				submap.put("STUDYROOM_NAME", datamap.get("STUDYROOM_NAME"));
				submap.put("STUDYROOM_NO", datamap.get("STUDYROOM_NO"));
				System.out.println("datamap.get('STUDYROOM_NAME')" + datamap.get("STUDYROOM_NAME"));

				submap.put("ADDR1", datamap.get("ADDR1"));
				submap.put("ADDR2", datamap.get("ADDR2"));
				submap.put("HP", datamap.get("HP"));
				submap.put("COST", datamap.get("COST"));
				submap.put("TITLE", datamap.get("TITLE"));

				markerList.add(submap);
			}
		}

		return markerList;
	}

	// ===== Q&A 1:1
	@RequestMapping(value = "/ourroom/qnaoneone.action", method = { RequestMethod.GET })
	public String qnaoneone(HttpServletRequest req) {
		List<QnaVO> qnastory = service.Qnastory();
		System.out.println("qnalive" + qnastory.get(0).getTitle());
		req.setAttribute("qnastory", qnastory);
		return "ourroom/qnaoneone.tiles";
	}

	// ===== Q&A 공스토리 만들기
	@RequestMapping(value = "/ourroom/qnastory.action", method = { RequestMethod.GET })
	public String qnastory(HttpServletRequest req) {
		List<QnaVO> qnaoneone = service.Qnastory();
		System.out.println("qnalive" + qnaoneone.get(0).getTitle());
		req.setAttribute("qnastory", qnaoneone);
		return "ourroom/qnastory.tiles";
	}

	// ===== Q&A 공라이브 만들기( 안되는것 )
	@RequestMapping(value = "/ourroom/qnalive.action", method = { RequestMethod.GET })
	public String qnalive(HttpServletRequest req) {
		List<QnaVO> qnalive = service.Qnalive();
		System.out.println("qnalive" + qnalive.get(0).getTitle());
		req.setAttribute("qnalive", qnalive);
		return "ourroom/qnalive.tiles";
	}

	// ===== Q&A 내방 만들기
	@RequestMapping(value = "/ourroom/qnamyroom.action", method = { RequestMethod.GET })
	public String qnamyroom(HttpServletRequest req) {

		List<QnaVO> qnalist = service.getQnalist();

		System.out.println("qnalist" + qnalist.get(0).getTitle());
		req.setAttribute("qnalist", qnalist);

		return "ourroom/qnamyroom.tiles";
	}

	// ===== Q&A 우리방 만들기
	@RequestMapping(value = "/ourroom/qnaourroom.action", method = { RequestMethod.GET })
	public String qnaourroom(HttpServletRequest req) {

		List<QnaVO> qnaourroom = service.Qnaourroom();
		System.out.println("qnaourroom" + qnaourroom.get(0).getTitle());
		req.setAttribute("qnaourroom", qnaourroom);

		return "ourroom/qnaourroom.tiles";
	}

	// =====1:1 창 보여주기
	@RequestMapping(value = "/ourroom/oneone.action", method = { RequestMethod.GET })
	public String oneone(HttpServletRequest req) {

		return "ourroom/oneone.tiles";
	}

	// ===== 자유게시판 글목록 보여주기
	@RequestMapping(value = "/ourroom/freeboard.action", method = { RequestMethod.GET })
	public String freeboard(HttpServletRequest req, HttpSession session) {

		// --------------------페이징처리하기
		String pageNo = req.getParameter("pageNo");

		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10)
		int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
		int start = 0; // 시작 인덱스
		int offset = 0; // 뽑아 올 개수
		int startPageNo = 0; // 페이지바에서 시작될 페이지 번호
		int loop = 0; // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
		int blocksize = 5; // "페이지바" 에 보여줄 페이지의 갯수

		if (pageNo == null) {
			currentShowPageNo = 1;
			// 즉, 초기화면은 /list.action?pageNo=1 로 하겠다는 말이다.

		} else {
			currentShowPageNo = Integer.parseInt(pageNo);

		}
		String sh_colname = req.getParameter("sh_colname");// 제목 내용
		String sh_search = req.getParameter("sh_search");// 검색한 내용

		/*
		 * System.out.println(sh_colname); System.out.println(sh_search);
		 */

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("sh_colname", sh_colname);
		map.put("sh_search", sh_search);

		start = (currentShowPageNo - 1) * sizePerPage;
		offset = sizePerPage;

		RowBounds rowbounds = new RowBounds(start, offset);

		List<BoardVO> boardList = service.boardList(map, rowbounds);

		for (int i = 0; i < boardList.size(); i++) {
			System.out.println("boardvo 이미지 확인중");
			System.out.println(boardList.get(i).getFileName());

		}
		totalCount = service.getTotalCount(map);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		String pagebar = "";
		pagebar += "<ul>";

		loop = 1;

		startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;

		if (startPageNo == 1) {

			pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
		} else {

			if (sh_colname == null || sh_search == null) {

				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;",
						startPageNo - 1, blocksize);
			} else {
				// 검색어가 있는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d&sh_colname=%s&sh_search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;",
						startPageNo - 1, sh_colname, sh_search, blocksize);
			}
		}

		// **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
		while (!(loop > blocksize || startPageNo > totalPage)) {

			if (startPageNo == currentShowPageNo) {
				pagebar += String.format(
						"&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;",
						startPageNo);
			} else {
				if (sh_colname == null || sh_search == null) {
					// 검색어가 없는 경우
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d'>%d</a>&nbsp;&nbsp;",
							startPageNo, startPageNo);
				} else {
					// 검색어가 있는 경우
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d&sh_colname=%s&sh_search=%s'>%d</a>&nbsp;&nbsp;",
							startPageNo, sh_colname, sh_search, startPageNo);
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

			if (sh_colname == null || sh_search == null) {
				// 검색어가 없는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;",
						startPageNo, blocksize);
			} else {
				// 검색어가 있는 경우
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/ourroom/freeboard.action?pageNo=%d&sh_colname=%s&sh_search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;",
						startPageNo, sh_colname, sh_search, blocksize);
			}
		}

		pagebar += "</ul>";

		req.setAttribute("pagebar", pagebar);
		req.setAttribute("sh_colname", sh_colname);
		req.setAttribute("sh_search", sh_search);

		req.setAttribute("boardList", boardList);

		/*
		 * System.out.println(
		 * "asfjaslkjflkasjdfkasjdfkals;djf;lakjfkalsdjfla;sdjfkl"+ sh_colname);
		 */
		int memberCount = service.getmemberCount();
		session.setAttribute("readCountPermission", "yes");

		req.setAttribute("totalCount", totalCount);

		req.setAttribute("boardList", boardList);

		req.setAttribute("memberCount", memberCount);
		return "ourroom/freeboard.tiles";

	}

	// ===== 글 1개를 보여주는 페이지 요청하기 =====s
	@RequestMapping(value = "/view.action", method = { RequestMethod.GET })
	public String view(HttpServletRequest req, HttpSession session, BoardVO boardvo) {

		String board_no = ""; // 글쓰기 번호

		String rno = req.getParameter("rno"); // 순서

		String nextboardno = "";
		String preboardno = "";

		board_no = boardvo.getBoard_no();

		boardvo = service.getView(Integer.toString((Integer.parseInt(rno) + 1)));

		nextboardno = boardvo.getBoard_no();

		if ((Integer.parseInt(rno) - 1) == 0) {

			preboardno = Integer.toString(0);
		} else { // 1 이 아닐때
			boardvo = service.getView(Integer.toString((Integer.parseInt(rno) - 1)));
			preboardno = boardvo.getBoard_no();
		}

		if (session.getAttribute("readCountPermission") != null
				&& "yes".equals(session.getAttribute("readCountPermission"))) {

			boardvo = service.getView(rno);
			// 조회수(readCount) 1증가 후 글 1개를 가져오는 것

			service.countup(board_no); // 조회수 1증하가는 서비스

			String content = boardvo.getContent();
			content = content.replaceAll("\r\n", "<br>");

			boardvo.setContent(content);

			session.setAttribute("readCountPermission", "no");
			// session "readCountPermission" 값을 "yes"에서 "no"로 변경함.
		} else {
			// 새로고침(F5)을 했을 경우
			boardvo = service.getViewWithNoAddCount(rno);
			// 조회수(readCount) 1증가 없이 그냥 글 1개를 가져오는 것
		}

		String count = service.getCount();

		req.setAttribute("nextboardno", nextboardno);

		req.setAttribute("preboardno", preboardno);

		req.setAttribute("count", count);

		req.setAttribute("boardvo", boardvo);

		// =====댓글 내용 가져오기 ======
		List<CommentVO> commentList = service.listComment(board_no);
		System.out.println("commentList : " + commentList);
		// commetList meberno_fk 를 가지고 닉네임 가져오기
		List<String> nickname = service.getnickname(commentList);
		// System.out.println(nickname.get(0));
		req.setAttribute("commentList", commentList);
		req.setAttribute("nickname", nickname);

		return "ourroom/view.tiles";
	}

	// ===== 글수정 페이지 요청 =====
	@RequestMapping(value = "/edit.action", method = { RequestMethod.GET })
	public String requireLogin_edit(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		String board_no = req.getParameter("board_no");
		System.out.println("board_no : " + board_no);
		String rno = req.getParameter("rno");

		// 글 수정해야할 글전체 내용 가져오기
		BoardVO boardvo = service.getViewWithNoAddCount(rno);
		// 조회수(readCount) 1증가 없이 그냥 글 1개를 가져오는 것
		System.out.println("글 쓴 사람 닉네임 : " + boardvo.getNickname());
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		System.out.println("로그인한 사람 닉네임 : " + loginuser.getNickname());

		if (!loginuser.getNickname().equals(boardvo.getNickname())) {
			String msg = "다른 사용자의 글은 수정이 불가합니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

			return "msg.notiles";

		} else {
			req.setAttribute("boardvo", boardvo);
			req.setAttribute("rno", rno);

			return "ourroom/edit.tiles";

		}

	}

	// ===== #71. 글수정 페이지 완료하기 =====
	@RequestMapping(value = "/ourroom/editEnd.action", method = { RequestMethod.POST })
	public String editEnd(BoardVO boardvo, HttpServletRequest req) {

		HashMap<String, String> map = new HashMap<String, String>(); // map 에
																		// 글쓰기번호를
																		// 넣어준다

		map.put("board_no", boardvo.getBoard_no());
		map.put("subject", boardvo.getSubject());
		map.put("content", boardvo.getContent());

		System.out.println("board_no :   " + boardvo.getBoard_no());
		System.out.println("rno :   " + boardvo.getRno());
		System.out.println("boardvo.getContent() :   " + boardvo.getContent());
		System.out.println("boardvo.getSubject() :   " + boardvo.getSubject());

		int n = service.edit(map);

		req.setAttribute("n", n);
		req.setAttribute("board_no", boardvo.getBoard_no());
		req.setAttribute("rno", boardvo.getRno());

		return "ourroom/editEnd.tiles";
	}

	// ===== Q&A ======
	@RequestMapping(value = "/ourroom/qna.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest req) {

		/* Q&A 검색 */
		String sh_qnacolname = req.getParameter("sh_qnacolname");
		String sh_qnasearch = req.getParameter("sh_qnasearch");

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("sh_qnacolname", sh_qnacolname);
		map.put("sh_qnasearch", sh_qnasearch);

		int qnatotalCount = service.qnasearch(map);

		req.setAttribute("sh_qnacolname", sh_qnacolname);
		req.setAttribute("sh_qnasearch", sh_qnasearch);

		System.out.println("sh_qnacolname" + sh_qnacolname);
		System.out.println("sh_qnasearch" + sh_qnasearch);

		return "ourroom/qna.tiles";

	}

	// ===== 자유게시판 글쓰기 =====
	@RequestMapping(value = "/ourroom/add.action", method = { RequestMethod.GET })
	public String requireLogin_add(HttpServletRequest req, HttpServletResponse res) {

		return "ourroom/add.tiles";

	}

	// ==== 자유게시판 글쓰기 완료 요청하기 ====
	@RequestMapping(value = "/ourroom/addEnd.action", method = { RequestMethod.POST })

	public String addEnd(BoardVO boardvo, MultipartHttpServletRequest req, HttpSession session) {

		String nextval = service.getSequenceno();
		boardvo.setBoard_no(nextval);

		// **** 첨부파일이 있는지 없는지? ****
		if (!boardvo.getAttach().isEmpty()) {
			String rootpath = session.getServletContext().getRealPath("/");
			String path = rootpath + "resources" + File.separator + "files";

			String newFileName = "";
			// WAS(톰캣) 디스크에 저장한 파일명이다.

			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도.

			long filesize = 0;
			// 파일크기를 읽어오기 위한 용도.

			try {

				bytes = boardvo.getAttach().getBytes();

				newFileName = fileManager.doFileUpload(bytes, boardvo.getAttach().getOriginalFilename(), path);

				boardvo.setFileName(newFileName);

				boardvo.setOrgFilename(boardvo.getAttach().getOriginalFilename());

				filesize = boardvo.getAttach().getSize();

				boardvo.setFileSize(String.valueOf(filesize));

			} catch (Exception e) {

			}

		}

		// 파일 첨부가 있든 없든
		int n = service.add(boardvo);

		// 파일 첨부가 있으면
		if (!boardvo.getAttach().isEmpty()) {
			n = service.add_withFile(boardvo);
		}

		req.setAttribute("n", n);

		return "ourroom/addEnd.tiles";

	}

	// ===== 게시글 만들기
	@RequestMapping(value = "/ourroom/qnalist.action", method = { RequestMethod.GET })
	public String qnalist(HttpServletRequest req) {

		return "ourroom/qnalist.tiles";

	}

	// ===== #84. 댓글쓰기 =====
	@RequestMapping(value = "/addComment.action", method = { RequestMethod.GET })
	public String requireLogin_addComment(HttpServletRequest req, HttpServletResponse res, CommentVO commentvo,
			HttpSession session) throws Throwable {

		String rno = req.getParameter("rno");

		System.out.println("rno : " + rno);

		req.getParameter("together_no");

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		commentvo.setMemberno_fk(Integer.toString(loginuser.getMemberno()));
		commentvo.setTogether_no(req.getParameter("together_no"));
		commentvo.setBoardtype(req.getParameter("boardtype"));
		commentvo.setComment_content(req.getParameter("comment_content"));

		int result = service.addComment(commentvo);

		if (result != 0) {
			req.setAttribute("msg", "댓글쓰기가 완료되었습니다.");

			System.out.println("여긴왔지");
		} else {
			req.setAttribute("msg", "댓글쓰기 실패되었습니다.");
		}

		String seq = commentvo.getTogether_no(); // 댓글에 대한 원게시물 글번호( parentSeq;
													// // 원게시물 글번호 )
		req.setAttribute("seq", seq);
		req.setAttribute("rno", rno);

		return "ourroom/addCommentEnd.tiles";

	}

	// ===== #145. 첨부파일 다운로드 받기 =====
	@RequestMapping(value = "ourroom/download.action", method = { RequestMethod.GET })
	public void requireLogin_download(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		String board_no = req.getParameter("board_no");

		BoardVO boardvo = service.getViewWithNoAddCount(board_no);

		String fileName = boardvo.getFileName();
		// fileName 은 예를들어 "2017060818081932452483099304.jpg" 이다.

		String orgFilename = boardvo.getOrgFilename();
		// orgFilename 은 예를들어 "강아지.png" 이다.

		// WAS 의 webapp 의 절대경로를 알아와야 한다.
		String rootpath = session.getServletContext().getRealPath("/");
		String path = rootpath + "resources" + File.separator + "files";
		// path 가 첨부파일들이 저장될 WAS(톰캣서버)의 폴더가 된다.

		// === 다운로드 하기 === //
		boolean bool = false;

		bool = fileManager.doFileDownload(fileName, orgFilename, path, res);
		// 파일다운로드가 성공이면 true 를 반납해주고,
		// 파일다운로드가 실패이면 false 를 반납해준다.

		// System.out.println(">>>> 확인용 bool : " + bool);

		if (!bool) {
			// 다운로드가 실패할 경우에만 에러메시지를 띄우도록 한다.

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = null;

			try {
				writer = res.getWriter();
				// 웹브라우저상에서 메시지를 쓰기 위한 객체(볼펜)생성.
			} catch (IOException e) {

			}

			writer.println("<script type='text/javascript'>alert('파일다운로드가 불가능 합니다!!!')</script>");
		}

	}

	// ===== 댓글수정 페이지 요청 =====

	@RequestMapping(value = "ourroom/commentedit.action", method = { RequestMethod.GET })
	public String requireLogin_commentedit(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		String comment_no = req.getParameter("comment_no");
		String memberno_fk = req.getParameter("memberno_fk");
		String nickname = req.getParameter("nickname");
		String comment_content = req.getParameter("comment_content");

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 들어오나" + comment_no);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 들어오나" + memberno_fk);

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		if (!(Integer.parseInt(memberno_fk) == (loginuser.getMemberno()))) {
			String msg = "다른 사용자의 댓글은 수정이 불가능합니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

			return "msg.notiles";

		} else {

			HashMap<String, String> map = new HashMap<String, String>();

			map.put("comment_no", comment_no);
			map.put("memberno_fk", memberno_fk);
			map.put("nickname", nickname);
			map.put("comment_content", comment_content);

			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@map" + map);

			// String commentselect =
			// String.valueOf(service.getcommentselectone(map));
			// System.out.println("commentselect"+ commentselect);

			// req.setAttribute("commentselect", commentselect);
			// req.setAttribute("comment_no", comment_no);
			req.setAttribute("commentlist", map);

			return "ourroom/commentedit.tiles";
		}
	}

	// ===== #76. 댓글삭제 페이지 요청 =====
	@RequestMapping(value = "/ourroom/commentdel.action", method = { RequestMethod.GET })
	public String requireLogin_commentdel(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		String comment_no = req.getParameter("comment_no");
		String memberno_fk = req.getParameter("memberno_fk");
		String together_no = req.getParameter("together_no");
		String rno = req.getParameter("rno");

		System.out.println("comment_no   : " + comment_no);
		System.out.println("memberno_fk  : " + memberno_fk);
		System.out.println("together_no  : " + together_no);
		System.out.println("rno	  : " + rno);

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		if (!(Integer.parseInt(memberno_fk) == (loginuser.getMemberno()))) { // ==
																				// int
																				// 끼리
																				// 비교
																				// 할때
																				// ,
																				// equls
																				// String
																				// 끼리
																				// 비교할때
			String msg = "다른 사용자의 댓글은 삭제가 불가합니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

			return "msg.notiles";

		} else {

			HashMap<String, String> map = new HashMap<String, String>();

			map.put("comment_no", comment_no);
			map.put("memberno_fk", memberno_fk);

			int del = service.commentdel(map);

			if (del != 1) {
				String msg = "삭제 실패 하였습니다.";
				String loc = "javascript:history.back()";

				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);

				return "msg.notiles";

			} else {
				String msg = "삭제 성공 하였습니다.";
				String loc = "/main/view.action?rno=" + rno + "&board_no=" + together_no;

				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);

				return "msg.notiles";

			}
		}
	}

	// ===== #76. 글삭제 페이지 요청 =====
	@RequestMapping(value = "/ourroom/del.action", method = { RequestMethod.GET })
	public String requireLogin_del(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		String board_no = req.getParameter("board_no");
		String memberno_fk = req.getParameter("memberno_fk");

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		if (!(Integer.parseInt(memberno_fk) == (loginuser.getMemberno()))) { // ==
																				// int
																				// 끼리
																				// 비교
																				// 할때
																				// ,
																				// equls
																				// String
																				// 끼리
																				// 비교할때
			String msg = "다른 사용자의 글은 삭제가 불가합니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);

			return "msg.notiles";

		} else {

			HashMap<String, String> map = new HashMap<String, String>();

			map.put("board_no", board_no);
			map.put("memberno_fk", memberno_fk);

			int del = service.del(map);

			if (del != 1) {
				String msg = "삭제 실패 하였습니다.";
				String loc = "javascript:history.back()";

				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);

				return "msg.notiles";

			} else {
				String msg = "삭제 성공 하였습니다.";
				String loc = "/main/ourroom/freeboard.action";

				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);

				return "msg.notiles";

			}
		}
	}
}
