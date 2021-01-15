package com.kh.admin.model.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsStickChartData {
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
		
	public static List<List<Map<Object, Object>>> getCanvasjsDataList(ArrayList<String> campNameList, ArrayList<Float> reviewPointList) {
		map=null;
		dataPoints1 = new ArrayList<Map<Object,Object>>();
		list=new ArrayList<List<Map<Object,Object>>>();
		
		//3위까지 출력예정이므로
		if(campNameList.size()<4) {
			for(int i=0; i<campNameList.size(); i++) {
				map = new HashMap<Object,Object>();
				map.put("label", campNameList.get(i));			
				//System.out.println("x값 = "+monthArray.get(i));
				map.put("y", reviewPointList.get(i));
				//System.out.println("y값 = "+monthSales.get(i));
				dataPoints1.add(map);
				//System.out.println(i+"번째 반복");
			}
		}else {
			//순위매기기, 동점일시 처리를 안했음=>따라서 가장 빨리 검색된게 나옴
			int[] rank = new int[reviewPointList.size()];
			for(int i=0; i<reviewPointList.size();i++) {
				rank[i] = 1;
				for(int j=0 ; j<reviewPointList.size() ; j++) {
					if(reviewPointList.get(i) < reviewPointList.get(j)) { 
						rank[i]++; 
					}
				}
			}
			
			for(int i=0; i<3; i++) {
				map = new HashMap<Object,Object>();
				//넣기전에 순위매기기
				for(int j=0; j<rank.length; j++) {
					if(rank[j]==i+1) {
						map.put("label", campNameList.get(i));			
						//System.out.println("x값 = "+monthArray.get(i));
						map.put("y", reviewPointList.get(i));
						//System.out.println("y값 = "+monthSales.get(i));
						dataPoints1.add(map);
						//System.out.println(i+"번째 반복");
					}
				}
			}
		}
		list.add(dataPoints1);
//		System.out.println("크기 = "+list.size());
//		System.out.println("배열 = "+list);
		return list;
	}
}
