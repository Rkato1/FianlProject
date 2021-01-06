package com.kh.reserve.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.reserve.model.dao.ReserveDao;
import com.kh.reserve.model.vo.ReserveVO;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao dao;

	public ReserveService() {
		super();
		System.out.println("ReserveService객체생성");
	}

	public ArrayList<ReserveVO> selectReserveList() {
		
		return dao.selectReserveList();
	}
}
