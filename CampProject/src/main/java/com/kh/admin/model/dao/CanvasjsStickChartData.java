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
		map.put("x", 1167589800000L);
		map.put("y", 188);
		dataPoints1.add(map);		
		map = new HashMap<Object,Object>();
		map.put("x", 1199125800000L);
		map.put("y", 213);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1230748200000L);
		map.put("y", 213);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1262284200000L);
		map.put("y", 219);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1293820200000L);
		map.put("y", 207);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1325356200000L);
		map.put("y", 167);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1356978600000L);
		map.put("y", 136);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1388514600000L);
		map.put("y", 152);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1420050600000L);
		map.put("y", 129);
		dataPoints1.add(map);
		map = new HashMap<Object,Object>();
		map.put("x", 1451586600000L);
		map.put("y", 155);
		dataPoints1.add(map);
 
		list.add(dataPoints1);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}
