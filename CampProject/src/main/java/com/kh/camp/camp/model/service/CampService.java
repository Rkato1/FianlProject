package com.kh.camp.camp.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.camp.model.dao.CampDao;
import com.kh.camp.camp.model.vo.CampVO;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

	public ArrayList<CampVO> selectCampList() {
		return dao.selectCampList();
	}
}
