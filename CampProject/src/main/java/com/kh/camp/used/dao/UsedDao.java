package com.kh.camp.used.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedVO;


@Repository
public class UsedDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<UsedVO> usedPage(HashMap<String, Integer> map) {
		List<UsedVO> list = sqlSession.selectList("used.selectList",map);
		return (ArrayList<UsedVO>)list;
	}

	public ArrayList<UsedFileVO> UsedFileList(HashMap<String, Integer> map) {
		List<UsedFileVO> fileList = sqlSession.selectList("used.selectFileList",map);
		return (ArrayList<UsedFileVO>)fileList;
	}

	public int totalCount() {
		return sqlSession.selectOne("camp.totalCount");
	}
	
	
}
