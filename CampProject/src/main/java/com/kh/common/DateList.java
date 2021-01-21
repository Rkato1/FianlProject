package com.kh.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component("DateList")
public class DateList {
	public ArrayList<String> GetDates() {
		ArrayList<String> list = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
		Calendar cal = Calendar.getInstance(); // 캘린더 현재 날짜 초기화
		String startDate = sdf.format(cal.getTime()); // 현재 날짜 저장
		cal.add(Calendar.MONTH, 2); // +2달로 임의 설정
		String endDate = sdf.format(cal.getTime()); // 종료 날짜 저장
		cal = Calendar.getInstance(); // end날짜 설정후 한번 더 초기화
		// 시작날짜부터 끝나는 날짜까지 반복
		while (!startDate.equals(endDate)) {// 다르면 반복,같으면 종료
			list.add(startDate);
			cal.add(Calendar.DATE, 1); // 1일 더해준다
			// System.out.println("date = "+startDate);
			startDate = sdf.format(cal.getTime());
		}
		return list;
	}

	public String GetStr() {
		String str = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
		Calendar cal = Calendar.getInstance(); // 캘린더 현재 날짜 초기화
		String startDate = sdf.format(cal.getTime()); // 현재 날짜 저장
		cal.add(Calendar.MONTH, 2); // +2달로 임의 설정
		String endDate = sdf.format(cal.getTime()); // 종료 날짜 저장
		cal = Calendar.getInstance(); // end날짜 설정후 한번 더 초기화
		// 시작날짜부터 끝나는 날짜까지 반복
		while (!startDate.equals(endDate)) {// 다르면 반복,같으면 종료
			str += "<input type='text' class='dates' value='" + startDate + "'><br>";
			cal.add(Calendar.DATE, 1); // 1일 더해준다
			// System.out.println("date = "+startDate);
			startDate = sdf.format(cal.getTime());
		}
		return str;
	}
}
