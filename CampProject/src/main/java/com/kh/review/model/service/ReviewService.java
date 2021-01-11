package com.kh.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.vo.CampVO;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewCommentVO;
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

	public ReviewVO selectOneReview(int reviewNo) {
		return dao.selectOneReview(reviewNo);
	}

	public CampVO selectOneCamp(int campNo) {
		return dao.selectOneCamp(campNo);
	}

	public ReviewViewData reviewView(int reviewNo) {
		//리뷰를 가져오는 dao
		ReviewVO r = dao.reviewView(reviewNo); 
		
		//리뷰의 댓글 갯수를 가져오는 dao
		int cnt = dao.selectCommentCnt(reviewNo);
		
		//리뷰의 댓글을 가져오는 dao
		ArrayList<ReviewCommentVO> list = dao.selectReviewComment(reviewNo);
		
		//만들어둔 객체를 이용해서 리턴
		ReviewViewData rvd = new ReviewViewData(r, cnt, list);
		return rvd;
	}

}
