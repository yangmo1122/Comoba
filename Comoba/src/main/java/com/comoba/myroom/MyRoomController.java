package com.comoba.myroom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.comoba.main.model.MemberVO;
import com.comoba.main.service.MainService;
import com.comoba.myroom.service.MyroomService;
import com.comoba.common.FileManager;
import com.comoba.live.service.LiveService;

@Controller
@Component
public class MyRoomController {

   // ===== 의존객체 주입하기(DI : Dependency Injection) =====
   @Autowired
   private LiveService service;
   
   @Autowired
   private MainService mservice;
   
   @Autowired
   private MyroomService myservice;
   
   @Autowired
   private FileManager fileManager;

   // ===== 스케쥴(달력) 페이지 요청
      @RequestMapping(value = "/myroom/schedule.action", method = { RequestMethod.GET })
      public String schedule(HttpServletRequest req, HttpSession session) {
         
         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
         int memberno = loginuser.getMemberno();
         
         List<HashMap<String, String>> ddayList = myservice.getdday(memberno);
         System.out.println(ddayList);
         req.setAttribute("ddayList", ddayList);
         
         return "/myroom/schedule.tiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }
      
   
      // ===== 스케쥴(달력) AJAX
      @RequestMapping(value="/myroom/getscheduleList.action", method={RequestMethod.GET})
      @ResponseBody
      public List<HashMap<String, Object>> getscheduleList(HttpServletRequest req, HttpServletResponse res) {
         
         List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>(); 
         
         HttpSession session = req.getSession();
         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
         String nowmonth = req.getParameter("sm_nowmonth");
         int memberno = loginuser.getMemberno();
         System.out.println("nowmonth//"+nowmonth);
         List<HashMap<String,String>> list = myservice.getscheduleList(Integer.toString(memberno), nowmonth);
               
            if(list != null) {
            for(HashMap<String,String> schemap : list) {
               HashMap<String, Object> submap = new HashMap<String, Object>(); 
               submap.put("SUBJECT",  schemap.get("SUBJECT"));
               submap.put("PLACE",   schemap.get("PLACE"));
               submap.put("START_DATE", schemap.get("START_DATE"));
               submap.put("START_TIME", schemap.get("START_TIME"));
               submap.put("END_DATE", schemap.get("END_DATE"));
               submap.put("END_TIME", schemap.get("END_TIME"));
               submap.put("URL", schemap.get("URL"));
               
               returnmapList.add(submap);
            }
         }
         
         
         
         return returnmapList;
      }
      
      

      // ===== DDAY 선정 AJAX
      @RequestMapping(value="/myroom/selectdday.action", method={RequestMethod.GET})
      @ResponseBody
      public int selectdday(HttpServletRequest req, HttpServletResponse res) {
         
         
         
         HttpSession session = req.getSession();
         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
         String ddayno = req.getParameter("new_ddayno");
         int memberno = loginuser.getMemberno();
         HashMap<String,String> map = new HashMap<String,String>();
         map.put("ddayno", ddayno);
         map.put("memberno", Integer.toString(memberno));
         
         
         int n = 1;
          n = myservice.selectdday(ddayno);
         
               

         return n;
      }
      
      
      // ===== 주 달력 AJAX
      @RequestMapping(value="/myroom/getcaldetailList.action", method={RequestMethod.GET})
      @ResponseBody
      public List<HashMap<String, String>> getcaldetailList(HttpServletRequest req, HttpServletResponse res) {
         
         List<HashMap<String, Object>> returnmapList = new ArrayList<HashMap<String, Object>>(); 
         
         HttpSession session = req.getSession();
         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
         String clickdate = req.getParameter("sm_clickdate");
         String clickday = req.getParameter("sm_clickday");      //요일 
         String startday = req.getParameter("sm_sunday");      //요일 
         
      
         
         
         
         int memberno = loginuser.getMemberno();
         System.out.println("nowmonth//"+clickdate);
         
         HashMap<String, String> detailmap = new HashMap<String, String>(); 
         detailmap.put("memberno", Integer.toString(memberno));
         detailmap.put("startday", startday);
         System.out.println(startday);
         List<HashMap<String,String>> list = myservice.getcaldetailList(detailmap);
               /*
            if(list != null) {
            for(HashMap<String,String> schemap : list) {
               HashMap<String, Object> submap = new HashMap<String, Object>(); 
               submap.put("SUBJECT",  schemap.get("SUBJECT"));
               submap.put("PLACE",   schemap.get("PLACE"));
               submap.put("START_DATE", schemap.get("START_DATE"));
               submap.put("START_TIME", schemap.get("START_TIME"));
               submap.put("END_DATE", schemap.get("END_DATE"));
               submap.put("END_TIME", schemap.get("END_TIME"));
               submap.put("URL", schemap.get("URL"));
               
               returnmapList.add(submap);
            }
         }
         */
         System.out.println(list);
         
         return list;
      }
      
      // ===== 스케쥴(실험) 페이지 요청
      @RequestMapping(value = "/myroom/scheduletest.action", method = { RequestMethod.GET })
      public String scheduletest(HttpServletRequest req) {

         return "/myroom/schedule_week.tiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }
      
      
      
      // ===== 스케쥴 상세 페이지 요청
      @RequestMapping(value = "/myroom/caldetail.action", method = { RequestMethod.GET })
      public String caldetail(HttpServletRequest req,  HttpSession session) {

         String clickdate = req.getParameter("sm_fulldate");
         System.out.println(clickdate);
         req.setAttribute("clickdate", clickdate);
         MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
         int intmemberno = loginuser.getMemberno();
         String memberno = Integer.toString(intmemberno);
         //DDAYLIST 뽑기 
         HashMap<String, String> ddaymap = new HashMap<String, String>(); 
         ddaymap.put("memberno", memberno);
         ddaymap.put("clickdate",  clickdate);         // 2017-07-05 이형태
         
         List<HashMap<String, String>> ddayList = myservice.getdday(ddaymap);
         req.setAttribute("ddayList", ddayList);
         
         //SCHEDULELIST 뽑기  그냥, 내용, 파일 다뽑아야함.
         List<HashMap<String, String>> scheList = myservice.scheduleAllList(memberno, clickdate); // 내용까지
         List<HashMap<String, String>> scheFileList = myservice.scheFileList(memberno, clickdate);    //파일 뽑기
         
      //   List<HashMap<String, String>> scheAllList = myservice.scheAllList(ddaymap, scheList); 
         req.setAttribute("scheList", scheList);
         req.setAttribute("scheFileList", scheFileList);
         
         //MISSIONLIST 뽑기
         List<HashMap<String, String>> missionList = myservice.missionList(ddaymap);
         
         int totalintstatus = 0;
         for(int i=0; i<missionList.size(); i++){
         String status = missionList.get(i).get("STATUS");
         int intstatus = Integer.parseInt(status);
         
         totalintstatus += intstatus;
         
         }
         req.setAttribute("totalstatus", totalintstatus);
         req.setAttribute("missionList", missionList);
         System.out.println("missionList"+missionList);
         
         return "myroom/caldetail.tiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
         
         
      }
      
      // ===== 할일 수행 페이지 요청 
         @RequestMapping(value = "/myroom/micomplete.action", method = { RequestMethod.POST })
         public String micomplete(HttpServletRequest req, HttpSession session) {

            int n = 0;
            
            String clickdate = req.getParameter("miclickdate");
            MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
            int intmemberno = loginuser.getMemberno();
            String memberno = Integer.toString(intmemberno);
            String cnt = req.getParameter("sm_cnt");
            
            
            String missionsize = req.getParameter("missionsize");
            //      1개 이상일 수 있기 때문에 배열로 받아온다. 
            System.out.println("cnt"+cnt+"//clickdate"+clickdate+"memberno"+memberno+"/missionsize/"+missionsize);
            

            // odrcode 갖고오기
            //   String odrcode = productdao.getodrcode(userid);
//               System.out.println("odrcode : " + odrcode);
                  int d = 0;
                 for (int i = 0; i < Integer.parseInt(missionsize); i++)
               {   
                    //   jsp_order_detail에 해당 상품 추가(insert)
                    String missionNum = req.getParameter("missionnum"+i);
                    if(missionNum != null){
                       d += myservice.micomplete(missionNum);
                    }
               //   d += productdao.addOrderDetail(odrcode, pnumArr[i], oqtyArr[i], salepriceArr[i]);
               System.out.println("i번째 missionNum" + missionNum);
               } // end of for (int i = 0; i <pnumArr.length; i++) ----
                 
                 
                 if (d == Integer.parseInt(cnt))
               { // 배열의 길이와 b 값이 일치하는 경우 
                  d = 1;
               }
               else 
               {
                  d = 0;
               }
            
            
            String msg = "";
              String loc = "";
              if(d==1) {
                 msg = "일정이 등록되었습니다!!";
                 loc = "schedule.action";
              }
              else {
                 msg = "다시 시도해주세요.";
                 loc = "javascript:history.back();";
              }
                    
              req.setAttribute("msg", msg);
              req.setAttribute("loc", loc);
             
              return "msg.notiles";
              // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
         }
         
         

      // ===== 스케쥴 작성 페이지 요청 (ajax안 iframe) 아마 이거 안쓰는거같은데.......
      @RequestMapping(value = "/myroom/schedulewrite.action", method = { RequestMethod.GET })
      public String schedulewrite(HttpServletRequest req) {

         return "myroom/schedulewrite.notiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }

      // ===== 스케쥴 작성 페이지 요청 (ajax안 iframe)
      @RequestMapping(value = "/myroom/schedulewriteEnd.action", method = { RequestMethod.POST })
      public String schedulewriteEnd(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {
         
         MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
         String memberno = Integer.toString(loginuser.getMemberno());
         String startdate = req.getParameter("cal_startdate");
         String starttime = req.getParameter("cal_starttime");
         String enddate = req.getParameter("cal_enddate");
         String endtime = req.getParameter("cal_endtime");
         String place = req.getParameter("cal_place");
           String url = req.getParameter("cal_url");
           String subject = req.getParameter("cal_subject");
           String content = req.getParameter("cal_content");
        
           List<MultipartFile> attachList = req.getFiles("attach2");
           System.out.println(memberno);
           System.out.println(startdate);
           System.out.println(starttime);
           System.out.println(enddate);
           System.out.println(endtime);
           System.out.println(place);
           System.out.println(url);
           System.out.println(subject);
           System.out.println(content);
           
           HashMap<String, String> map = new HashMap<String, String>();
           map.put("memberno", memberno);
           map.put("startdate", startdate);
           map.put("starttime", starttime);
           map.put("enddate", enddate);
           map.put("endtime", endtime);
           map.put("place", place);
           map.put("url", url);
           map.put("subject", subject);
           map.put("content", content);
           
          String root = session.getServletContext().getRealPath("/"); 
          String path = root + "resources"+File.separator+"files";
          // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
          
          String newFileName = "";
          // WAS(톰캣) 디스크에 저장할 파일명 
          
          byte[] bytes = null;
          // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
          
          long fileSize = 0;
          // 파일크기를 읽어오기 위한 용도
          
          List<HashMap<String, String>> schefileList = new ArrayList<HashMap<String, String>>();
          if(attachList != null) {
             
             newFileName = "";
             // WAS(톰캣) 디스크에 저장할 파일명 
             
             bytes = null;
             // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
             
             fileSize = 0;
             // 파일크기를 읽어오기 위한 용도
             
             
             for(int i=0; i<attachList.size(); i++) {
                try {
                   
                   root = session.getServletContext().getRealPath("/"); 
                   path = root + "resources"+File.separator+"files";
                   
                    bytes = attachList.get(i).getBytes();
                    
                    newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
                    
                    fileSize = attachList.get(i).getSize();
                
                    
                    HashMap<String, String> liveimage = new HashMap<String, String>();
                    
                    
                    liveimage.put("imagefilename", newFileName);
                    liveimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
                    liveimage.put("imagefileSize", String.valueOf(fileSize));
                    
                    schefileList.add(liveimage);
                    
                } catch (Exception e) {
                   
                }
                
             }// end of for-------------------------
             
          }// end of if------------------------------
           
          // **** 폼에서 입력받은 제품입력정보 값을 
             //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
                 
                  // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
                 // Service 단으로 호출하기
              
              int count = 0;
              
              int n = 0;
              int m = 0;
              System.out.println("type="+attachList.get(0).getContentType()+"//"+attachList.get(0).getName()+"//"+attachList.get(0).getOriginalFilename());
              if(attachList.get(0).getOriginalFilename().isEmpty()) { // 파일 첨부된것이 없다면
                 n = myservice.scheWrite(map); 
                 System.out.println("1");
              }
              
              else{ // 파일첨부가 되었다면
                 n = myservice.scheWrite(map); 
                 System.out.println("2");
                 if(n > 0){
                 for(int i=0; i<schefileList.size(); i++) {
                     m = myservice.addschefile(schefileList.get(i)); // 첨부파일 넣기
                     if(m==1){
                        count++;
                     }
               }
                  
                 }
                 
                if(schefileList.size() == count) {
                   n=1;
                }
                else {
                   n=0;
                }
              
                 
              }
              
         String msg = "";
              String loc = "";
              if(n==1) {
                 msg = "일정이 등록되었습니다!!";
                 loc = "schedule.action";
              }
              else {
                 msg = "다시 시도해주세요.";
                 loc = "javascript:history.back();";
              }
                    
              req.setAttribute("msg", msg);
              req.setAttribute("loc", loc);
             
              return "msg.notiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }
      
      // ===== 스케쥴 작성 페이지 요청 (ajax안 iframe)
      @RequestMapping(value = "/myroom/ddaywrite.action", method = { RequestMethod.POST })
      public String ddaywrite(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
         
         MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
         String memberno = Integer.toString(loginuser.getMemberno());
         String startdate = req.getParameter("dday_startdate");
         String starttime = req.getParameter("dday_starttime");
         String subject = req.getParameter("dday_subject");
           
         
         String sumdate = startdate + starttime;
         System.out.println(sumdate);
           System.out.println(startdate);
           System.out.println(starttime);
           System.out.println(memberno);
           System.out.println(subject);
           
           HashMap<String, String> map = new HashMap<String, String>();
           map.put("memberno", memberno);
           map.put("startdate", startdate);
           map.put("starttime", starttime);
           map.put("subject", subject);
           map.put("sumdate", sumdate);
           
         int n = 0;
         
         n = myservice.ddayWrite(map); 
         
         
         String msg = "";
           String loc = "";
           if(n==1) {
              msg = "D-DAY 설정이 완료되었습니다!!";
              loc = "schedule.action";
           }
           else {
              msg = "다시 시도해주세요.";
              loc = "javascript:history.back();";
           }
                 
           req.setAttribute("msg", msg);
           req.setAttribute("loc", loc);
          
           return "msg.notiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }
      

      // ===== 스케쥴 작성 페이지 요청 (ajax안 iframe)
      @RequestMapping(value = "/myroom/missionwrite.action", method = { RequestMethod.POST })
      public String missionwrite(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

         MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
         String memberno = Integer.toString(loginuser.getMemberno());
         String missiondate = req.getParameter("mission_date");
         String string_missioncnt = req.getParameter("missioncnt");
         int missioncnt = Integer.parseInt(string_missioncnt);
         List<String> contentList = new ArrayList<String>(); 
         for(int i=0; i<missioncnt; i++){
            String subject = req.getParameter("mission_subject"+i);
            System.out.println(subject);
            contentList.add(subject);
         }
         //String subject = req.getParameter("mission_subject0");
           
         
         System.out.println(missioncnt);
           System.out.println(missiondate);
           System.out.println(memberno);
           
           HashMap<String, String> map = new HashMap<String, String>();
           map.put("memberno", memberno);
           map.put("missiondate", missiondate);
           map.put("missioncnt", string_missioncnt);
           map.put("string_missioncnt", string_missioncnt);
           
           
         int n = 0;
         
         n = myservice.missionwrite(map, contentList); 
         
         
         String msg = "";
           String loc = "";
           if(n==1) {
              msg = "D-DAY 설정이 완료되었습니다!!";
              loc = "schedule.action";
           }
           else {
              msg = "다시 시도해주세요.";
              loc = "javascript:history.back();";
           }
                 
           req.setAttribute("msg", msg);
           req.setAttribute("loc", loc);
          
           return "msg.notiles";
         // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
      }
      
      
      
   // ===== 스케쥴 작성 페이지 요청
   @RequestMapping(value = "/myroom/calwrite.action", method = { RequestMethod.GET })
   public String calwrite(HttpServletRequest req) {

      return "/myroom/calwrite.tiles";
      // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
   }

   

   // ===== 내공부현황 페이지 요청
   @RequestMapping(value = "/myroom/state.action", method = { RequestMethod.GET })
   public String state(HttpServletRequest req) {

      return "/myroom/state.tiles";
      // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
   }

   // =====  내 방 폼 페이지 요청 
    @RequestMapping(value="/myroom/myroom.action", method={RequestMethod.GET})
    public String myroom(HttpServletRequest req, HttpSession session) {
       int show = 0;
       String string_memberno_fk = req.getParameter("memberno_fk");
       int loginmemberno = 0;
       
       String string_memberno = "";
       int memberno = 0;   
        
        
        MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
       if(string_memberno_fk != null){ // 클릭했을때
       
       
       if(loginuser == null){ // 로그인 안돼있을때
          
          string_memberno = string_memberno_fk;   //클릭한 번호
          memberno = Integer.parseInt(string_memberno);
       System.out.println("1");
       }
       else{      //로그인 되있을때
          if(loginuser.getMemberno() == Integer.parseInt(string_memberno_fk)){   //로그인 한 유저 = 클릭한 유저번호
             memberno = loginuser.getMemberno();         
             string_memberno = Integer.toString(memberno);
             show = 1;
             System.out.println("2");
             }
          else{         // 로그인 한 유저 =/ 클릭한 유저번호
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
                 int checkfollow = mservice.checkfollowing(followmap); // 팔로잉 했는지 안했는지 검사
                 req.setAttribute("checkfollow", checkfollow);
             }
          }
       }
       else{      //내방 눌러서 갔을때
          System.out.println("4");
          show = 1;
          memberno = loginuser.getMemberno();
         string_memberno = Integer.toString(memberno);
       }
       
       
       
       MemberVO membervo = mservice.getMemberinfo(string_memberno); // 회원번호에 해당하는 회원 정보 가져오기
       
       req.setAttribute("membervo", membervo);
       
       // 팔로워 수 뽑아오기
       HashMap<String, Object> cnt = service.followCnt(memberno);
       String followingcnt = (String) cnt.get("followcnt");
       String followcnt = (String) cnt.get("followingcnt");
       req.setAttribute("followcnt", followcnt);
       req.setAttribute("followingcnt", followingcnt);
       
       // 안에서 나를 팔로우한사람, 내가 팔로워한 사람 정보를 가지고 또 돌려서 저장해야해....
        List<MemberVO> followList = service.followInfo(memberno);    //내가 팔로우 한 사람 번호 뽑아서 정보까지 뽑기
        List<MemberVO> followingList = service.followingInfo(memberno);    //날 팔로우 한 사람 번호 뽑아서 정보까지 뽑기
       req.setAttribute("followList", followList);
       req.setAttribute("followingList", followingList);
    //   System.out.println("와?"+followingList.size());
       
       //내 게시물, 나만 보는 게시물 가져오기
       
       List<HashMap<String, String>> mystoryList = service.myStoryList(memberno);
       List<HashMap<String, String>> mysecretstoryList = service.mysecretStoryList(memberno);
       
      req.setAttribute("mystoryList", mystoryList);
      req.setAttribute("mysecretstoryList", mysecretstoryList);

      req.setAttribute("show", show);
       
      return "myroom/myroom.tiles";
       // /Comoba/src/main/webapp/WEB-INF/views/myroom/myroom.jsp 파일을 생성한다.
    }
    
       
    
    // ===== 팔로우하기/ 팔로우취소하기
    @RequestMapping(value="/myroom/following.action", method={RequestMethod.POST})
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
    
   /*// =====  남의 방 폼 페이지 요청 
    @RequestMapping(value="/myroom/privateroom.action", method={RequestMethod.GET})
    public String privateroom(HttpServletRequest req, HttpSession session) {
       
  //     String string_memberno_fk = req.getAttribute("memberno_fk");
   //    int memberno_fk = Integer.parseInt(string_memberno_fk);
   //   int show = 0;
       MemberVO loginuser =  (MemberVO)session.getAttribute("loginuser");
       int memberno = loginuser.getMemberno();
       if(memberno_fk == memberno){
          show = 1;
       }
       String comment = loginuser.getComments();
       System.out.println("comment="+comment);
       
       // 팔로워 수 뽑아오기
       HashMap<String, Object> cnt = service.followCnt(memberno);
       String followingcnt = (String) cnt.get("followcnt");
       String followcnt = (String) cnt.get("followingcnt");
       req.setAttribute("followcnt", followcnt);
       req.setAttribute("followingcnt", followingcnt);
       
       // 안에서 나를 팔로우한사람, 내가 팔로워한 사람 정보를 가지고 또 돌려서 저장해야해....
        List<MemberVO> followList = service.followInfo(memberno);    //내가 팔로우 한 사람 번호 뽑기
        List<MemberVO> followingList = service.followingInfo(memberno);    //날 팔로우 한 사람 번호 뽑기
       req.setAttribute("followList", followList);
       req.setAttribute("followingList", followingList);
       System.out.println("와?"+followingList.size());
       
       //내 게시물, 나만 보는 게시물 가져오기
       
       List<HashMap<String, String>> mystoryList = service.myStoryList(memberno);
      
      req.setAttribute("mystoryList", mystoryList);
//      req.setAttribute("show", show);
       
      return "myroom/myroom.tiles";
       // /Comoba/src/main/webapp/WEB-INF/views/myroom/myroom.jsp 파일을 생성한다.
    }
    */
    
    
    
    // =====  내 라이브 폼 페이지 요청 
    @RequestMapping(value="/myroom/roomlive.action", method = { RequestMethod.GET })
    public String roomlive(HttpServletRequest req, HttpSession session) {
       
       MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
       String memberno = "";
       
       String string_memberno_fk = req.getParameter("memberno");
       
       String loginmemberno = "";
       int show = 0;
       
       if(string_memberno_fk != null){ 
              
          if(loginuser == null){ // 로그인 안되있을때
             
             memberno = string_memberno_fk;   //클릭한 번호
             
          }
          else{      //로그인 되있을때
             memberno = String.valueOf(loginuser.getMemberno());
             if(loginuser.getMemberno() == Integer.parseInt(string_memberno_fk)){   //로그인 한 유저 = 클릭한 유저번호
                memberno = String.valueOf(loginuser.getMemberno());      
                show = 1;
                }
             else{         // 로그인 한 유저 =/ 클릭한 유저번호
                    memberno = string_memberno_fk;

                    loginmemberno = String.valueOf(loginuser.getMemberno());
                    req.setAttribute("loginmemberno", loginmemberno);
                    System.out.println("loginmemberno : "+ loginmemberno);
                    
                    // 팔로우 검사
                    HashMap<String, String> followmap = new HashMap<String, String>();
                    followmap.put("mymemberno", String.valueOf(loginmemberno));
                    followmap.put("followmemberno", memberno);
                    int checkfollow = mservice.checkfollowing(followmap); // 팔로잉 했는지 안했는지 검사
                    req.setAttribute("checkfollow", checkfollow);
                }
             }
       }
       else{      //내방 눌러서 갔을때
          
          memberno = String.valueOf(loginuser.getMemberno());
          show = 1;
       }
       
       
       // 회원번호에 해당하는 회원의 라이브 가져오기
       List<HashMap<String, String>> livelist = service.getLivelist(memberno);
       // 회원번호에 해당하는 회원정보 가져오기
       MemberVO membervo = mservice.getMemberinfo(memberno);
       // 회원번호에 해당하는 라이브 갯수가져오기
       int livecnt = service.getLivecnt(memberno);
       
       
       session.setAttribute("readCountPermission", "yes");
        /*
            내라이브 페이지(roomlive.action)에 접속하면
            세션의 "readCountPermission"에 값은 "yes"로 되어진다.
         */
       
       req.setAttribute("livelist", livelist);
       req.setAttribute("membervo", membervo);
       req.setAttribute("livecnt", livecnt);
       req.setAttribute("show", show);
       
       return "myroom/myroomlive.tiles";
       // /Comoba/src/main/webapp/WEB-INF/views/myroom/myroom.jsp 파일을 생성한다.
    }
    
    
    // ===== 라이브 작성 페이지 요청
    @RequestMapping(value = "/myroom/livewritemodal.action", method = { RequestMethod.GET })
    public String livewrite(HttpServletRequest req) {

       return "livewritemodal.notiles";
       // /Comoba/src/main/webapp/WEB-INF/views/intro.jsp 파일을 생성한다.
    }
    
    
    // ===== 라이브 작성 완료 페이지 요청
    @RequestMapping(value = "/myroom/livewriteEnd.action", method = { RequestMethod.POST })
    public String livewriteEnd(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {

       String nextval = service.getSequenceno();
       
       MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
       String memberno = String.valueOf(loginuser.getMemberno());
    
       MultipartFile titleimg = req.getFile("attach1"); // 대표이미지
       String title = req.getParameter("title");
       String content = req.getParameter("content");
       String link = req.getParameter("link");
       
       
       System.out.println("memberno : " + memberno);
       System.out.println("title : " + title);
       System.out.println("content : " + content);
       System.out.println("link : " + link);
       
       HashMap<String, String> maplive = new HashMap<String, String>();
       maplive.put("nextval", nextval);
       maplive.put("memberno", memberno);
       maplive.put("title", title);
       maplive.put("content", content);
       maplive.put("link", link);
       
       int n = 0;
       int m = 0;
       
       String root = session.getServletContext().getRealPath("/"); 
       String path = root + "resources"+File.separator+"files";
       // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
       
       String newFileName = "";
       // WAS(톰캣) 디스크에 저장할 파일명 
       
       byte[] bytes = null;
       // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
       
       long fileSize = 0;
       // 파일크기를 읽어오기 위한 용도
       
       HashMap<String, String> livetitleimg = new HashMap<String, String>();
       try {
          
          bytes = titleimg.getBytes();
           
          newFileName = fileManager.doFileUpload(bytes, titleimg.getOriginalFilename(), path);
           
          fileSize = titleimg.getSize();
           
          livetitleimg.put("nextval", nextval);
          livetitleimg.put("imagefilename", newFileName);
          livetitleimg.put("imageorgFilename", titleimg.getOriginalFilename());
          livetitleimg.put("imagefileSize", String.valueOf(fileSize));

       } catch (Exception e) {
          
       }
          
       
      // **** 폼에서 입력받은 제품입력정보 값을 
      //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
          
           // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
          // Service 단으로 호출하기
       
       
      n = service.writeLive(maplive);
      
      if(n > 0){
         m = service.addLivetitleimg(livetitleimg); // 대표 이미지 넣기
      }
       
       
       String msg = "";
        String loc = "";
        if(m==1) {
           msg = "라이브작성 성공!!";
           loc = "/myroom/myroomlive.tiles";
        }
        else {
           msg = "라이브작성 실패!!";
           loc = "javascript:history.back();";
        }
              
        req.setAttribute("msg", msg);
        req.setAttribute("loc", loc);
       
        return "msg.notiles";

    }
    
    
    // 라이브 수정 완료 페이지 요청
    @RequestMapping(value = "/myroom/liveeditEnd.action", method = { RequestMethod.POST })
    public String liveeditEnd(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {
    
       MultipartFile titleimg = req.getFile("attach1"); // 대표이미지
       String title = req.getParameter("title");
       String content = req.getParameter("content");
       String link = req.getParameter("link");
       String gongliveno = req.getParameter("gongliveno");

       System.out.println("title : " + title);
       System.out.println("content : " + content);
       System.out.println("link : " + link);
       System.out.println("gongliveno : " + gongliveno);
       
       HashMap<String, String> editmap = new HashMap<String, String>();
       editmap.put("title", title);
       editmap.put("content", content);
       editmap.put("link", link);
       editmap.put("gongliveno", gongliveno);
       
       int n = 0;
       int m = 0;
       
       String root = session.getServletContext().getRealPath("/"); 
       String path = root + "resources"+File.separator+"files";
       // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
       
       String newFileName = "";
       // WAS(톰캣) 디스크에 저장할 파일명 
       
       byte[] bytes = null;
       // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
       
       long fileSize = 0;
       // 파일크기를 읽어오기 위한 용도
       
       HashMap<String, String> livetitleimg = new HashMap<String, String>();
       
       if(titleimg != null){
          try {
             
             bytes = titleimg.getBytes();
              
             newFileName = fileManager.doFileUpload(bytes, titleimg.getOriginalFilename(), path);
              
             fileSize = titleimg.getSize();
             
             livetitleimg.put("imagefilename", newFileName);
             livetitleimg.put("imageorgFilename", titleimg.getOriginalFilename());
             livetitleimg.put("imagefileSize", String.valueOf(fileSize));
             livetitleimg.put("gongliveno", gongliveno);
   
          } catch (Exception e) {
             
          }
       }   
       
      // **** 폼에서 입력받은 제품입력정보 값을 
      //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
          
           // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
          // Service 단으로 호출하기
       
       
      n = service.editLive(editmap);
      
      if(n > 0 && titleimg != null){
         m = service.editLivetitleimg(livetitleimg); // 대표 이미지 수정하기
      }
       
       
       String msg = "";
        String loc = "";
        if(m==1) {
           msg = "라이브수정 성공!!";
           loc = "/myroom/myroomlive.action";
        }
        else {
           msg = "라이브수정실패!!";
           loc = "javascript:history.back();";
        }
              
        req.setAttribute("msg", msg);
        req.setAttribute("loc", loc);
       
        return "msg.notiles";

    }
    
    // 라이브 삭제페이지 요청
    @RequestMapping(value = "/myroom/deletelive.action", method = { RequestMethod.GET })
    public String deletelive(HttpServletRequest req) {

       String delliveno = req.getParameter("delliveno");
       
       int m = service.deleteLive(delliveno); // 라이브 삭제하기
       
       String msg = "";
        String loc = "";
        if(m==1) {
           msg = "라이브삭제 성공!!";
           loc = "/myroom/myroomlive.tiles";
        }
        else {
           msg = "라이브삭제 실패!!";
           loc = "javascript:history.back();";
        }
              
        req.setAttribute("msg", msg);
        req.setAttribute("loc", loc);
       
        return "msg.notiles";

       
    }
    
    
    // ===== 라이브 온에어 완료 페이지 요청
    @RequestMapping(value = "/myroom/liveonairEnd.action", method = { RequestMethod.POST })
    public String liveonairEnd(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) {

       String liveno_fk = req.getParameter("liveno_fk");
       String start = req.getParameter("start");
       String finish = req.getParameter("date");
       String link = req.getParameter("link");
       String comments = req.getParameter("comments");
       List<MultipartFile> attachList = req.getFiles("attach2");
       
       System.out.println(liveno_fk);
       System.out.println(start);
       System.out.println(finish);
       System.out.println(link);
       System.out.println(comments);
       
       HashMap<String, String> maponair = new HashMap<String, String>();
       maponair.put("liveno_fk", liveno_fk);
       maponair.put("starttime", start);
       maponair.put("finishtime", finish);
       maponair.put("gong_link", link);
       maponair.put("comments", comments);
       
      String root = session.getServletContext().getRealPath("/"); 
      String path = root + "resources"+File.separator+"files";
      // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
      
      String newFileName = "";
      // WAS(톰캣) 디스크에 저장할 파일명 
      
      byte[] bytes = null;
      // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
      
      long fileSize = 0;
      // 파일크기를 읽어오기 위한 용도
      
      List<HashMap<String, String>> liveimageList = new ArrayList<HashMap<String, String>>();
      if(!attachList.isEmpty()) {
         
         newFileName = "";
         // WAS(톰캣) 디스크에 저장할 파일명 
         
         bytes = null;
         // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
         
         fileSize = 0;
         // 파일크기를 읽어오기 위한 용도
         
         
         for(int i=0; i<attachList.size(); i++) {
            try {
               
               root = session.getServletContext().getRealPath("/"); 
               path = root + "resources"+File.separator+"files";
               
                bytes = attachList.get(i).getBytes();
                
                newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
                
                fileSize = attachList.get(i).getSize();
            
                
                
                HashMap<String, String> liveimage = new HashMap<String, String>();
                
                liveimage.put("nextval", liveno_fk);
                liveimage.put("imagefilename", newFileName);
                liveimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
                liveimage.put("imagefileSize", String.valueOf(fileSize));
                
                liveimageList.add(liveimage);
                
            } catch (Exception e) {
               
            }
            
         }// end of for-------------------------
         
      }// end of if------------------------------
       
      // **** 폼에서 입력받은 제품입력정보 값을 
         //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
             
              // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
             // Service 단으로 호출하기
          
          int count = 0;
          
          int n = 0;
          int m = 0;
          //System.out.println("bbbb" + attachList.size() + "aaaaaaaa" + attachList.get(0).getContentType() +"//"+attachList.get(0).getOriginalFilename()+"//"+attachList.get(0).getName());
          if(attachList.get(0).getOriginalFilename().isEmpty()) { // 파일 첨부된것이 없다면
             n = service.onairLive(maponair); 
          }
          else if(!attachList.get(0).getOriginalFilename().isEmpty()){
             n = service.onairLive(maponair);
             
             if(n > 0){
             for(int i=0; i<liveimageList.size(); i++) {
                 m = service.addLiveimg(liveimageList.get(i)); // 첨부파일 넣기
                 if(m==1) count++;
           }
              
             }
             
            if(liveimageList.size() == count) {
               n=1;
            }
            else {
               n=0;
            }
          
             
          }
          
          String msg = "";
           String loc = "";
           if(n==1) {
              msg = "라이브방송 시작!!";
              loc = "main/myroom/roomlive.action";
           }
           else {
              msg = "라이브방송 시작실패!!";
              loc = "javascript:history.back();";
           }
                 
           req.setAttribute("msg", msg);
           req.setAttribute("loc", loc);
          
           return "msg.notiles";
    }
  
}