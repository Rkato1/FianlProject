package com.kh.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.vo.CampVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewFileVO;
import com.kh.review.model.vo.ReviewPageData;
import com.kh.review.model.vo.ReviewVO;
import com.kh.review.model.vo.ReviewViewData;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDao dao;

	public ReviewPageData reviewList(int reqPage) {
		//1. 게시물 구해오기
		//1-1. 한 페이지의 게시물 수 : 10개 설정
		int numPerPage = 10;
		
		//1-2. start / end
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<ReviewCampVO> list = dao.selectList(map);
		
		//2. 페이지 네비 만들기
		//2-1. 총 게시글 수
		int totalCount = dao.totalCount();
		
		//2-2. 총 페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		
		//2-3. 페이지 네비의 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//(1-1/5)*5+1 = 1
		
		//2-4. 페이지 네비를 작성할 변수 생성
		String pageNavi = "";
		
		//이전 버튼
		if(pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+(pageNo-1)+"'>이전</a>&nbsp;";
		}
		
		//숫자 버튼
		for(int i=0; i<pageNaviSize; i++) {
			//현재페이지는 다시 안눌리게하는 조건
			if(pageNo != reqPage) {
				//<a href='/noticeList.do?reqPage=1'>1</a>
				pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+pageNo+"'>"+pageNo+"</a>&nbsp;";
			} else {
				pageNavi += "<span class='btn btn-dark'>"+pageNo+"</span>&nbsp;";
			}
			//한개를 출력하고 나면 pageNo를 늘려주기
			pageNo++;
			
			//더 이상의 게시물이 없으면 페이지도 필요없음
			//출력한 페이지가 totalPage면 for문 중단
			if(pageNo > totalPage) {
				break;
			}
		}
		
		//다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		ReviewPageData rpd = new ReviewPageData(list, pageNavi);
		return rpd;
	}
	
	public ReviewPageData searchKeyword(int reqPage, String keyword) {
		//1. 게시물 구해오기
		//1-1. 한 페이지의 게시물 수 : 10개 설정
		int numPerPage = 10;
		
		//1-2. start / end
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		//테이블 조회 해오기
		ArrayList<ReviewCampVO> list = dao.searchKeyword(map);
		
		//2. 페이지 네비 만들기
		//2-1. 총 게시글 수
		int totalCount = dao.totalCountKeyword(keyword);
		
		//2-2. 총 페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage == 0) { //총 게시글 수가  10개 단위일 때
			totalPage = totalCount/numPerPage;
		} else { //총 게시글 수가  10개 단위가 아니면 페이지 하나 더 추가
			totalPage = totalCount/numPerPage+1;
		}
		
		//2-3. 페이지 네비의 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//(1-1/5)*5+1 = 1
		
		//2-4. 페이지 네비를 작성할 변수 생성
		String pageNavi = "";
		
		//이전 버튼
		if(pageNo != 1) {
			pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+(pageNo-1)+"'>이전</a>&nbsp;";
		}
		
		//숫자 버튼
		for(int i=0; i<pageNaviSize; i++) {
			//현재페이지는 다시 안눌리게하는 조건
			if(pageNo != reqPage) {
				//<a href='/noticeList.do?reqPage=1'>1</a>
				pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+pageNo+"'>"+pageNo+"</a>&nbsp;";
			} else {
				pageNavi += "<span class='btn btn-dark'>"+pageNo+"</span>&nbsp;";
			}
			//한개를 출력하고 나면 pageNo를 늘려주기
			pageNo++;
			
			//더 이상의 게시물이 없으면 페이지도 필요없음
			//출력한 페이지가 totalPage면 for문 중단
			if(pageNo > totalPage) {
				break;
			}
		}
		
		//다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn btn-outline-dark' href='reviewList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		//검색 후에 조회된 결과가 없으면 페이지 네비 없애기
		if(totalCount == 0) {
			pageNavi = "";
		}
		
		ReviewPageData rpd = new ReviewPageData(list, pageNavi);
		return rpd;
	}

	public ReviewViewData reviewView(int reviewNo) {
		//리뷰를 가져오는 dao
		ReviewVO r = dao.selectOneReview(reviewNo); 
		
		//리뷰 파일을 가져오는 dao
		if(r != null) {
			ArrayList<ReviewFileVO> fileList = dao.selectFileList(reviewNo);
			r.setFileList(fileList);
		}
		
		//리뷰의 댓글 갯수를 가져오는 dao
		int cnt = dao.selectCommentCnt(reviewNo);
		
		//리뷰의 댓글을 가져오는 dao
		ArrayList<ReviewCommentVO> list = dao.selectReviewComment(reviewNo);
		
		//만들어둔 객체를 이용해서 리턴
		ReviewViewData rvd = new ReviewViewData(r, cnt, list);
		return rvd;
	}
	
	public ArrayList<ReserveCampVO> selectListReserve(int memberNo) {
		return dao.selectListReserve(memberNo);
	}
	
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
	public CampVO selectOneCamp(int campNo) {
		return dao.selectOneCamp(campNo);
	}

	public int searchCampNo(int reviewNo) {
		return dao.searchCampNo(reviewNo);
	}
	
	public int insertReviewComment(ReviewCommentVO rc) {
		return dao.insertReviewComment(rc);
	}

	public int updateReviewComment(ReviewCommentVO rc) {
		return dao.updateReviewComment(rc);
	}

	public int deleteReviewComment(int reviewCommentNo) {
		return dao.deleteReviewComment(reviewCommentNo);
	}

	public int insertReview(ReviewVO r) {
		//예약번호로 campNo 조회하기
		int reserveNo = r.getReserveNo();
		int campNo = dao.selectCampNo(reserveNo);
		r.setCampNo(campNo);
		
		//review테이블에 작성된 글 삽입
		int result = dao.insertReview(r);
		if(result>0) {
			//글이 삽입된 후 reviewNo를 받아옴
			int reviewNo = dao.selectReviewNo();
			//받아온 reviewNo로 file테이블에 삽입 (반복문으로 여러 개 파일 등록)
			for(ReviewFileVO rfv : r.getFileList()) {
				rfv.setReviewNo(reviewNo);
				result = dao.insertReviewFile(rfv);
			}
		}
		return result;
	}



}
