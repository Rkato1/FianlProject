package com.kh.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.member.model.vo.MemberVO;

@Repository
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<MemberVO> selectMemberList(HashMap<String, Integer> map) {
		List<MemberVO> list = sqlSession.selectList("selectMemberList",map);
		return (ArrayList<MemberVO>)list;
	}

	public int totalCount() {
		//List<Object> list = sqlSession.selectList("selectAllMemberCount");
		return sqlSession.selectOne("selectAllMemberCount");
	}
}
