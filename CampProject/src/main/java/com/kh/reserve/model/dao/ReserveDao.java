package com.kh.reserve.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveVO;

@Repository
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	/*
	 * public ReserveDao() { super(); System.out.println("ReserveDao객체생성"); }
	 */



	public ArrayList<ReserveVO> selectReserveList() {
		List<ReserveVO> list = sqlSession.selectList("reserve.selectList");
		return (ArrayList<ReserveVO>)list;
	}

	public ArrayList<SiteVO> selectSitePriceList(CampVO camp) {
		List<SiteVO> list = sqlSession.selectList("reserve.selectSitePriceList",camp);
		return (ArrayList<SiteVO>)list;
	}

	public ArrayList<SiteVO> selectSiteReserveList(HashMap<String, Object> map) {
		List<SiteVO> list = sqlSession.selectList("reserve.selectSiteReserveList",map);
		return (ArrayList<SiteVO>)list;
	}

	public ArrayList<SiteVO> selectSiteList(HashMap<String, Object> map) {
		List<SiteVO> list = sqlSession.selectList("reserve.selectSiteList",map);
		return (ArrayList<SiteVO>)list;
	}

	public SiteVO selectOneSite(SiteVO s) {
		return sqlSession.selectOne("reserve.selectOneSite",s);
	}

	public MemberVO selectOneMemberNo(MemberVO m) {
		return sqlSession.selectOne("reserve.selectOneMemberNo",m);
	}

	public CampVO selectOneCamp(CampVO camp) {		
		return sqlSession.selectOne("camp.selectOne",camp);
	}
	

	public int insertSite(SiteVO s) {		
		return sqlSession.insert("reserve.insertSite", s);
	}

	public int insertReserve(ReserveVO reserve) {
		return sqlSession.insert("reserve.insertReserve", reserve);
	}

	public ReserveVO selectOneReserve(HashMap<String, Object> map) {
		return sqlSession.selectOne("reserve.selectOneReserveMap", map);
	}

	public ReserveVO selectOneReserve(ReserveVO reserve) {		
		return sqlSession.selectOne("reserve.selectOneReserve", reserve);
	}

	public SiteVO selectOneSiteReserve(ReserveVO r) {		
		return sqlSession.selectOne("reserve.selectOneSiteReserve", r);
	}

	public int updateReserve(ReserveVO reserve) {		
		return sqlSession.update("reserve.updateReserve", reserve);
	}

	public int deleteSite(SiteVO site) {		
		return sqlSession.delete("reserve.deleteSite", site);
	}

	public int deleteReserve(ReserveVO reserve) {
		return sqlSession.delete("reserve.deleteReserve", reserve);

	}
}
