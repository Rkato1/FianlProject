package com.kh.camp.model.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.dao.CampDao;
import com.kh.camp.model.vo.CampEventData;
import com.kh.camp.model.vo.CampPageData;
import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.operator.model.vo.CampNoticePageData;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.review.model.vo.ReviewVO;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

	public CampPageData campList(int reqPage) {
		int numPerPage = 20;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		DecimalFormat df = new DecimalFormat(".#"); // 평점 소수점맞춤용
		ArrayList<CampVO> list = dao.selectList(map);
		for (CampVO c : list) {
			map.put("campNo", c.getCampNo());
			map.put("fileGrade", 1);
			ArrayList<CampPictureVO> pictureList = dao.selectPictureList(map);

			c.setPictureList(pictureList);

			ArrayList<SiteVO> siteList = dao.selectSiteListMap(map);
			c.setSiteList(siteList);

			ArrayList<ReviewVO> reviewList = dao.selectReivewList(c.getCampNo());

			if (reviewList.size() > 0) {
				Float result = dao.getPointAvg(c.getCampNo());
				if (result > 0f) {
					String point = df.format(result);
					c.setCampPoint(point);
				}
			}

		}
		int totalCount = dao.totalCount();
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-dark navi-btn' href='/campList.do?reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>";// <a href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-dark navi-btn'>" + pageNo + "</span>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		CampPageData cpd = new CampPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}

	/*
	 * public CampVO campView(CampVO c) { CampVO camp = dao.campView(c);
	 * HashMap<String, Integer> map = new HashMap<String, Integer>();
	 * map.put("campNo", c.getCampNo()); map.put("filegrade", 2);
	 * ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
	 * camp.setPictureList(pictureList); return camp; }
	 */

	public CampEventData campView(CampVO c) {
		CampEventData ced = new CampEventData(); // 결과 값 선언
		CampVO camp = dao.campView(c); // No로 캠핑장 객체 찾기

		// Camp객체에 소개이미지 리스트 넣기 등급은 2번
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", c.getCampNo());
		map.put("fileGrade", 2);
		ArrayList<CampPictureVO> pictureList = dao.selectPictureList(map);
		// DB에서 검색해서 하나라도 있으면 셋팅
		if (pictureList.size() > 0) {
			camp.setPictureList(pictureList);
		}

		map.put("fileGrade", 3);// 레이아웃 3등급을 입력한다.
		ArrayList<CampPictureVO> layoutList = dao.selectPictureList(map);
		// DB에서 검색해서 하나라도 있으면 셋팅
		if (layoutList.size() > 0) {
			camp.setLayoutList(layoutList);
		}
		// 캘린더안에 들어갈 event값 구하기
		String events = ""; // 결과String선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
		Calendar cal = Calendar.getInstance(); // 캘린더 선언 후 날짜 초기화
		
		String today = sdf.format(cal.getTime()); //1. 오늘날짜 String으로 저장
		//String today = "2020-12-01"; // 2. 시작날짜 임의로 지정
		
		String startDate = today; // 시작날짜 오늘로 설정
		cal.add(Calendar.MONTH, 2); // 오늘날짜 +2달로 설정
		String endDate = sdf.format(cal.getTime()); // 종료 날짜 저장

		cal = Calendar.getInstance(); // end날짜 설정후 한번더 초기화

		Date date;
		try {
			// 시작일자를 데이트타입으로 변환
			date = sdf.parse(startDate);
			// 그값을 캘린더날짜로 설정
			cal.setTime(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int idx = 0; // str확인용 변수
		while (!startDate.equals(endDate)) {// 다르면 반복,같으면 종료
			SiteVO site = new SiteVO();
			site.setCampNo(camp.getCampNo());
			site.setReserveDate(startDate);
			// 해당 날짜의 해당 예약장소 리스트가져오기 (예약 되어져있는 수)

			// 전체예약 가능 개수 구하기 (site_name들 겹치지 않은 리스트)
			int canSiteTotal = dao.canSiteTotal(site);
			int cantSiteCnt = dao.cantSiteCnt(site);
			int canSiteCnt = canSiteTotal - cantSiteCnt;

			if (canSiteCnt < 0) {
				canSiteCnt = 0;
			}

			if (canSiteCnt != 0) {
				events += "{id: '" + (++idx) + "', title: '예약가능(" + cantSiteCnt + "/" + canSiteTotal + ")', start: '"
						+ startDate + "', color : 'green', url:'/reserveWriteFrm.do?campNo=" + camp.getCampNo()
						+ "&date=" + startDate + "' },";
			} else {
				events += "{ id: '" + (++idx) + "', title: '예약불가능', start: '" + startDate
						+ "',color : 'red', url:'/reserveWriteFrm.do?campNo=" + camp.getCampNo() + "&date=" + startDate
						+ "' },";
			}

			cal.add(Calendar.DATE, 1); // 1일 더해준다
			startDate = sdf.format(cal.getTime());// 1일더한 값을 String으로 startDate저장한다.
		}

		if (idx > 0) {
			events = events.substring(0, events.length() - 1); // {}를 만들었다면 마지막 ',' 지우기
		}
		// 마지막 출력전 셋팅

		ced.setCamp(camp);
		ced.setEvents(events);
		return ced;
	}

	public ArrayList<CampNoticeVO> campNoticeList(CampVO c) {
		return dao.campNoticeList(c);
	}

	public CampNoticePageData selectCampNoticeList(CampVO c, int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("campNo", c.getCampNo());
		ArrayList<CampNoticeVO> list = dao.selectCampNoticeList(map);
		int totalCount = dao.noticeTotalCount(c.getCampNo());
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String sameStr = "<a class='btn btn-outline-dark btn-sm' href='/campView.do?campNo=" + c.getCampNo()
				+ "&reqPage=";
		if (pageNo != 1) {
			pageNavi += sameStr + (pageNo - 1) + "'>이전</a>&nbsp;";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += sameStr + pageNo + "'>" + pageNo + "</a>&nbsp;";
			} else {
				pageNavi += "<span class='btn btn-outline-dark btn-sm'>" + pageNo + "</span>&nbsp;";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += sameStr + pageNo + "'>다음</a>";
		}
		CampNoticePageData cnpd = new CampNoticePageData(list, pageNavi);
		return cnpd;
	}

	public CampPageData campSearchList(int reqPage, String keyword, String value) {
		int numPerPage = 20;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		map.put("value", value);
		ArrayList<CampVO> list = dao.campSearchListObject(map);
		DecimalFormat df = new DecimalFormat(".#");
		map.put("fileGrade", 1);
		for (CampVO c : list) {
			map.put("campNo", c.getCampNo());
			ArrayList<CampPictureVO> pictureList = dao.selectPictureListObject(map);
			if (pictureList.size() > 0) {
				c.setPictureList(pictureList);
			}
			ArrayList<SiteVO> siteList = dao.selectSiteListMapObject(map);
			if (siteList.size() > 0) {
				c.setSiteList(siteList);
			}
			
			ArrayList<ReviewVO> reviewList = dao.selectReivewList(c.getCampNo());

			if (reviewList.size() > 0) {
				Float result = dao.getPointAvg(c.getCampNo());
				if (result > 0f) {
					String point = df.format(result);
					c.setCampPoint(point);
				}
			}
			
			
			
		}
		int totalCount = dao.totalSearchCount(map);
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-dark navi-btn' href='/searchCampList.do?keyword=" + keyword
				+ "&value=" + value + "&reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>";// <a href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-dark navi-btn'>" + pageNo + "</span>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		CampPageData cpd = new CampPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}

	public CampPageData mainSearchList(int reqPage, String value, String startDate, String endDate) {
		int numPerPage = 20;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("value", value);
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("start", startDate);
		map2.put("end", endDate);
		ArrayList<CampVO> list = dao.campSearchListObject(map, map2);
		DecimalFormat df = new DecimalFormat(".#"); // 평점 소수점맞춤용
		

		for (CampVO c : list) {
			map.put("campNo", c.getCampNo());
			map.put("fileGrade", 1);
			ArrayList<CampPictureVO> pictureList = dao.selectPictureListObject(map);
			if (pictureList.size() > 0) {
				c.setPictureList(pictureList);
			}
			ArrayList<SiteVO> siteList = dao.selectSiteListMapObject(map);
			if (siteList.size() > 0) {
				c.setSiteList(siteList);
			}
			
			ArrayList<ReviewVO> reviewList = dao.selectReivewList(c.getCampNo());

			if (reviewList.size() > 0) {
				Float result = dao.getPointAvg(c.getCampNo());
				if (result > 0f) {
					String point = df.format(result);
					c.setCampPoint(point);
				}
			}
		}
		/*
		 * int totalCount = dao.totalSearchCount(map, map2); int totalPage = totalCount
		 * / numPerPage; if (totalCount % numPerPage != 0) { totalPage++; } int
		 * pageNaviSize = 5; int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize
		 * + 1; String pageNavi = ""; String repeatStr =
		 * "<a class='btn btn-outline-dark navi-btn' href='/searchCampListTest.do?reqPage="
		 * ; String repeatStr2 =
		 * "&value="+value+"&startDate="+startDate+"&endDate="+endDate; if (pageNo != 1)
		 * { pageNavi += repeatStr + (pageNo - 1) + repeatStr2 +"'>이전</a>"; } for (int i
		 * = 0; i < pageNaviSize; i++) { if (pageNo != reqPage) { pageNavi += repeatStr
		 * + pageNo + repeatStr2 + "'>" + pageNo + "</a>";// <a
		 * href='/noticeList.do?reqPage=1'>1</a> } else { pageNavi +=
		 * "<span class='btn btn-outline-dark navi-btn'>" + pageNo + "</span>"; }
		 * pageNo++; if (pageNo > totalPage) { break; } } if (pageNo <= totalPage) {
		 * pageNavi += repeatStr + (pageNo) + repeatStr2 + "'>다음</a>"; }
		 */
		CampPageData cpd = new CampPageData();
		cpd.setList(list);
		//cpd.setPageNavi(pageNavi);
		return cpd;
	}

	/*
	 * public ArrayList<String> getPointList(ArrayList<CampVO> list) {
	 * ArrayList<String> pointList = new ArrayList<String>(); Float result = 0f;
	 * DecimalFormat df = new DecimalFormat(".#"); for (CampVO c : list) { result =
	 * dao.getPointAvg(c.getCampNo()); String str = df.format(result);
	 * System.out.println("Obj.result = " + result);
	 * System.out.println("str.result = " + str); pointList.add(str); }
	 * System.out.println("pointList.size() = "+pointList.size()); return pointList;
	 * }
	 */
}
