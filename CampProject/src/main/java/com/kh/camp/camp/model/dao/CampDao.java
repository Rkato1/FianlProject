package com.kh.camp.camp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.camp.model.vo.CampVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CampVO> selectCampList() {
		List<CampVO> list = sqlSession.selectList("camp.selectList");
		return (ArrayList<CampVO>)list;
	}
}
