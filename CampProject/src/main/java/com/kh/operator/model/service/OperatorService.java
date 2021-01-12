package com.kh.operator.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.camp.model.vo.CampPictureVo;
import com.kh.camp.camp.model.vo.CampVO;
import com.kh.operator.model.dao.OperatorDao;

@Service
public class OperatorService {
	@Autowired
	private OperatorDao dao;

	public ArrayList<CampVO> selectCampList(int memberGrade) {
		ArrayList<CampVO> list = dao.selectCampList(memberGrade);
		for(CampVO c : list) {
			ArrayList<CampPictureVo> pictureList = dao.selectPictureList(c.getCampNo());
			c.setPictureList(pictureList);		
		}
		return list;
	}
}
