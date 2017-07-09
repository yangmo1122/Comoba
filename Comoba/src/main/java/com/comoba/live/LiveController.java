package com.comoba.live;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comoba.common.FileManager;
import com.comoba.live.service.LiveService;
import com.comoba.main.model.MemberVO;
import com.comoba.main.service.MainService;
import com.comoba.ourroom.model.CommentVO;

@Controller
@Component
public class LiveController {

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private LiveService service;
	
	@Autowired
	private MainService mservice;
	
	// ==== #130. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection)
	@Autowired
	private FileManager fileManager;
	
    // ===== 라이브페이지 폼 요청
    @RequestMapping(value="/live/live.action", method={RequestMethod.GET})
	public String live(HttpServletRequest req, HttpSession session){
		
    	List<HashMap<String, String>> onairlist = service.getOnairlist(); // 생방송 중인 공라이브 가져오기 
    	
    	 session.setAttribute("readCountPermission", "yes");
 	    /*
 	     	공라이브 페이지(live.action)에 접속하면
 	     	세션의 "readCountPermission"에 값은 "yes"로 되어진다.
 	     */
    	
    	req.setAttribute("onairlist", onairlist);
		return "live/live.tiles";
		// /Comoba/src/main/webapp/WEB-INF/views/live/live.jsp
	}
    
    // ===== 라이브 상세 페이지 폼 요청
    @RequestMapping(value="/live/livedetail.action", method={RequestMethod.GET})
	public String livedetail(HttpServletRequest req, HttpSession session){
		
    	String live_no = req.getParameter("live_no"); // 라이브 번호 가져오기
    	String memberno = req.getParameter("memberno"); // 회원번호 가져오기
    	
    	System.out.println(live_no);
    	System.out.println(memberno);
    	
    	MemberVO membervo = mservice.getMemberinfo(memberno); // 회원번호에 해당하는 회원 정보 가져오기
    	System.out.println(membervo.getNickname());
    	int onaircnt = service.getOnaircnt(live_no); // 라이브 방송 횟수 가져오기
    	System.out.println(onaircnt);
    	List<HashMap<String, String>> filelist = service.getaddfile(live_no); // 첨부파일 가져오기
    	double stars = service.getStars(live_no); // 별점 가져오기
    	System.out.println("별점은! "+stars);
    	
    	// 로그인유저가 별점을 줬는지 안줬는지 검사
    	HashMap<String, String> checkmap = new HashMap<String, String>();
    	checkmap.put("memberno", memberno);
    	checkmap.put("liveno", live_no);
    	int checkstar = service.checkstar(checkmap);
    	
    	/*  글조회수(readCount)증가(DML문 update)는
		        반드시 해당 글제목을 클릭했을 경우에만 증가되고
		        웹브라우저에서 새로고침(F5)을 했을 경우에는
		        증가가 안되도록 한다.
		*/
    	HashMap<String, String> livedetail = null;
		if(session.getAttribute("readCountPermission") != null && 
		"yes".equals(session.getAttribute("readCountPermission"))){
		
			livedetail = service.getLivedetail(live_no); // 라이브 번호에 해당하는 라이브 상세 페이지 가져오기
			// 조회수(gong_views) 1증가 후 글 1개를 가져오는 것
			session.setAttribute("readCountPermission", "no");
			// session "readCountPermission" 값을 "yes"에서 "no"로 변경함.
		}
		else{
			// 새로고침(F5)을 했을 경우
			livedetail = service.getLivedetailWithnoAdd(live_no); // 라이브 번호에 해당하는 라이브 상세 페이지 가져오기
			// 조회수(gong_views) 1증가 없이 그냥 글 1개를 가져오는 것
		}
    	
		// =====댓글 내용 가져오기 ======
		List<CommentVO> commentList = service.getliveComment(live_no);
		
    	req.setAttribute("membervo", membervo);
    	req.setAttribute("onaircnt", onaircnt);
    	req.setAttribute("livedetail", livedetail);
    	req.setAttribute("filelist", filelist);
    	req.setAttribute("live_no", live_no);
    	req.setAttribute("stars", stars);
    	req.setAttribute("checkstar", checkstar);
    	req.setAttribute("commentList", commentList);
    	// 댓글 갯수 가져오기
	 	int commentcnt = service.getcommentCnt(live_no);
	 	req.setAttribute("commentcnt", commentcnt);
    	
		return "live/livedetail.tiles";
		// /Comoba/src/main/webapp/WEB-INF/views/live/livedetail.jsp
	}
    
    
    // 첨부파일 다운로드 받기 =========
 	@RequestMapping(value="/download.action", method={RequestMethod.GET})
 	public void download(HttpServletRequest req, HttpServletResponse res, HttpSession session){
    
	    String fileName = req.getParameter("fileName");
		System.out.println(fileName);
		// fileName 은 예를 들어 "2017060818362333054149451936.jsp"이다.
		
		String orgFilename = req.getParameter("orgFilename");
		System.out.println(orgFilename);
		// orgFilename 은 예를 들어 "강아지.png" 이다.
		
		// WAS 의 webapp 의 절대경로를 알아와야 한다.
		String rootpath = session.getServletContext().getRealPath("/");
		String path = rootpath + "resources" + File.separator + "files";
		// path 가 첨부파일들이 저장될 WAS(톰캣서버)의 폴더가 된다.
		
		// === 다운로드 하기 === //
		boolean bool = false;
		
		bool = fileManager.doFileDownload(fileName, orgFilename, path, res);
		// 파일다운로드가 성공이면 true 를 반납해주고,
		// 파일다운로드가 실패이면 false 를 반납해준다.
		
		if(!bool) {
			// 다운로드가 실패할 경우에만 에러메시지를 띄우도록 한다.
			
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = null;
			
			try {
				writer = res.getWriter();
				// 웹브라우저상에서 메시지를 쓰기 위한 객체(볼펜)생성.
			} catch (IOException e) {
				
			}
			
			writer.println("<script type='text/javascript'>alert('파일다운로드가 불가능 합니다!!!')</script>");  
		}// end of if------------------
    
 	}
 	
