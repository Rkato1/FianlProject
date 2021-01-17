package com.kh.reserve.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;

import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.dao.ReserveDao;
import com.kh.reserve.model.vo.ReserveListsVO;
import com.kh.reserve.model.vo.ReserveVO;


@Service
public class ReserveService {

	@Autowired
	private ReserveDao dao;

	/*
	 * public ReserveService() { super(); System.out.println("ReserveService객체생성");
	 * }
	 */

	public ArrayList<ReserveVO> selectReserveList() {
		return dao.selectReserveList();
	}

	/*
	 * public ArrayList<SiteVO> selectSitePriceList(CampVO camp) { return
	 * dao.selectSitePriceList(camp); }
	 */

	public ReserveListsVO selectAllLists(CampVO camp, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("campNo", camp.getCampNo());
		map.put("date", date);
		// 최종리스트 초기화
		ArrayList<SiteVO> list = new ArrayList<SiteVO>();
		// 1번째 해당 캠프번호해당 날짜 리스트 그외 캠프번호와 0000-00-00입력된 리스트확인
		ArrayList<SiteVO> list1 = dao.selectSiteList(map);
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();
		for (SiteVO s : list1) {
			SiteVO site = new SiteVO();
			s.setCampNo(camp.getCampNo());
			// 사이트에 리스트에 campNo가 있으면 reserveDate는 그대로 없으면 0000-00-00으로 설정
			if (s.getMemberNo() != 0) {
				s.setReserveDate(date);
			} else {
				s.setReserveDate("0000-00-00");
			}
			// 해당 조건에 맞는 사이트값 하나가지고오기
			site = dao.selectOneSite(s);
			list.add(site);
			
			MemberVO m = new MemberVO();
			m.setMemberNo(site.getMemberNo());
			MemberVO member = dao.selectOneMemberNo(m);
			if(member != null) {
				System.out.println("memberName = "+member.getMemberName());
				memberList.add(member);
			}
			ReserveVO r = dao.selectOneReserve(site);
			if(r !=null) {
				System.out.println("reserve = "+r);
				reserveList.add(r);
			}			
		}
		// 여기서 날짜를 기준으로 비수기 성수기 극성수기 구분하고 요일도 같이 판단하여 usingPay 셋팅
		// 요일부터 구해보자
		String day = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date Date = sdf.parse(date);
			Calendar cal = Calendar.getInstance();
			cal.setTime(Date);
			int dayNum = cal.get(Calendar.DAY_OF_WEEK);
			switch (dayNum) {
			case 1:
				day = "일";
				break;
			case 2:
				day = "월";
				break;
			case 3:
				day = "화";
				break;
			case 4:
				day = "수";
				break;
			case 5:
				day = "목";
				break;
			case 6:
				day = "금";
				break;
			case 7:
				day = "토";
				break;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<String> peakList = new ArrayList<String>(); // 성수기 리스트
		peakList.add("2021-02-11");
		peakList.add("2021-02-12");
		peakList.add("2021-02-13");
		peakList.add("2021-03-06");
		peakList.add("2021-03-13");
		peakList.add("2021-03-20");
		peakList.add("2021-03-28");
		peakList.add("2021-03-29");
		peakList.add("2021-03-30");
		peakList.add("2021-03-31");
		ArrayList<String> polarList = new ArrayList<String>(); // 극성수기 리스트
		polarList.add("2021-03-26");
		polarList.add("2021-03-27");
		String type1 = "비수기";
		for (String d : peakList) {
			if (date.equals(d)) {
				type1 = "성수기";
			}
		}
		if (!type1.equals("성수기")) {
			for (String d : polarList) {
				if (date.equals(d)) {
					type1 = "극성수기";
				}
			}
		}
		String type2 = "평일";
		if (day.equals("토") || day.equals("일")) {
			type2 = "주말";
		}
		for (SiteVO s : list) {
			if (type1.equals("비수기") && type2.equals("평일")) {
				s.setUsingPay(s.getLowDayPay());
			} else if (type1.equals("비수기") && type2.equals("주말")) {
				s.setUsingPay(s.getLowEndPay());
			} else if (type1.equals("성수기") && type2.equals("평일")) {
				s.setUsingPay(s.getPeakDayPay());
			} else if (type1.equals("성수기") && type2.equals("주말")) {
				s.setUsingPay(s.getPeakEndPay());
			} else if (type1.equals("극성수기") && type2.equals("평일")) {
				s.setUsingPay(s.getPolarDayPay());
			} else if (type1.equals("극성수기") && type2.equals("주말")) {
				s.setUsingPay(s.getPolarEndPay());
			}
		}
		
		ArrayList<SiteVO> sitePriceList = dao.selectSitePriceList(camp);
		
		
		
		ReserveListsVO rlv = new ReserveListsVO();
		rlv.setMemberList(memberList);
		rlv.setReserveList(reserveList);
		rlv.setSiteList(list);
		rlv.setSitePriceList(sitePriceList);
		
		return rlv;
	}

	public CampVO selectOneCamp(CampVO camp) {
		return dao.selectOneCamp(camp);
	}


	public int insertReserve(ReserveVO reserve, String siteArr) {
		String item[] = siteArr.split(",");
		//0번부터 23번까지가 1개의 site객체입니다.
		//총개수 96개면  4개의 사이트가 입력된거겠죠
		int end1 = item.length/24;
		ArrayList<SiteVO> siteList = new ArrayList<SiteVO>();
		int idx = 0;
		for(int i = 0 ; i <end1;i++) {
			SiteVO site = new SiteVO();
			//0 -> siteNo
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setSiteNo");
			site.setSiteNo(Integer.parseInt(item[idx++]));
			//1 -> campNo
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setCampNo");
			site.setCampNo(Integer.parseInt(item[idx++]));
			//2 -> setSiteTitle
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setSiteTitle");
			site.setSiteTitle(item[idx++]);
			//3 -> setSiteName
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setSiteName");
			site.setSiteName(item[idx++]);
			//4 -> setMinCnt
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setMinCnt");
			site.setMinCnt(Integer.parseInt(item[idx++]));
			//5 -> setMaxCnt
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setMaxCnt");
			site.setMaxCnt(Integer.parseInt(item[idx++]));
			//6 -> setMinNight
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setMinNight");
			site.setMinNight(Integer.parseInt(item[idx++]));
			//7 -> setMaxNight
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setMaxNight");
			site.setMaxNight(Integer.parseInt(item[idx++]));
			//8 -> setDiscountPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setDiscountPay");
			site.setDiscountPay(Integer.parseInt(item[idx++]));
			//9 -> setAddCntPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setAddCntPay");
			site.setAddCntPay(Integer.parseInt(item[idx++]));
			//10 -> setAddCarPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setAddCarPay");
			site.setAddCarPay(Integer.parseInt(item[idx++]));
			//11 -> setUsingCnt
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setUsingCnt");
			site.setUsingCnt(Integer.parseInt(item[idx++]));
			//12 -> setUsingPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setUsingPay");
			site.setUsingPay(Integer.parseInt(item[idx++]));
			//13 -> setUsingNight
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setUsingNight");
			site.setUsingNight(Integer.parseInt(item[idx++]));
			//14 -> setAddCarDay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setAddCarDay");
			site.setAddCarDay(Integer.parseInt(item[idx++]));
			//15 -> setAddCarCnt
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setAddCarCnt");
			site.setAddCarCnt(Integer.parseInt(item[idx++]));
			//16 -> setMemberNo
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setMemberNo");
			site.setMemberNo(Integer.parseInt(item[idx++]));
			//17 -> setReservePay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setReservePay");
			site.setReservePay(Integer.parseInt(item[idx++]));
			//18 -> setReserveDate
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setReserveDate");
			site.setReserveDate(item[idx++]);			
			//19 -> setLowDayPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setLowDayPay");
			site.setLowDayPay(Integer.parseInt(item[idx++]));
			//20 -> setLowEndPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setLowEndPay");
			site.setLowEndPay(Integer.parseInt(item[idx++]));
			//21 -> setPeakDayPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setPeakDayPay");
			site.setPeakDayPay(Integer.parseInt(item[idx++]));
			//22 -> setPeakEndPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setPeakEndPay");
			site.setPeakEndPay(Integer.parseInt(item[idx++]));
			//23 -> setPolarDayPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setPolarDayPay");
			site.setPolarDayPay(Integer.parseInt(item[idx++]));
			//24 -> setPolarEndPay
			//System.out.println("item["+idx+"] = "+item[idx] + "-> setPolarEndPay");
			site.setPolarEndPay(Integer.parseInt(item[idx++]));
			//System.out.println("site = " +site);
			siteList.add(site);		
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		//siteList만큼 반복

		//시작날짜부터 ~ usingNight더한 일수만큼 반복하여 site에 insert 2020-01-17이랑 usingNight=3인경우 2020-01-17,2020-01-18,2020-01-19,2020-01-20
		//2020-01-17이랑 usingNight=1인경우 2020-01-17,2020-01-18
		//그러고 반복이 끝나면 마지막일자가 checkOutDate가되어 reserve에 insert
		int result = 0;
		String nextDate ="";
		for(SiteVO s : siteList) {
			//시작날짜로 캘린더 주입
			String startDate = reserve.getCheckInDate();
			try {
				Date date = sdf.parse(startDate); //date형변환
				//일단 한번 site insert
				result += dao.insertSite(s);
				//그담에 usingNight수만큼 추가 site insert
				Calendar cal = Calendar.getInstance(); //날짜 초기화
				for(int i =0;i<s.getUsingNight();i++) {					
					cal.setTime(date);//날짜 셋팅 됨
					cal.add(Calendar.DATE, 1); // 1일 더해준다					
					nextDate = sdf.format(cal.getTime());//다음날짜 설정					
					s.setReserveDate(nextDate); //site객체에 설정
					result += dao.insertSite(s); //다시 insert
					date = sdf.parse(nextDate);//다음날짜 데이트형식 다시넣기	
				}
				//마지막 nextDate가 checkoutDate니까
				reserve.setReservePrice(s.getReservePay());
				reserve.setReservePlace(s.getSiteName());
				reserve.setReserveStatus("결제대기");
				reserve.setCheckOutDate(nextDate);
				result += dao.insertReserve(reserve);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		return result;
	}
}
