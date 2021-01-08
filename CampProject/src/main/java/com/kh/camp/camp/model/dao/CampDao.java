package com.kh.camp.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.camp.model.vo.CampVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CampVO> selectList(HashMap<String, Integer> map) {
		List<CampVO> list = sqlSession.selectList("camp.selectList",map);
		return (ArrayList<CampVO>)list;
	}

	public int totalCount() {	
		return sqlSession.selectOne("camp.totalCount");
	}

	public CampVO campView(CampVO c) {
		return sqlSession.selectOne("camp.selectOne",c);
	}
}
