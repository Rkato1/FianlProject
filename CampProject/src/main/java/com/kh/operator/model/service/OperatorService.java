package com.kh.operator.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.camp.model.vo.CampPictureVo;
import com.kh.camp.camp.model.vo.CampVO;
import com.kh.operator.model.dao.OperatorDao;

@Service
public class OperatorService {
	@Autowired
	private OperatorDao dao;

	public ArrayList<CampVO> selectCampList(CampVO c) {
		ArrayList<CampVO> list = dao.selectCampList(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for(CampVO camp : list) {
			map.put("campNo",camp.getCampNo());
			map.put("filegrade", 1);
			ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
			c.setPictureList(pictureList);		
		}
		return list;
	}

	public CampVO selectOneCamp(CampVO c) {
		CampVO camp = dao.selectOneCamp(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", camp.getCampNo());
		map.put("filegrade", 2);
		ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
		camp.setPictureList(pictureList);
		return camp;
	}
}
