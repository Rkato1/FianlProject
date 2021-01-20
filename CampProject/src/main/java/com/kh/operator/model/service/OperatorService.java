package com.kh.operator.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.operator.model.dao.OperatorDao;
import com.kh.operator.model.vo.CampNoticePageData;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.reserve.model.vo.ReserveVO;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewPageData;

@Service
public class OperatorService {
	@Autowired
	private OperatorDao dao;

	public ArrayList<CampVO> selectCampList(CampVO c) {
		ArrayList<CampVO> list = dao.selectCampList(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for(CampVO camp : list) {
			map.put("campNo",camp.getCampNo());
			map.put("fileGrade", 1);
			ArrayList<CampPictureVO> pictureList = dao.selectPictureList(map);
			camp.setPictureList(pictureList);		
		}
		return list;
	}

	public CampVO selectOneCamp(CampVO c) {
		CampVO camp = dao.selectOneCamp(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", camp.getCampNo());
		map.put("fileGrade", 0);
		ArrayList<CampPictureVO> pictureList = dao.selectPictureList(map);
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

	public int deleteCamp(int campNo) {
		int result1 = dao.deleteCamp(campNo);
		int result2 = 0;
		if(result1>0) {
			result2 = dao.deleteCampPicture(campNo);
		}
		return result1;
	}

	public int insertCamp(CampVO c) {
		int result = dao.insertCamp(c);
		if(result>0) {
			int campNo = dao.selectLastCamp();
			for(CampPictureVO cpv : c.getPictureList()) {
				cpv.setCampNo(campNo);
				result = dao.insertPicture(cpv);
			}
		}
		return result;
	}

	public int updateCamp(CampVO c) {
		System.out.println("서비스 사진 배열 : "+c.getPictureList().size());
		int result = dao.updateCamp(c);
		int result2 =0;
		if(result>0) {
				if(c.getPictureList().size()==1) {
					result2 +=updateMainImg(c.getPictureList().get(0));
				}else if(c.getPictureList().size()>=3) {
					result2 +=updatePicture(c.getPictureList());
				}
		}
		return result;
	}
	public int updateMainImg(CampPictureVO cp) {
		int result = dao.updateMainImg(cp);
		return result;
	}
	public int updatePicture(ArrayList<CampPictureVO> cpList){
		int result1 = dao.deleteCampPicture(cpList.get(0).getCampNo());
		int result2 =0;
		if(result1>0) {
			for(CampPictureVO cpv : cpList) {
				result2 += dao.insertPicture(cpv);
			}
		}
		return result2;
	}

	public ArrayList<SiteVO> selectSiteList(CampVO c) {
		ArrayList<SiteVO> sList = dao.selectSiteList(c);
		return sList;
	}
	public ArrayList<String> selectCategorys(int campNo) {
		ArrayList<String> categorys = dao.selectCategorys(campNo);
		return categorys;
	}
	public int insertSite(SiteVO s) {
		int result = dao.insertSite(s);
		return result;
	}

	public int updateSite(SiteVO s) {
		int result = dao.updateSite(s);
		return result;
	}

	public int deleteSite(int siteNo) {
		int result = dao.deleteSite(siteNo);
		return result;
	}

	public SiteVO selectOneSite(int siteNo) {
		SiteVO site = dao.selectOneSite(siteNo);
		return site;
	}

	public int updateInfoImg(CampPictureVO f) {
		return dao.updateInfoImg(f);
	}

	public int insertInfoImg(CampPictureVO f) {
		return dao.insertInfoImg(f);
	}
	public ArrayList<ReserveVO> selectReservationList(ReserveVO r){
		return dao.selectReserveList(r);
	}
	public ArrayList<CampPictureVO> selectCampPictureList(int campNo,int grade){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", campNo);
		map.put("fileGrade", grade); 
		ArrayList<CampPictureVO> list = dao.selectPictureList(map);
		return list;
	}
}
