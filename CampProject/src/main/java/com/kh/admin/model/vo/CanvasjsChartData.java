package com.kh.admin.model.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsChartData {
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();

	public static List<List<Map<Object, Object>>> getCanvasjsDataList(ArrayList<String> monthArray,
			ArrayList<Integer> monthSales) {
		//static이므로 초기화
		map=null;
		dataPoints1 = new ArrayList<Map<Object,Object>>();
		list=new ArrayList<List<Map<Object,Object>>>();
		
		for(int i=0; i<monthArray.size(); i++) {
			map = new HashMap<Object,Object>();
			map.put("x", monthArray.get(i));
			//System.out.println("x값 = "+monthArray.get(i));
			map.put("y", monthSales.get(i));
			//System.out.println("y값 = "+monthSales.get(i));
			dataPoints1.add(map);
			System.out.println(i+"번째 반복");
		}
		list.add(dataPoints1);
		//이부분 중복이 되는데 위에  null값넣던지 처리
		System.out.println("크기 = "+list.size());
		System.out.println("배열 = "+list);
		return list;
	} 
}
