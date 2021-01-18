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
		System.out.println("순위 = "+rank);
		//동점시 빠른게 들어가니까 중복검사 후 넣기
		for(int i=0; i<3; i++) {
			map = new HashMap<Object,Object>();
			for(int j=0; j<rank.length; j++) {
				if(rank[j]==i+1) {
					map.put("label", campNameList.get(j));
					//System.out.println("x값 = "+campNameList.get(i));
					map.put("y", reviewPointList.get(j));
					//System.out.println("y값 = "+reviewPointList.get(i));
					if(dataPoints1.size()==3) {
						break;
					}else {
						dataPoints1.add(map);
						//System.out.println(i+"번째 반복");
					}
				}
			}
		}
		
		//1등과 2등의 순서를 바꿔서 2 1 3 순서로 출력되게 변환
		map = new HashMap<Object,Object>();
		map = dataPoints1.get(0);
		dataPoints1.set(0, dataPoints1.get(1));
		dataPoints1.set(1, map);
		
		list.add(dataPoints1);
//		System.out.println("배열 = "+list);
		return list;
	}

	public static List<List<Map<Object, Object>>> getCanvasjsDataList2(ArrayList<String> campNameList,
			ArrayList<Integer> salesList) {
		map=null;
		dataPoints1 = new ArrayList<Map<Object,Object>>();
		list=new ArrayList<List<Map<Object,Object>>>();
		
		//순위매기기, 동점일시 처리를 안했음=>따라서 가장 빨리 검색된게 나옴
		int[] rank = new int[salesList.size()];
		for(int i=0; i<salesList.size();i++) {
			rank[i] = 1;
			for(int j=0 ; j<salesList.size() ; j++) {
				if(salesList.get(i) < salesList.get(j)) { 
					rank[i]++; 
				}
			}
		}
		for(int i=0; i<3; i++) {
			map = new HashMap<Object,Object>();
			for(int j=0; j<rank.length; j++) {					
				if(rank[j]==i+1) {
					map.put("label", campNameList.get(j));			
					//System.out.println("x값 = "+campNameList.get(j));
					map.put("y", salesList.get(j));
					//System.out.println("y값 = "+salesList.get(j));
					if(dataPoints1.size()==3) {
						break;
					}else {
						dataPoints1.add(map);
						//System.out.println(i+"번째 반복");
					}
				}
			}
		}		
		
		//1등과 2등의 순서를 바꿔서 2 1 3 순서로 출력되게 변환
		map = new HashMap<Object,Object>();
		map = dataPoints1.get(0);
		dataPoints1.set(0, dataPoints1.get(1));
		dataPoints1.set(1, map);
		
		list.add(dataPoints1);
		//System.out.println("크기 = "+list.size());
		//System.out.println("배열 = "+list);
		return list;
	}
}
