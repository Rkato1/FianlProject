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

	public ArrayList<ReserveVO> selectReserveList(ReserveVO reserve) {		
		return dao.selectReserveList(reserve);
	}

	public ReserveListsVO selectAllLists(CampVO camp, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("campNo", camp.getCampNo());
		map.put("date", date);
		// 최종리스트 초기화
		ArrayList<SiteVO> list = new ArrayList<SiteVO>();
		// 1번째 해당 캠프번호해당 날짜 리스트 그외 캠프번호와 0000-00-00입력된 리스트확인
		// site_name + member_no 형태 배열만들어짐  (순서는 site_name순서로)
		ArrayList<SiteVO> list1 = dao.selectSiteList(map);
		// site번호를 구해서 

		for (SiteVO s : list1) {
			SiteVO site = new SiteVO();
			s.setCampNo(camp.getCampNo());
			// 사이트에 리스트에 memberNo가 있으면 reserveDate는 그대로 없으면 0000-00-00으로 설정
			if (s.getMemberNo() > 0 ) {
				s.setReserveDate(date);
				site = dao.selectOneSiteOnly(s);
			} else {				
				s.setReserveDate("0000-00-00");
				site = dao.selectOneSiteNullMember(s);				
			}
			
			if(site !=null) {
				list.add(site);
			}
		}
		
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		for(SiteVO s : list) {
			//memberList생성
			MemberVO m = new MemberVO();
			m.setMemberNo(s.getMemberNo());
			MemberVO member = dao.selectOneMemberNo(m);
			if(member != null) {
				memberList.add(member);
			}
			//memberList생성완료
		}
		
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();

		for(SiteVO s : list) {
			ReserveVO reserve = new ReserveVO();
			reserve.setCampNo(s.getCampNo());
			reserve.setReservePlace(s.getSiteName());
			if(s.getMemberNo()>0) {
				reserve.setMemberNo(s.getMemberNo());
			}			
			//해당 캠핑장 해당 장소명의 해당 맴버번호가 있는 예약리스트를 뽑는다
			ArrayList<ReserveVO> resultList = dao.selectReserveList(reserve);
			int searchIdx = 0;
			if(resultList.size()>0) {
				if(resultList.size() == 1) {
					reserveList.add(resultList.get(0));
				}else {
					//찾기 시작					
					searchIdx = -1;
					for(ReserveVO r : resultList) {
						String startDate = r.getCheckInDate();
						String endDate = r.getCheckOutDate();
						Calendar cal = Calendar.getInstance();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
						Date Date;
						try {
							// 시작일자를 데이트타입으로 변환
							Date = sdf.parse(startDate);
							// 그값을 캘린더날짜로 설정
							cal.setTime(Date);
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						while(!startDate.equals(endDate)) {
							if(startDate.equals(date)) {							
								searchIdx = 1; //찾음
								break; //반복문 돌 필요없음
							}						
							cal.add(Calendar.DATE, 1); // 1일 더해준다
							startDate = sdf.format(cal.getTime());// 1일더한 값을 String으로 startDate저장한다.
						}
						if(searchIdx == 1 || endDate.equals(date)) {
							reserveList.add(r);
							break;
						}						
					}		
				}
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
			site.setSiteNo(Integer.parseInt(item[idx++]));
			site.setCampNo(Integer.parseInt(item[idx++]));
			site.setSiteTitle(item[idx++]);
			site.setSiteName(item[idx++]);
			site.setMinCnt(Integer.parseInt(item[idx++]));
			site.setMaxCnt(Integer.parseInt(item[idx++]));
			site.setMinNight(Integer.parseInt(item[idx++]));
			site.setMaxNight(Integer.parseInt(item[idx++]));
			site.setDiscountPay(Integer.parseInt(item[idx++]));
			site.setAddCntPay(Integer.parseInt(item[idx++]));
			site.setAddCarPay(Integer.parseInt(item[idx++]));
			site.setUsingCnt(Integer.parseInt(item[idx++]));
			site.setUsingPay(Integer.parseInt(item[idx++]));
			site.setUsingNight(Integer.parseInt(item[idx++]));
			site.setAddCarDay(Integer.parseInt(item[idx++]));
			site.setAddCarCnt(Integer.parseInt(item[idx++]));
			site.setMemberNo(Integer.parseInt(item[idx++]));
			site.setReservePay(Integer.parseInt(item[idx++]));
			site.setReserveDate(item[idx++]);			
			site.setLowDayPay(Integer.parseInt(item[idx++]));
			site.setLowEndPay(Integer.parseInt(item[idx++]));
			site.setPeakDayPay(Integer.parseInt(item[idx++]));
			site.setPeakEndPay(Integer.parseInt(item[idx++]));
			site.setPolarDayPay(Integer.parseInt(item[idx++]));
			site.setPolarEndPay(Integer.parseInt(item[idx++]));
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

	public ReserveVO selectOneReserve(ReserveVO reserve) {		
		return dao.selectOneReserve(reserve);
	}

	public SiteVO selectOneSiteReserve(ReserveVO r) {		
		return dao.selectOneSiteReserve(r);
	}

	public MemberVO selectOneMember(ReserveVO r) {
		MemberVO m = new MemberVO();
		m.setMemberNo(r.getMemberNo());
		return dao.selectOneMemberNo(m);
	}

	public int updateReserve(ReserveVO reserve) {		
		return dao.updateReserve(reserve);
	}

	public int reserveDelete(ReserveVO reserve) {
		//일단 삭제해야할 reserve부터 찾는다.
		int result = 0;
		ReserveVO r = dao.selectOneReserve(reserve);
		if(r != null) {
			//시작날짜 저장
			String startDate = r.getCheckInDate();
			//끝날짜 저장
			String endDate = r.getCheckOutDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜 형식 설정			
			Calendar cal2 = Calendar.getInstance(); // 캘린더 현재 날짜 초기화			
			//조건문while이 다르다가 같으면 멈춰서 한번 더 돌리기 위한 날짜 1증가
			try {
				Date date2 = sdf.parse(endDate);
				cal2.setTime(date2);//날짜 셋팅 됨
				cal2.add(Calendar.DATE, 1); // 1일 더해준다
				endDate = sdf.format(cal2.getTime());				
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//날짜값들을 가지고와서 n번만큼 반복하여 삭제해야함
			while(!startDate.equals(endDate)) {
				try {
					Calendar cal = Calendar.getInstance(); // 캘린더 현재 날짜 초기화
					Date date = sdf.parse(startDate);
					cal.setTime(date);//날짜 셋팅 됨
					//startDate해당 날짜인거 삭제
					SiteVO site = new SiteVO();
					site.setCampNo(r.getCampNo());
					site.setMemberNo(r.getMemberNo());
					site.setReserveDate(startDate);
					site.setSiteName(r.getReservePlace());
					site.setReservePay(r.getReservePrice());
					//사이트 찾기
					SiteVO s = dao.selectOneSiteOnly(site);
					if(s != null) {
						//찾는데 성공하면 삭제실시
						result += dao.deleteSite(s);
					}				
					cal.add(Calendar.DATE, 1); // 1일 더해준다
					startDate = sdf.format(cal.getTime());
					date = sdf.parse(startDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
			result += dao.deleteReserve(reserve);
		}		
		return result;
	}

	public int flexOneRserve(ReserveVO reserve) {		
		return dao.flexOneRserve(reserve);
	}

	public int flexAllReserve(String numbers) {
		String item[] = numbers.split(",");
		int reserveNo = 0;
		int result = 0;
		for(int i=0; i<item.length;i++) {
			reserveNo = Integer.parseInt(item[i]);
			ReserveVO r = new ReserveVO();
			r.setReserveNo(reserveNo);
			ReserveVO reserve = dao.selectOneReserve(r);
			if(reserve != null) {
				result += dao.flexOneRserve(reserve);				
			}
		}
		return result;
	}
}
