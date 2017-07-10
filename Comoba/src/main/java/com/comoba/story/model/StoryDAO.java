package com.comoba.story.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.comoba.ourroom.model.CommentVO;


//===== #28. DAO 선언 =====
@Repository
public class StoryDAO implements InterStoryDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;
	

	// ===== #57. 글쓰기를 해주는 int add(BoardVO boardvo) 메소드 생성하기 =====
	@Override
	public int storywrite(HashMap<String, String> mapStory) {
		int n = sqlsession.insert("story.storywrite", mapStory);
		return n;
	}
	
	
    @Override
    public int addContents(HashMap<String, String> mapStory) {
        int n = sqlsession.insert("story.addContents", mapStory);
        return n;
    }
	
    
	//===== #138. 첨부파일이 있는 경우의 글쓰기 =====
	@Override
	public int storywrite_addFile(HashMap<String, String> mapStory_fileList) {
		int n = sqlsession.insert("story.storywrite_addFile", mapStory_fileList);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO " + n);
		
		return n;
	}
	
	
	@Override
	public int getStory_no() {
		
		int story_no = sqlsession.selectOne("story.getStory_no");

		System.out.println("확인용 => story_no : "+story_no);

		return story_no;
	}

	
	// 스토리 리스트 보여주기
	@Override
	public List<HashMap<String, String>> getListStory(HashMap<String, String> searchmap) {
		List<HashMap<String, String>> storyList = sqlsession.selectList("story.getListStory", searchmap);
		
		System.out.println("storyList@@@@ 검색" + storyList);
		
		return storyList;
	}

	// 좋아요 보여주기
	@Override
	public List<HashMap<String, String>> getListLike() {
		List<HashMap<String, String>> likeList = sqlsession.selectList("story.getListLike");
		return likeList;
	}

	
	// 스터디 상세 페이지
	@Override
	public HashMap<String, String> getstoryDetail(String story_no) {
		HashMap<String, String> storyDetailmap = sqlsession.selectOne("story.getstoryDetail", story_no);
		System.out.println("storyDetailmap@@@@@@@Dao" + storyDetailmap);
		
		return storyDetailmap;
	}

	// 스터디 상세 페이지 조회수 1증가
	@Override
	public void setAddstorycount(String story_no) {
		sqlsession.update("story.setAddstorycount", story_no);
		
	}

	
	// 스터디 상세 페이지
	@Override
	public List<HashMap<String, String>> getstoryDetailImage(String story_no) {
		List<HashMap<String, String>> storyDetailImageList = sqlsession.selectList("story.getstoryDetailImage", story_no); 
		
		return storyDetailImageList;
	}

	// 좋아요 누르면 인서트
	@Override
	public String getlikeon(HashMap<String, String> map) {
		
		String likeswitch = String.valueOf(sqlsession.insert("story.getlikeon", map));
		return likeswitch;
		
	}
	
	// 좋아요 누르면 딜리트
	@Override
	public String getlikeoff(HashMap<String, String> map) {
		
		String likeswitch = String.valueOf(sqlsession.delete("story.getlikeoff", map));
		return likeswitch;
	}

	
	// 좋아요 개수 업
	@Override
	public String getlikeUp(HashMap<String, String> map) {
		
		String likeUp = String.valueOf(sqlsession.update("story.getlikeUp", map));
		return likeUp;
		
	}


	// 좋아요 개수 다운
	@Override
	public String getlikeDown(HashMap<String, String> map) {
		
		String likeDown = String.valueOf(sqlsession.update("story.getlikeDown", map));
		return likeDown;
	}
	
	// 좋아요 개수 가져오기
	@Override
	public int getLikeNumber(HashMap<String, String> map) {
		
		int LikeNumber = sqlsession.selectOne("story.getLikeNumber", map);

		System.out.println("확인용 => getLikeNumber@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2222222222222222 : " + LikeNumber);
		System.out.println("확인용 => getLikeNumber@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2222222222222222 : " + LikeNumber);

		return LikeNumber;
	}

	
	// 첨부파일 없는 스토리 수정
	@Override
	public int storyedit(HashMap<String, String> mapEdit) {
		int n = sqlsession.update("story.storyedit", mapEdit);
		return n;
	}

	// 첨부파일 없는 스토리 수정
	@Override
	public int editContents(HashMap<String, String> mapEdit) {
		int n = sqlsession.update("story.editContents", mapEdit);
        return n;
	}
	
	// 첨부파일 있는 스토리 수정을 위한 삭제
	@Override
	public int storydelete_addFile(HashMap<String, String> mapEdit) {
		
		int n = sqlsession.delete("story.storydelete_addFile", mapEdit);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO 딜리트" + n);
		
		return n;
	}
	
	// 첨부파일 있는 스토리 수정을 위한 작성	
	@Override
	public int storyNewwrite_addFile(HashMap<String, String> mapEdit_fileList) {
		
		int n = sqlsession.insert("story.storyNewwrite_addFile", mapEdit_fileList);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO 인서트" + n);
		return n;
	}

	
	// 글삭제
	@Override
	public int storydelete(String story_no) {
		
		int n = sqlsession.update("story.storydelete", story_no);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO 딜리트" + n);
		
		return n;
	}

	// ===== #86. 댓글쓰기 =====
	@Override
	public int addComment(CommentVO commentvo) {
		int n = sqlsession.insert("story.addComment", commentvo);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAo 댓글쓰기" + n);
		
		return n;
	}

	// 댓글 내용가져오기
	@Override
	public List<CommentVO> listcomment(String story_no, RowBounds rowbounds) {
		List<CommentVO> list = sqlsession.selectList("story.listcomment", story_no, rowbounds);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 Dao listComment" + list);
		return list;
	}

	// ===== #113. 총 댓글 수 구하기
	@Override
	public int getTotalCount(String story_no) {
		int count = sqlsession.selectOne("story.getTotalCount", story_no);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO 댓글수 구하기" + count);
		
		return count;
	}
	
	// 댓글 닉네임 가져오기
	public List<String> getnickname(List<CommentVO> commentList) {
		
		List<String> getnickname = new ArrayList<String>();
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO getnickname" + getnickname);
		
		for(CommentVO covo : commentList) {
			
			String String_memberno = covo.getMemberno_fk();
			int memberno = Integer.parseInt(String_memberno);
			
			String nickname = sqlsession.selectOne("story.getnickname", memberno);
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO nickname" + nickname);
			getnickname.add(nickname);
		}
		
		
		return getnickname;
	}

	// 글게시물에 대한 멤버넘버 가져오기
	@Override
	public int getmemberno(String story_no) {
		
		int n = sqlsession.selectOne("story.getmemberno", story_no);
		
		System.out.println("@@@@@@@@@@@@@@글게시물에 대한 멤버넘버 가져오기글게시물에 대한 멤버넘버 가져오기@@@@@@@@@@@@@@@@@@@@@@@@@ " + n);
		
		return n;
		
	}


}
