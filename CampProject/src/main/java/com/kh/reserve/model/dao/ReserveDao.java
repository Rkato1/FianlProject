package com.kh.reserve.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveVO;

@Repository
public class ReserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ReserveVO> selectReserveList(ReserveVO reserve) {
		List<ReserveVO> list = sqlSession.selectList("reserve.selectReserveList",reserve);
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

	public SiteVO selectOneSiteOnly(SiteVO s) {
		return sqlSession.selectOne("reserve.selectOneSiteOnly",s);
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

	public int flexOneRserve(ReserveVO reserve) {		
		return sqlSession.update("reserve.flexOneRserve", reserve);
	}

	public SiteVO selectOneSiteNullMember(SiteVO s) {
		return sqlSession.selectOne("reserve.selectOneSiteNullMember",s);
	}

	public ArrayList<CampPictureVO> selectPictureList(HashMap<String, Integer> map) {
		List<CampPictureVO> pictureList = sqlSession.selectList("camp.selectPictureList",map);
		return (ArrayList<CampPictureVO>)pictureList;
	}

	public ArrayList<ReserveVO> selectReserveListNoPlace(ReserveVO reserve) {
		List<ReserveVO> list = sqlSession.selectList("reserve.selectReserveListNoPlace",reserve);
		return (ArrayList<ReserveVO>)list;
	}


	
}
