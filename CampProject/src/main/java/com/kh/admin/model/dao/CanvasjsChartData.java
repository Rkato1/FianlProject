package com.kh.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsChartData {
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
	
	static {
		//기존 dummy data
//		map = new HashMap<Object,Object>();
//		map.put("x", 1483209000000L);
//		map.put("y", 7);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1485887400000L);
//		map.put("y", 6);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1488306600000L);
//		map.put("y", 6);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1490985000000L);
//		map.put("y", 9);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1493577000000L);
//		map.put("y", 11);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1496255400000L);
//		map.put("y", 14);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1498847400000L);
//		map.put("y", 17);		
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1501525800000L);
//		map.put("y", 18);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1504204200000L);
//		map.put("y", 17);
//		dataPoints1.add(map);		
//		map = new HashMap<Object,Object>();
//		map.put("x", 1506796200000L);
//		map.put("y", 15);
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1509474600000L);
//		map.put("y", 12);		
//		dataPoints1.add(map);
//		map = new HashMap<Object,Object>();
//		map.put("x", 1512066600000L);
//		map.put("y", 9);
//		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1);
		map.put("y", 7);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 2);
		map.put("y", 6);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 3);
		map.put("y", 6);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 4);
		map.put("y", 9);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 5);
		map.put("y", 11);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 6);
		map.put("y", 14);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 7);
		map.put("y", 17);		
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 8);
		map.put("y", 18);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 9);
		map.put("y", 17);
		dataPoints1.add(map);		
		map = new HashMap<Object,Object>();
		map.put("x", 10);
		map.put("y", 15);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 11);
		map.put("y", 12);		
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 12);
		map.put("y", 9);
		dataPoints1.add(map);
 
		list.add(dataPoints1);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}
