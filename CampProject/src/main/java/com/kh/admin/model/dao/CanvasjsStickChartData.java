package com.kh.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsStickChartData {
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
	
	static {
		
		map = new HashMap<Object,Object>();
		map.put("label", "A");
		map.put("y", 3.2);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("label", "B");
		map.put("y", 2.4);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("label", "C");
		map.put("y", 4.8);
		dataPoints1.add(map);
 
		list.add(dataPoints1);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}
