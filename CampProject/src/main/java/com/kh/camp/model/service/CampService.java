package com.kh.camp.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.model.dao.CampDao;
import com.kh.camp.model.vo.CampEventData;
import com.kh.camp.model.vo.CampPageData;
import com.kh.camp.model.vo.CampPictureVo;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;

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
		ArrayList<CampVO> list = dao.selectList(map);
		for (CampVO c : list) {
			map.put("campNo", c.getCampNo());
			map.put("filegrade", 1);
			ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
			c.setPictureList(pictureList);
		}
		int totalCount = dao.totalCount();
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/campList.do?reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>";// <a href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>";
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
		CampVO camp = dao.campView(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", c.getCampNo());
		map.put("filegrade", 2);
		ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
		camp.setPictureList(pictureList);

		String events = "";
		
		Calendar cal = Calendar.getInstance(); // 캘린더 현재 날짜 초기화
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜 형식 설정

		String startDate = sdf.format(cal.getTime()); //현재 날짜 저장
		cal.add(Calendar.MONTH, 2); //+2달로 임의 설정
		String endDate = sdf.format(cal.getTime()); //종료 날짜 저장
		cal = Calendar.getInstance(); // end날짜 설정후 한번더 초기화
		int idx = 0;
		//시작날짜부터 끝나는 날짜까지 반복
		while (!startDate.equals(endDate)) {// 다르면 반복,같으면 종료
			//날짜기준 campNo로 memberNo가 0인지 아닌지 구분하여 예약가능 개수파악
			int reserveUnableCnt=0; //예약 불가능 개수 초기화
			SiteVO site = new SiteVO();
			site.setCampNo(c.getCampNo());
			site.setReserveDate(startDate);
			//해당 날짜의 해당 예약장소 리스트가져오기
			ArrayList<SiteVO> siteList = dao.selectSiteList(site);			
			//SQL 검색결과 확인
			if(siteList.size() !=0) { //리스트가 존재하면 해당날짜에 해당캠프에 예약이 있다				
				reserveUnableCnt = siteList.size();//예약 불가능개수 설정
			}
			//전체예약 개수 구하기
			int reserveTotalCount = dao.reserveTotalCount(site);
			//System.out.println("reserveTotalCount = "+reserveTotalCount);
			if(reserveTotalCount != reserveUnableCnt) {
				//예약가능
				events += "{id: '"+(++idx)+"', title: '예약가능("+(reserveTotalCount-reserveUnableCnt)+"/"+reserveTotalCount+")', start: '"+startDate+"', color : 'green', url:'/reserveWriteFrm.do?campNo="+c.getCampNo()+"&date="+startDate+"' },";
			}else {
				//예약 불가능
				events += "{ id: '"+(++idx)+"', title: '예약불가능', start: '"+startDate+"',color : 'red'},";	
			}			
			cal.add(Calendar.DATE, 1); // 1일 더해준다
			startDate = sdf.format(cal.getTime());
		}
		if(idx != 0) {
			events = events.substring(0, events.length()-1); //{}를 만들었다면 마지막 ',' 지우기
		}
		CampEventData ced = new CampEventData();
		ced.setCamp(camp);
		ced.setEvents(events);
		return ced;
	}
}
