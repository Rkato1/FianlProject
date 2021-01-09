package com.kh.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.review.model.vo.ReviewVO;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ReviewVO> selectList(HashMap<String, Integer> map) {
		List<ReviewVO> list = sqlSession.selectList("review.selectList",map);
		return (ArrayList<ReviewVO>)list;
	}
	
	public int totalCount() {
		return sqlSession.selectOne("review.totalCount");
	}

}
