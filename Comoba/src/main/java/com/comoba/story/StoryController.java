package com.comoba.story;



import java.io.File;
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

import com.comoba.common.FileManager;
import com.comoba.main.ThumbnailManager;
import com.comoba.main.model.MemberVO;
import com.comoba.main.service.MainService;
import com.comoba.ourroom.model.CommentVO;
import com.comoba.story.service.StoryService;


@Controller
@Component
public class StoryController{

	// ===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private StoryService service;

	@Autowired
	private MainService mservice;

//  ===== #130. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) =====
    @Autowired
    private FileManager fileManager;
	
 // ===== #166. 썸네일을 다루어주는 클래스 의존객체 주입하기(DI: Dependency Injection) =====
 	@Autowired
 	private ThumbnailManager thumbnailManager;
 	

	// ===== #167. 다중파일을 첨부해줄 수 있는 글쓰기 폼페이지 요청.
 	@RequestMapping(value="/myroom/storywrite.action", method={RequestMethod.GET} ) 
 	public String storywrite(HttpServletRequest req, HttpServletResponse res) {
 		
 		return "myroom/storywrite.tiles";
 	}
	
	
	// 글쓰기 완료
	@RequestMapping(value="/myroom/storywriteEnd.action", method={RequestMethod.POST} ) 
	public String storywriteEnd(MultipartHttpServletRequest req, HttpServletResponse res) throws Throwable {
		 
		String story_no = String.valueOf(service.getStory_no()); // 먼저 제품일련번호 채번해오기
		
		String memberno_fk = req.getParameter("memberno_fk");
		String story_publicStatus = req.getParameter("story_publicStatus");
		String story_contents = req.getParameter("story_contents");
		String story_tag = req.getParameter("story_tag");
		List<MultipartFile> attachList = req.getFiles("attach");
		
		HashMap<String, String> mapStory = new HashMap<String, String>();
		mapStory.put("story_no", story_no);
		mapStory.put("story_publicStatus", story_publicStatus);
		mapStory.put("memberno_fk", memberno_fk);
		mapStory.put("story_contents", story_contents);
		mapStory.put("story_tag", story_tag);
		
		System.out.println("확인용 => story_no" + story_no);
		System.out.println("확인용 => story_publicStatus" + story_publicStatus);
		System.out.println("확인용 => memberno_fk" + memberno_fk);
		System.out.println("확인용 => story_contents" + story_contents);
		System.out.println("확인용 => story_tag" + story_tag);
		
		
		List<HashMap<String, String>> mapStory_fileList = new ArrayList<HashMap<String, String>>();
		if(attachList != null) {
			// WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"files";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			String newFileName = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
			
			long fileSize = 0;
			// 파일크기를 읽어오기 위한 용도
			
			String thumbnailFileName = ""; 
			// WAS 디스크에 저장될 thumbnail 파일명 
			
			for(int i=0; i<attachList.size(); i++) {
				try {
					 bytes = attachList.get(i).getBytes();
					 
					 newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
					 
					 fileSize = attachList.get(i).getSize();
					 
					// === >>>> thumbnail 파일 생성을 위한 작업 <<<<    =========  //
					 thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path); 
					// ===================================================  //
					 
					 HashMap<String, String> mapStory_file = new HashMap<String, String>();
					 
					 mapStory_file.put("story_no", story_no);
					 mapStory_file.put("fileName", newFileName);
					 mapStory_file.put("orgFilename", attachList.get(i).getOriginalFilename());
					 mapStory_file.put("fileSize", String.valueOf(fileSize));
					 mapStory_file.put("thumbnailFileName", thumbnailFileName);
					 
					 
					 System.out.println("story_no"+ story_no  );
					 System.out.println("filen	ame"+ newFileName  );
					 System.out.println("orgFilename"+ attachList.get(i).getOriginalFilename()  );
					 System.out.println("fileSize"+ String.valueOf(fileSize)  );
					 System.out.println("thumbnailFileName"+ thumbnailFileName  );
					 
					 mapStory_fileList.add(mapStory_file);
					 
				} catch (Exception e) {
					
				}
				
			}// end of for-------------------------
			
		}// end of if------------------------------
		
		
	  // **** 폼에서 입력받은 제품입력정보 값을 
	  //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
		   
