package com.comoba.story.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.comoba.ourroom.model.CommentVO;
import com.comoba.story.model.StoryDAO;

//===== #30. Service 선언 =====
@Service
public class StoryService implements InterStoryService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private StoryDAO dao;

	// ===== #57. 글쓰기를 해주는 int add(BoardVO boardvo) 메소드 생성하기 =====
	@Override
	 @Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int storywrite(HashMap<String, String> mapStory) throws Throwable {
		int n = dao.storywrite(mapStory);
		int result = 0;
	   
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SERVIS 인서트" + n);
		
	
	      
	      if(n==1) {
	          result = dao.addContents(mapStory);
	      }
	      
	      return result;
	   }
	
	//===== #138. 첨부파일이 있는 경우의 글쓰기 =====
	@Override
	public int storywrite_addFile(HashMap<String, String> mapStory_fileList) {
		int n = dao.storywrite_addFile(mapStory_fileList);
		return n;
	}
	
	 // 스토리글 다음번호 따오기
	@Override
	public int getStory_no() {
		
		int story_no = dao.getStory_no();

		System.out.println("확인용 => story_no : "+story_no);

		return story_no;
	}

	// 스토리 리스트 보여주기
	@Override
	public List<HashMap<String, String>> getListStory(HashMap<String, String> searchmap) {
		
		List<HashMap<String, String>> storyList = dao.getListStory(searchmap);
		
		return storyList;
	}

	// 좋아요 리스트 보여주기
	@Override
	public List<HashMap<String, String>> getListLike() {
		
		List<HashMap<String, String>> likeList = dao.getListLike();
		
		return likeList;
	}

	
	
	// 공스토리 상세 페이지
	@Override
	public HashMap<String, String> getstoryDetail(String story_no) {
		HashMap<String, String> storyDetailmap = dao.getstoryDetail(story_no);
		return storyDetailmap;
	}

	// 공스토리 상세 페이지 조회수 1증가
	@Override
	public HashMap<String, String> getstoryDetailcount(String story_no) {
		
		dao.setAddstorycount(story_no);
		HashMap<String, String> storyDetailmap = dao.getstoryDetail(story_no);
		System.out.println("storyDetailmap@@@@@@@Ser" + storyDetailmap);
		return storyDetailmap;
	}
		
		
	// 공스토리 상세 페이지
	@Override
	public List<HashMap<String, String>> getstoryDetailImage(String story_no) {
		List<HashMap<String, String>> storyDetailImageList = dao.getstoryDetailImage(story_no);
		return storyDetailImageList;
	}
/*
	@Override
	public int likeUp(HashMap<String, String> mapLike) {
		int n = dao.likeUp(mapLike);
		return n;
	}

	@Override
	public int likeDown(HashMap<String, String> mapLike) {
		int m = dao.likeDown(mapLike);
		return m;
	}
	*/

	// 좋아요 불들어오기
	@Override
	public String getlikeon(HashMap<String, String> map) {
		String likeswitch = dao.getlikeon(map);
		return likeswitch;
	}
	
	// 멤버 테이블의 좋아요 상승
	@Override
	public String getlikeUp(HashMap<String, String> map) {
		String likeUp = dao.getlikeUp(map);
		return likeUp;
	}
	
	// 좋아요 불꺼지기
	@Override
	public String getlikeoff(HashMap<String, String> map) {
		String likeswitch = dao.getlikeoff(map);
		return likeswitch;
	}
	
	// 멤버 테이블의 좋아요 하락
	@Override
	public String getlikeDown(HashMap<String, String> map) {
		String likeDown = dao.getlikeDown(map);
		return likeDown;
	}
	
	// 좋아요 개수 가져오기
	@Override
	public int getLikeNumber(HashMap<String, String> map) {
		
		int LikeNumber = dao.getLikeNumber(map);

		System.out.println("확인용 => getLikeNumber@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@111111 : " + LikeNumber);

		return LikeNumber;
	}
	
	
	// 첨부파일 없는 글수정
	@Override
	public int storyedit(HashMap<String, String> mapEdit) {
		int n = dao.storyedit(mapEdit);
		int result = 0;
	      
	      if(n==1) {
	          result = dao.editContents(mapEdit);
	      }
	      
	      return result;
	   }
	
	
	
	// 첨부파일 있는 글수정
	@Override
	public int storydelete_addFile(HashMap<String, String> mapEdit) {
		
		int n = dao.storydelete_addFile(mapEdit);
	
	    return n;
	}
	
	@Override
	public int storyedit_addFile(HashMap<String, String> mapEdit_fileList) {
		
	    int n = dao.storyNewwrite_addFile(mapEdit_fileList);
	     
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@서비스" + n);
		
	    return n;
	}
	
	
	// 글 삭제
	@Override
	public int storydelete(String story_no) {
		
		int n = dao.storydelete(story_no);
	
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 서비스 딜리트" + n);
		
		return n;
		
	}
	
	// ===== #85. 댓글쓰기 =====
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int addComment(CommentVO commentvo) 
		throws Throwable {
		
		int n = dao.addComment(commentvo);
		return n;
	}
	
	// 댓글 내용 가져오기
	@Override
	public List<CommentVO> listcomment(String story_no, RowBounds rowbounds) {
		
		List<CommentVO> list = dao.listcomment(story_no, rowbounds);
		
		return list;
	}
	
	// ===== #112. 총 댓글 수 구하기
	@Override
	public int getTotalCount(String story_no) {
		int count = dao.getTotalCount(story_no);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Ser 댓글 수 구하기" + count);
		
		return count;
	}

	// 댓글 닉네임 가져오기
	public List<String> getnickname(List<CommentVO> commentList) {
		
		List<String> nickname = dao.getnickname(commentList);
		
		return nickname;
		
		
	}
	// 글게시물에 대한 멤버넘버 가져오기
	@Override
	public int getmemberno(String story_no) {
		
		int n = dao.getmemberno(story_no);
		
		return n;
	}

			// 스터디룸 상세페이지 가져오기
				@Override
				public HashMap<String, Object> detailView(String studyroom_no) {

					HashMap<String, Object> map = dao.detailView(studyroom_no);
					
					return map;
				}

				// 스터디룸 상세페이지 이미지 가져오기
				@Override
				public List<HashMap<String, Object>> getImgList(String studyroom_no) {
				
					List<HashMap<String, Object>> imglsit = dao.getImgList(studyroom_no);
					
					return imglsit;
				}
//스터디룸 삭제 페이지 가져오기
				@Override
	public int studyroomDel(String studyroom_no) {
		
		int n = dao.studyroomDel(studyroom_no); 
		
		return n;
	}

	

	
}
