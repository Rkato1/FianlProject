package com.kh.reserve.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.reserve.model.vo.ReserveVO;

@Repository
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	public ReserveDao() {
		super();
		System.out.println("ReserveDao객체생성");
	}



	public ArrayList<ReserveVO> selectReserveList() {
		List<ReserveVO> list = sqlSession.selectList("reserve.selectList");
		return (ArrayList<ReserveVO>)list;
	}
}
