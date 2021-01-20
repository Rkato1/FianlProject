package com.kh.camp.model.vo;

import java.util.ArrayList;

import com.kh.reserve.model.vo.ReserveDatesVO;

import lombok.Data;

@Data
public class CampEventData {
	private CampVO camp;
	private String events;
	private ReserveDatesVO reserveDates;
}