    // ===== 라이브 방송 시청횟수 올리기
    @RequestMapping(value="/live/addLiveviewcnt.action", method={RequestMethod.POST})
	public void addLiveviewcnt(HttpServletRequest req, HttpServletResponse res, HttpSession session){
		
    	String onairno = req.getParameter("onair_no");
    	System.out.println("onair_no : "+onairno);
    	service.addLiveviewcnt(onairno);
    	
	}
    
    
    // ===== 별점주기
    @RequestMapping(value="/live/givestars.action", method={RequestMethod.POST})
    @ResponseBody
	public HashMap<String, Object> givestars(HttpServletRequest req, HttpServletResponse res, HttpSession session){
		
    	session = req.getSession();
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
    	String memberno = String.valueOf(loginuser.getMemberno());
    	String liveno = req.getParameter("liveno");
    	String stars = req.getParameter("stars");
    	System.out.println(memberno + " , " + liveno + " , " + stars);
    	
    	HashMap<String, String> starmap = new HashMap<String, String>();
    	starmap.put("memberno", memberno);
    	starmap.put("liveno", liveno);
    	starmap.put("stars", stars);
    	
    	service.givestars(starmap); // 별점 주기
    	double star = service.getStars(liveno); // 별점 가져오기
    	
    	HashMap<String, Object> returnmap = new HashMap<String, Object>();
    	returnmap.put("AFTERSTARS", star);
    	
    	return returnmap;
	}
    
