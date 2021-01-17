package com.kh.operator.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.vo.CampPictureVo;
import com.kh.camp.model.vo.CampVO;
import com.kh.operator.model.dao.OperatorDao;
import com.kh.operator.model.vo.CampNoticePageData;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewFileVO;
import com.kh.review.model.vo.ReviewPageData;
import com.kh.review.model.vo.ReviewVO;
import com.kh.review.model.vo.ReviewViewData;

@Service
public class OperatorService {
	@Autowired
	private OperatorDao dao;

	public ArrayList<CampVO> selectCampList(CampVO c) {
		ArrayList<CampVO> list = dao.selectCampList(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for(CampVO camp : list) {
			map.put("campNo",camp.getCampNo());
			map.put("filegrade", 1);
			ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
			camp.setPictureList(pictureList);		
		}
		return list;
	}

	public CampVO selectOneCamp(CampVO c) {
		CampVO camp = dao.selectOneCamp(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", camp.getCampNo());
		map.put("filegrade", 0);
		ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
		camp.setPictureList(pictureList);
		return camp;
	}

	public CampNoticePageData selectCampNoticeList(CampVO c,int reqPage) {
		//1. 게시물 구해오기
				//1-1. 한 페이지의 게시물 수 : 10개 설정
				int numPerPage = 5;
				
				//1-2. start / end
				int end = reqPage*numPerPage;
				int start = end - numPerPage + 1;
				
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("start", start);
				map.put("end", end);
				map.put("campNo",c.getCampNo());
				ArrayList<CampNoticeVO> list = dao.selectCampNoticeList(map);
				
				//2. 페이지 네비 만들기
				//2-1. 총 게시글 수
				int totalCount = dao.reviewTotalCount(c.getCampNo());
				
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
					pageNavi += "<a class='btn btn-outline-dark btn-sm' href='opNoticeList.do?campNo="+c.getCampNo()+"&reqPage="+(pageNo-1)+"'>이전</a>&nbsp;";
				}
				
				//숫자 버튼
				for(int i=0; i<pageNaviSize; i++) {
					//현재페이지는 다시 안눌리게하는 조건
					if(pageNo != reqPage) {
						//<a href='/noticeList.do?reqPage=1'>1</a>
						pageNavi += "<a class='btn btn-outline-dark btn-sm' href='opNoticeList.do?campNo="+c.getCampNo()+"&reqPage="+pageNo+"'>"+pageNo+"</a>&nbsp;";
					} else {
						pageNavi += "<span class='btn btn-dark btn-sm'>"+pageNo+"</span>&nbsp;";
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
					pageNavi += "<a class='btn btn-outline-dark btn-sm' href='opNoticeList.do?campNo="+c.getCampNo()+"&reqPage="+pageNo+"'>다음</a>";
				}
				
				CampNoticePageData cnpd = new CampNoticePageData(list, pageNavi);
				return cnpd;
	}
	
	public CampNoticeVO selectCampNotice(CampNoticeVO cn) {
		CampNoticeVO cNotice = dao.selectCampNotice(cn);
		return cNotice;
	}

	public int insertCampNotice(CampNoticeVO cn) {
		int result = dao.insertCampNotice(cn);
		return result;
	}

	public int updateCampNotice(CampNoticeVO cn) {
		int result =  dao.updateCampNotice(cn);
		return result;
	}

	public int deleteCampNotice(CampNoticeVO cn) {
		int result = dao.deleteCampNotice(cn);
		return result;
	}

	public ReviewPageData reviewList(int reqPage, int campNo) {
		//1. 게시물 구해오기
				//1-1. 한 페이지의 게시물 수 : 10개 설정
				int numPerPage = 10;
				
				//1-2. start / end
				int end = reqPage*numPerPage;
				int start = end - numPerPage + 1;
				
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("start", start);
				map.put("end", end);
				map.put("campNo", campNo);
				ArrayList<ReviewCampVO> list = dao.selectReviewList(map);
				
				//2. 페이지 네비 만들기
				//2-1. 총 게시글 수
				int totalCount = dao.reviewTotalCount(campNo);
				
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

	
}
