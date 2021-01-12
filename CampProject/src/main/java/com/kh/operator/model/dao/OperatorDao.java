package com.kh.operator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.camp.model.vo.CampPictureVo;
import com.kh.camp.camp.model.vo.CampVO;

@Repository
public class OperatorDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public ArrayList<CampVO> selectCampList(CampVO c) {
		List<CampVO> list = sqlSession.selectList("camp.selectCamp",c);
		return (ArrayList<CampVO>)list;
	}
	public CampVO selectOneCamp(CampVO c) {
		return sqlSession.selectOne("camp.selectCamp",c);
	}
	public ArrayList<CampPictureVo> selectPictureList(HashMap<String, Integer> map) {
		List<CampPictureVo> list = sqlSession.selectList("camp.selectPictureList",map);
		return (ArrayList<CampPictureVo>)list;
	}

}
