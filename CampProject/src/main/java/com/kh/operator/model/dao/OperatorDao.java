package com.kh.operator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.model.vo.CampPictureVo;
import com.kh.camp.model.vo.CampVO;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.review.model.vo.ReviewVO;

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
	public ArrayList<CampNoticeVO> selectCampNoticeList(HashMap<String, Integer> map) {
		List<CampNoticeVO> list = sqlSession.selectList("campNotice.selectCampNoticeList",map);
		return (ArrayList<CampNoticeVO>)list;
	}
	public int totalCount() {
		return sqlSession.selectOne("campNotice.cNoticetotalCount");
	}
	public CampNoticeVO selectCampNotice(CampNoticeVO cn) {
		return sqlSession.selectOne("campNotice.selectCampNotice",cn);
	}
	public int insertCampNotice(CampNoticeVO cn) {
		return sqlSession.insert("campNotice.insertCampNotice", cn);
	}
	public int updateCampNotice(CampNoticeVO cn) {
		return sqlSession.update("campNotice.updateCampNotice", cn);
	}
	public int deleteCampNotice(CampNoticeVO cn) {
		return sqlSession.delete("campNotice.deleteCampNotice",cn);
	}

}
