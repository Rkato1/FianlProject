package com.kh.camp.used.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.used.vo.UsedVO;


@Repository
public class UsedDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<UsedVO> usedPage() {
		List<UsedVO> list = sqlSession.selectList("used.selectList");
		return (ArrayList<UsedVO>)list;
	}
	
	
}
