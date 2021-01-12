package com.kh.operator.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.camp.model.vo.CampVO;

@Repository
public class OperatorDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public ArrayList<CampVO> selectCampList(int memberGrade) {
		List<CampVO> list = sqlSession.selectList("camp.selectCampList");
		return (ArrayList<CampVO>)list;
	}

}
