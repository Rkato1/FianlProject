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
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.dao.ReserveDao;
import com.kh.reserve.model.vo.ReserveVO;

import javafx.scene.input.DataFormat;

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

	public ArrayList<SiteVO> selectSitePriceList(CampVO camp) {
		return dao.selectSitePriceList(camp);
	}

	public ArrayList<SiteVO> selectSiteReserveList(CampVO camp, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("campNo",camp.getCampNo());
		map.put("date",date);
		//최종리스트 초기화
		ArrayList<SiteVO> list = new ArrayList<SiteVO>();
		//1번째 해당 캠프번호해당 날짜 리스트 그외 캠프번호와 0000-00-00입력된 리스트확인
		ArrayList<SiteVO> list1 = dao.selectSiteList(map);
		for(SiteVO s : list1) {
			SiteVO site = new SiteVO(); 
			s.setCampNo(camp.getCampNo()); 
			//사이트에 리스트에 campNo가 있으면 reserveDate는 그대로 없으면 0000-00-00으로 설정
			if(s.getMemberNo() != 0) {
				s.setReserveDate(date);
			}else {
				s.setReserveDate("0000-00-00");
			}
			//해당 조건에 맞는 사이트값 하나가지고오기
			site = dao.selectOneSite(s);
			//MemberVO m = new MemberVO();
			//m.setMemberNo(site.getMemberNo());
			//MemberVO member = dao.selectOneMemberNo(m);
			//site.setMember(member);
			//System.out.println("site = "+site);
			list.add(site);
		}
		//여기서 날짜를 기준으로 비수기 성수기 극성수기 구분하고 요일도 같이 판단하여  usingPay 셋팅
		//요일부터 구해보자
		String day = "";		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date Date = sdf.parse(date);
			Calendar cal = Calendar.getInstance();
			cal.setTime(Date);
			int dayNum = cal.get(Calendar.DAY_OF_WEEK);
			switch(dayNum) {
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
		ArrayList<String> peakList = new  ArrayList<String>(); //성수기 리스트
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
		ArrayList<String> polarList = new  ArrayList<String>(); //극성수기 리스트
		polarList.add("2021-03-26");
		polarList.add("2021-03-27");		
		String type1 = "비수기";
		for(String d : peakList) {
			if(date.equals(d)) {
				type1="성수기";
			}
		}
		if(!type1.equals("성수기")) {
			for(String d : polarList) {
				if(date.equals(d)) {
					type1="극성수기";
				}
			}
		}
		String type2 = "평일";
		if(day.equals("토") || day.equals("일")) {
			type2 = "주말";
		}			
		 for(SiteVO s : list) { 
			 if(type1.equals("비수기")&&type2.equals("평일")) {
				 s.setUsingPay(s.getLowDayPay());
			 }else if(type1.equals("비수기")&&type2.equals("주말")){
				 s.setUsingPay(s.getLowEndPay());
			 }else if(type1.equals("성수기")&&type2.equals("평일")) {
				 s.setUsingPay(s.getPeakDayPay());
			 }else if(type1.equals("성수기")&&type2.equals("주말")){
				 s.setUsingPay(s.getPeakEndPay());
			 }else if(type1.equals("극성수기")&&type2.equals("평일")) {
				 s.setUsingPay(s.getPolarDayPay());
			 }else if(type1.equals("극성수기")&&type2.equals("주말")){
				 s.setUsingPay(s.getPolarEndPay());
			 }
		 }		
		return list;
	}
}