    // ===== 댓글쓰기  =====
    @RequestMapping(value="live/addComment.action", method={RequestMethod.GET})
    public String requireLogin_addComment(HttpServletRequest req, HttpServletResponse res, CommentVO commentvo , HttpSession session) 
    	throws Throwable { 
    	
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
	    commentvo.setMemberno_fk(req.getParameter("loginmemberno"));
	    commentvo.setTogether_no(req.getParameter("together_no"));
	    commentvo.setBoardtype(req.getParameter("boardtype"));
	    commentvo.setComment_content(req.getParameter("comment_content"));
	    commentvo.setNickname(req.getParameter("nickname"));
	    
	    String memberno = req.getParameter("memberno");
	    String liveno = req.getParameter("liveno");
	    
	    int n = service.liveaddComment(commentvo); 
	    
	    String msg = "";
	    String loc = "";
	    
	    if(n > 0){
	    	msg = "댓글 작성 성공!";
	    	loc = "livedetail.action?live_no="+liveno+"&memberno="+memberno;
	    }
	    else{
	    	msg = "댓글 작성 실패 ㅠ";
	    	loc = "javascript:history.back()";
	    }
	    
	    req.setAttribute("msg", msg);
	    req.setAttribute("loc", loc);
	    
	    return "msg.notiles";
	   
	  /* 
	    // =====댓글 내용 가져오기 ====== 
	 //	List<CommentVO> commentList = service.getliveComment(req.getParameter("together_no"));
	   List<HashMap<String, String>> commentList = service.getliveComment(req.getParameter("together_no"));
	   
	   System.out.println(">>>" + req.getParameter("together_no"));
	   
	   List<JSONObject> returnmapList = new ArrayList<JSONObject>();
	   
	   if(commentList != null) {
		   for(HashMap<String, String> datamap : commentList) {
			   JSONObject jsonObj = new JSONObject();
			   
			   jsonObj.put("J_COMMENT_CONTENT", datamap.get("COMMENT_CONTENT"));
			   jsonObj.put("J_NICKNAME", datamap.get("NICKNAME"));
			   jsonObj.put("J_COMMENT_DATE", datamap.get("COMMENT_DATE"));
			   
			   returnmapList.add(jsonObj);
		   }
	   }
	    // 댓글 갯수 가져오기
	 	//int commentcnt = service.getcommentCnt(req.getParameter("together_no"));
	 	// System.out.println(commentList);
	    //System.out.println(returnmapList);
	 	//req.setAttribute("commentcnt", commentcnt);
	   
	   for(JSONObject jobj : returnmapList) {
		   String a = (String)jobj.get("J_COMMENT_CONTENT");
		   String b = (String)jobj.get("J_NICKNAME");
		   String c = (String)jobj.get("J_COMMENT_DATE");
		   
		   System.out.println(a+", "+b+", "+c);
	   }
	 	
       req.setAttribute("returnmapList", returnmapList);
       
      // return "livedetail.notiles";
       
       return returnmapList;
    	*/
    }
    
/*
 // ===== 댓글쓰기  =====
    @RequestMapping(value="live/addComment.action", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, String>> requireLogin_addComment(HttpServletRequest req, HttpServletResponse res, CommentVO commentvo , HttpSession session) 
    	throws Throwable { 
    	
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
	    commentvo.setMemberno_fk(req.getParameter("loginmemberno"));
	    commentvo.setTogether_no(req.getParameter("together_no"));
	    commentvo.setBoardtype(req.getParameter("boardtype"));
	    commentvo.setComment_content(req.getParameter("comment_content"));
	    commentvo.setNickname(req.getParameter("nickname"));
	    
	    service.liveaddComment(commentvo); 
	   
	   
	    // =====댓글 내용 가져오기 ====== 
	 //	List<CommentVO> commentList = service.getliveComment(req.getParameter("together_no"));
	   List<HashMap<String, String>> commentList = service.getliveComment(req.getParameter("together_no"));
	   
	   System.out.println(">>>" + req.getParameter("together_no"));
	   
	   List<HashMap<String, String>> returnmapList = new ArrayList<HashMap<String, String>>();
	   
	   if(commentList != null) {
		   for(HashMap<String, String> datamap : commentList) {
			   HashMap<String, String> submap = new HashMap<String, String>();
			   
			   submap.put("J_COMMENT_CONTENT", datamap.get("COMMENT_CONTENT"));
			   submap.put("J_NICKNAME", datamap.get("NICKNAME"));
			   submap.put("J_COMMENT_DATE", datamap.get("COMMENT_DATE"));
			   
			   returnmapList.add(submap);
		   }
	   }
	    // 댓글 갯수 가져오기
	 	//int commentcnt = service.getcommentCnt(req.getParameter("together_no"));
	 	// System.out.println(commentList);
	    //System.out.println(returnmapList);
	 	//req.setAttribute("commentcnt", commentcnt);
	   
	   for(HashMap<String, String> amap : returnmapList) {
		   String a = amap.get("J_COMMENT_CONTENT");
		   String b = amap.get("J_NICKNAME");
		   String c = amap.get("J_COMMENT_DATE");
		   
		   System.out.println(a+", "+b+", "+c);
	   }
	 	
    	return returnmapList;
    	
    }     
 */
    
    
    
}
