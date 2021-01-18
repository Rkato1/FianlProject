package com.kh.admin.model.vo;

import lombok.Data;

@Data
public class ChartBasicData {
	int campNo;
	String campName;
	public ChartBasicData(int campNo, String campName) {
		super();
		this.campNo = campNo;
		this.campName = campName;
	}
	
}