	       // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
		   // Service 단으로 호출하기
		   int n = 0;
		   int m = 0;
		   int count = 0;
		   
		   if(attachList == null) { // 파일 첨부된것이 없다면
			   n = service.storywrite(mapStory);
			   
		   }
		   else if(attachList != null) { // 파일 첨부된것이 있다면
			   n = service.storywrite(mapStory);
			   
			   for(int i=0; i<mapStory_fileList.size(); i++) {
				   m = service.storywrite_addFile(mapStory_fileList.get(i));
				   if(m==1) count++;
			   }
			   
			   if(mapStory_fileList.size() == count) {
				   n=1;
			   }
			   else {
				   n=0;
			   }
		   }
		   			   
		   String msg = "";
		   String loc = "";
		   if(n==1) {
			   msg = "스토리 성공!!";
			   loc = "/main/myroom/myroom.action;";
		   }
		   else {
			   msg = "스토리 실패!!";
			   loc = "javascript:history.back();";
		   }
		    		
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
			
		   return "msg.notiles";
	}
	
	// 스토리 리스트 보여주기
	@RequestMapping(value="/story/story.action", method={RequestMethod.GET} ) 
	public String listStory(HttpServletRequest req, HttpSession session) {
	
		String colname = req.getParameter("colname");
    	String search = req.getParameter("search");
    	
    	System.out.println("search@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@search" + search);
    	System.out.println("search@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@colname" + colname);
    	
    	session.setAttribute("readCountPermission", "yes");
    	
    	HashMap<String, String> searchmap = new HashMap<String, String>();
    	searchmap.put("colname", colname);
    	searchmap.put("search", search);
		
		// 스토리 리스트
		List<HashMap<String, String>> storyList = service.getListStory(searchmap);
	

		
		req.setAttribute("storyList", storyList);
	
    	
		// 좋아요 리스트
		List<HashMap<String, String>> likeList = service.getListLike();
		
		req.setAttribute("likeList", likeList);
		
		
		return "story/story.tiles";
	}
	
	// >>> Ajax 
    //     썸네일 이미지 클릭시 spring_productimag 테이블에 저장된 원래크기의 이미지 파일이름을  
    //     조회해 와서 JSON 타입으로 변경하여 넘겨주는 요청 생성하기
    @RequestMapping(value="/story/getlikeswitch.action", method={RequestMethod.POST} ) 
    @ResponseBody
    public HashMap<String, String> getlikeswitch(HttpServletRequest req) {
		/*
		String fk_prodseq = req.getParameter("fk_prodseq");               // 제품번호(fk_prodseq)
		String thumbnailFileName = req.getParameter("thumbnailFileName"); // 썸네일파일명
		*/
    	String likecount = req.getParameter("likecount");
		String likeStory_no = req.getParameter("likestory_no");
		String likeMemberno = req.getParameter("likememberno");
		
		System.out.println("ajax@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + Integer.parseInt(likecount));
		System.out.println("ajax@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + likecount);
		System.out.println("ajax@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + likeStory_no);
		System.out.println("ajax@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + likeMemberno);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("likecount", likecount);
		map.put("likeStory_no", likeStory_no);
		map.put("likeMemberno", likeMemberno);
		
		HashMap<String, String> returnmap = new HashMap<String, String>(); 
		
		if( Integer.parseInt(likecount) == 1) {
			
			String likeDown = service.getlikeDown(map);
			
			returnmap.put("likeDown", likeDown);
			
			String likeswitch = service.getlikeoff(map); 
			
			returnmap.put("likeswitch", likeswitch);
			
			
		}
		else if ( Integer.parseInt(likecount) == 0){
			
			String likeUp = service.getlikeUp(map);
			
			returnmap.put("likeUp", likeUp);
			
			String likeswitch = service.getlikeon(map); 
			
			returnmap.put("likeswitch", likeswitch);
			
			
		}
		
		returnmap.put("Story_no", likeStory_no);
		
		int LikeNumber = service.getLikeNumber(map); // 좋아요 개수 가져오기
		returnmap.put("LikeNumber", String.valueOf(LikeNumber));
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2returnmapreturnmapreturnmapreturnmapreturnmapreturnmap2" + returnmap);
		
		return returnmap;
		
		
		
	}// end of getLargeImgFilename(HttpServletRequest req)------------------
	
	
	// 공스토리 상세 페이지
	@RequestMapping(value="/story/storydetail.action", method={RequestMethod.GET} ) 
	public String storyDetail(HttpServletRequest req, HttpSession session) {
	
		String story_no = req.getParameter("story_no");
		
		System.out.println("story_no" + story_no);
		
		if(session.getAttribute("readCountPermission") != null && 
				"yes".equals(session.getAttribute("readCountPermission"))){
				
					HashMap<String, String> storyDetailmap = service.getstoryDetailcount(story_no);
					System.out.println("storyDetailmap@@@@@@@Con" + storyDetailmap);
					req.setAttribute("storyDetailmap", storyDetailmap);
					// 조회수(gong_views) 1증가 후 글 1개를 가져오는 것

					List<HashMap<String, String>> storyDetailImageList = service.getstoryDetailImage(story_no);
					req.setAttribute("storyDetailImageList", storyDetailImageList);
					
					session.setAttribute("readCountPermission", "no");
					// session "readCountPermission" 값을 "yes"에서 "no"로 변경함.
				}
				else{
					// 새로고침(F5)을 했을 경우
					HashMap<String, String> storyDetailmap = service.getstoryDetail(story_no);
					req.setAttribute("storyDetailmap", storyDetailmap);
					
					List<HashMap<String, String>> storyDetailImageList = service.getstoryDetailImage(story_no);
					req.setAttribute("storyDetailImageList", storyDetailImageList);
					// 조회수(gong_views) 1증가 없이 그냥 글 1개를 가져오는 것
					
				}
		
		int show = 0;
    	String string_memberno_fk = req.getParameter("memberno");
    	
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@show" + show);
    	
    	System.out.println("string_memberno_fkstring_memberno_fkstring_memberno_fkstring_memberno_fk" + string_memberno_fk);
    	
    	int loginmemberno = 0;
    	
    	String string_memberno = "";
    	int memberno = 0;	
     	
     	MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
    	if(string_memberno_fk != null){ // 클릭했을때
       
    	
    	if(loginuser == null){ // 로그인 안되있을때
    		
    		string_memberno = string_memberno_fk;	//클릭한 번호
    		memberno = Integer.parseInt(string_memberno);
    	System.out.println("1");
    	}
    	else{		//로그인 되있을때
    		if(loginuser.getMemberno() == Integer.parseInt(string_memberno_fk)){	//로그인 한 유저 = 클릭한 유저번호
    			memberno = loginuser.getMemberno();			
    			string_memberno = Integer.toString(memberno);
    			show = 1;
    			System.out.println("2");
    			}
    		else{			// 로그인 한 유저 =/ 클릭한 유저번호
	        		string_memberno = string_memberno_fk;
	        		memberno = Integer.parseInt(string_memberno);
	        		System.out.println("3");
	        		loginmemberno = loginuser.getMemberno();
	        		req.setAttribute("loginmemberno", loginmemberno);
	        		System.out.println("loginmemberno : "+ loginmemberno);
	        		
	        		// 팔로우 검사
	        		HashMap<String, String> followmap = new HashMap<String, String>();
	        		followmap.put("mymemberno", String.valueOf(loginmemberno));
	        		followmap.put("followmemberno", string_memberno);
	        		
	        		System.out.println("mymembernomymembernomymembernomymemberno" + String.valueOf(loginmemberno));
	        		System.out.println("string_membernostring_membernostring_memberno" + string_memberno);
	        		
	        		int checkfollow = mservice.checkfollowing(followmap); // 팔로잉 했는지 안했는지 검사
	        		
	        		System.out.println("checkfollow@@@@@checkfollowcheckfollowcheckfollow" + checkfollow);
	        		req.setAttribute("checkfollow", checkfollow);
    			}
    		}
    	}
    	
		// 좋아요
		List<HashMap<String, String>> likeList = service.getListLike();
		
		req.setAttribute("likeList", likeList);
		
		
		// --------------------페이징처리하기 //
		String pageNo = req.getParameter("pageNo");

		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 2; // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10)
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
		
		start = (currentShowPageNo - 1) * sizePerPage;
		offset = sizePerPage;
		
		RowBounds rowbounds = new RowBounds(start, offset);
		
		// =====댓글 내용 가져오기 ======
		List<CommentVO> commentList = service.listcomment(story_no, rowbounds);

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@CON commentList" + commentList);
		
		/*for( int i = 0 ; i<commentList.size(); i ++){
			
		}*/
		totalCount = service.getTotalCount(story_no);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@댓글 수 가져오기 CON totalCount" + totalCount);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		String pagebar = "";
		pagebar += "<ul>";

		loop = 1;

		
		startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;

		if (startPageNo == 1) {
			
			pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
			
		} else {
			
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/story/storydetail.action?story_no="+story_no+"&pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;",
						startPageNo - 1, blocksize);	
		}
		// **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
		while (!(loop > blocksize || startPageNo > totalPage)) {

			if (startPageNo == currentShowPageNo) {
				pagebar += String.format(
						"&nbsp;&nbsp;<span style='color:red;'><&nbsp;&nbsp;%d&nbsp;&nbsp;></span>&nbsp;&nbsp;",
						startPageNo);
				
			} else {
				
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='/main/story/storydetail.action?story_no="+story_no+"&pageNo=%d'><&nbsp;&nbsp;%d&nbsp;&nbsp;></a>&nbsp;&nbsp;",
							startPageNo, startPageNo); 
			}

			loop++;
			startPageNo++;

		} // end of while--------------------
		// **** 다음5페이지 만들기 ****
		if (startPageNo > totalPage) {
			// 마지막 페이지바에 도달한 경우
			pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
			
		} else {
			
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/main/story/storydetail.action?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;",
						startPageNo, blocksize); 
		}
		
		pagebar += "</ul>";

		req.setAttribute("pagebar", pagebar);
		
		// commetList meberno_fk 를 가지고 닉네임 가져오기
		List<String> nickname = service.getnickname(commentList);
		
		
		req.setAttribute("nickname", nickname);
		req.setAttribute("commentList", commentList);
		
		
		return "story/storydetail.tiles";
	}
	
	
	
	// ===== 팔로우하기/ 팔로우취소하기
	   @RequestMapping(value="/story/following.action", method={RequestMethod.POST})
	   public void following(HttpServletRequest req, HttpServletResponse res, HttpSession session){
	      
	       String followmemberno = req.getParameter("followmemberno");
	       String mymemberno = req.getParameter("mymemberno");
	       String checkfollow = req.getParameter("checkfollow");
	       
	       System.out.println("followmemberno : "+followmemberno);
	       System.out.println("mymemberno : " + mymemberno);
	       System.out.println("checkfollow : " + checkfollow);
	       
	       HashMap<String, String> followmap = new HashMap<String, String>();
	       followmap.put("followmemberno", followmemberno);
	       followmap.put("mymemberno", mymemberno);
	       
	       if(checkfollow.equals("0")){
	          mservice.following(followmap); // 팔로우하기
	       }
	       else if(checkfollow.equals("1")){
	          mservice.unfollowing(followmap); // 팔로우취소하기
	       }
	       
	       
	   }
	
	
	   
	   
	// ===== #70. 글수정 페이지 요청 =====
    @RequestMapping(value="/story/storyedit.action", method={RequestMethod.GET})
    public String storyEdit(HttpServletRequest req, HttpServletResponse res, HttpSession session) { 
    	
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
    	String story_no = req.getParameter("story_no");
    	
    	int memberno = service.getmemberno(story_no);
    	
    	if(loginuser == null || memberno != loginuser.getMemberno()){
    	String msg = "";
		String loc = "";
		  
		   msg = "수정 권한이 없습니다.";
		   loc = "javascript:history.back();";
		   
		   
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
			
		   return "msg.notiles";
    	}
    	else {
    	
    	// 글 수정해야할 글번호 가져오기
    	
    	HashMap<String, String> storyDetailmap = service.getstoryDetail(story_no);
    	
    	req.setAttribute("storyDetailmap", storyDetailmap);
		
    	
		List<HashMap<String, String>> storyDetailImageList = service.getstoryDetailImage(story_no);
		
		req.setAttribute("storyDetailImageList", storyDetailImageList);
    	
		
		return "story/storyedit.tiles";
    	}
    	
    } 
	
    // ===== #71. 글수정 페이지 완료하기 =====
    @RequestMapping(value="/story/storyeditEnd.action", method={RequestMethod.POST})
    public String storyeditEnd(MultipartHttpServletRequest req, HttpServletResponse res) {
    	
    	String story_no = req.getParameter("story_no");
		String memberno_fk = req.getParameter("memberno_fk");
		String story_publicStatus = req.getParameter("story_publicStatus");
		String story_contents = req.getParameter("story_contents");
		String story_tag = req.getParameter("story_tag");
		List<MultipartFile> attachList = req.getFiles("attach");
		
		HashMap<String, String> mapEdit = new HashMap<String, String>();
		
		mapEdit.put("story_no", story_no);
		mapEdit.put("memberno_fk", memberno_fk);
		mapEdit.put("story_publicStatus", story_publicStatus);
		mapEdit.put("story_contents", story_contents);
		mapEdit.put("story_tag", story_tag);
		
		System.out.println("확인용 => story_no" + story_no);
		System.out.println("확인용 => story_publicStatus" + story_publicStatus);
		System.out.println("확인용 => memberno_fk" + memberno_fk);
		System.out.println("확인용 => story_contents" + story_contents);
		System.out.println("확인용 => story_tag" + story_tag);
    	
		List<HashMap<String, String>> mapEdit_fileList = new ArrayList<HashMap<String, String>>();
		if(attachList != null) {
			// WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"files";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			String newFileName = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
			
			long fileSize = 0;
			// 파일크기를 읽어오기 위한 용도
			
			String thumbnailFileName = ""; 
			// WAS 디스크에 저장될 thumbnail 파일명 
			
			for(int i=0; i<attachList.size(); i++) {
				try {
					 bytes = attachList.get(i).getBytes();
					 
					 newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
					 
					 fileSize = attachList.get(i).getSize();
					 
					// === >>>> thumbnail 파일 생성을 위한 작업 <<<<    =========  //
					 thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path); 
					// ===================================================  //
					 
					 HashMap<String, String> mapEdit_file = new HashMap<String, String>();
					 
					 mapEdit_file.put("story_no", story_no);
					 mapEdit_file.put("fileName", newFileName);
					 mapEdit_file.put("orgFilename", attachList.get(i).getOriginalFilename());
					 mapEdit_file.put("fileSize", String.valueOf(fileSize));
					 mapEdit_file.put("thumbnailFileName", thumbnailFileName);
					 
					 System.out.println("story_no"+ story_no);
					 System.out.println("filename"+ newFileName);
					 System.out.println("orgFilename"+ attachList.get(i).getOriginalFilename()  );
					 System.out.println("fileSize"+ String.valueOf(fileSize)  );
					 System.out.println("thumbnailFileName"+ thumbnailFileName  );
					 
					 mapEdit_fileList.add(mapEdit_file);
					 
				} catch (Exception e) {
					
				}
				
			}// end of for-------------------------
			
		}// end of if------------------------------
		
		   int n = 0;
		   int m = 0;
		   int count = 0;
		   
		   if(attachList == null) { // 파일 첨부된것이 없다면
			   n = service.storyedit(mapEdit);
			   
		   }
		   
		   else if(attachList != null) { // 파일 첨부된것이 있다면
			   
			   n = service.storyedit(mapEdit);
			   
			   service.storydelete_addFile(mapEdit);
			   
			   for(int i=0; i<mapEdit_fileList.size(); i++) {
				   m = service.storyedit_addFile(mapEdit_fileList.get(i));
				   System.out.println("@@@@@@@mmm"+m);
				   if(m==1) count++;
				   System.out.println("@@@@@@@mmm"+i);
			   }
			   
			   
			   if(mapEdit_fileList.size() == count) {
				   n=1;
			   }
			   else {
				   n=0;
			   }
		   }
		   			   
		   String msg = "";
		   String loc = "";
		   if(n==1) {
			   msg = "스토리 변경 성공!!";
			   loc = "/main/myroom/myroom.action;";
		   }
		   else {
			   msg = "오류!!!!";
			   loc = "javascript:history.back();";
		   }
		    		
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
			
		   return "msg.notiles";
	}
    
    
    
    // ===== #76. 글삭제 페이지 요청 =====
    @RequestMapping(value="/story/storydelete.action", method={RequestMethod.GET})
    public String storydelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) { 
    	
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
    	String story_no = req.getParameter("story_no");
    	
    	int memberno = service.getmemberno(story_no);
    	
    	if(loginuser == null || memberno != loginuser.getMemberno()){
    	String msg = "";
		String loc = "";
		  
		   msg = "수정 권한이 없습니다.";
		   loc = "javascript:history.back();";
		   
		   
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
			
		   return "msg.notiles";
    	}
    	else {
    		
    	HashMap<String, String> storyDetailmap = service.getstoryDetail(story_no);
		
    	req.setAttribute("storyDetailmap", storyDetailmap);
		
    	
		List<HashMap<String, String>> storyDetailImageList = service.getstoryDetailImage(story_no);
		
		req.setAttribute("storyDetailImageList", storyDetailImageList);
		
		
		return "story/storydelete.tiles";
      }
    } 
    
   
    
 	// ===== #76. 글삭제 페이지 요청 =====
    @RequestMapping(value="/story/storydeleteEnd.action", method={RequestMethod.POST})
    public String storydeleteEnd(MultipartHttpServletRequest req, HttpServletResponse res) { 
    	 
    	String story_no = req.getParameter("story_no");
    	/*
    	String attach = service.getattach(story_no); // 먼저 제품일련번호 채번해오기
    	*/
    	
		System.out.println("확인용 => story_no" + story_no);
		
		int n = 0;
		
		if(story_no != null){
			System.out.println("@@@@n" + n);
		n = service.storydelete(story_no);
			
		}	   
		   String msg = "";
		   String loc = "";
		   if(n > 0) {
			   msg = "스토리 삭제 성공!!";
			   loc = "/main/myroom/myroom.action;";
		   }
		   else {
			   msg = "오류입니다!!!!";
			   loc = "javascript:history.back();";
		   }
		    		
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
			
		   return "msg.notiles";
		
	}
    
    
    
   
    
    
    // ===== #84. 댓글쓰기  =====
    @RequestMapping(value="/story/comment.action", method={RequestMethod.GET})
    public String addComment(HttpServletRequest req, HttpServletResponse res, CommentVO commentvo , HttpSession session) 
    	throws Throwable {
    	
    	req.getParameter("together_no");
    	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
	    commentvo.setMemberno_fk(Integer.toString(loginuser.getMemberno()));
	    commentvo.setTogether_no(req.getParameter("together_no"));
	    commentvo.setBoardtype(req.getParameter("boardtype"));
	    commentvo.setComment_content(req.getParameter("review"));
	    
	    int result = service.addComment(commentvo);
    	
    	
    	if(result != 0) {
    		req.setAttribute("msg", "댓글쓰기가 완료되었습니다.");
    	}
    	else {
    			req.setAttribute("msg", "댓글쓰기 실패되었습니다.");
    	}
    	
    	String story_no = commentvo.getTogether_no(); // 댓글에 대한 원게시물 글번호( parentSeq; // 원게시물 글번호  )
    	
    	req.setAttribute("story_no", story_no);
    	
    	return "story/commentEnd.tiles";
    	
    	}
   
    
	

	// ===== 스터디룸화면 만들기
	@RequestMapping(value = "/story/studyroom.action", method = { RequestMethod.GET })
	public String studyroom(HttpServletRequest req) {

		return "story/studyroom.tiles";
		// /Comoba/src/main/webapp/WEB-INF/views/story/studyroom.jsp 파일을 생성한다.
	}
	
	
	
	
	
	

}
