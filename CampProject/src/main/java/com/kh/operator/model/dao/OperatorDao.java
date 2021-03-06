package com.kh.operator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.reserve.model.vo.ReserveVO;
import com.kh.review.model.vo.ReviewCampVO;
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
	public ArrayList<CampPictureVO> selectPictureList(HashMap<String, Integer> map) {
		List<CampPictureVO> list = sqlSession.selectList("camp.selectPictureList",map);
		System.out.println("dao : "+list.size());
		return (ArrayList<CampPictureVO>)list;
	}
	public ArrayList<CampNoticeVO> selectCampNoticeList(HashMap<String, Integer> map) {
		List<CampNoticeVO> list = sqlSession.selectList("campNotice.selectCampNoticeList",map);
		return (ArrayList<CampNoticeVO>)list;
	}
	public int totalCount(int cNo) {
		return sqlSession.selectOne("campNotice.cNoticetotalCount",cNo);
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
	public ArrayList<ReviewCampVO> selectReviewList(HashMap<String, Integer> map) {
		List<ReviewCampVO> list = sqlSession.selectList("review.selectList",map);
		return (ArrayList<ReviewCampVO>)list;
	}
	public int reviewTotalCount(int campNo) {
		return sqlSession.selectOne("review.reviewTotalCount",campNo);
	}
	public int deleteCamp(int campNo) {
		return sqlSession.delete("camp.deleteCamp", campNo);
	}
	public int insertCamp(CampVO c) {
		return sqlSession.insert("camp.insertCamp", c);
	}
	public int selectLastCamp() {
		return sqlSession.selectOne("camp.selectLastCamp");
	}
	public int insertPicture(CampPictureVO cpv) {
		return sqlSession.insert("camp.insertCampPicture", cpv);
	}
	public int deleteCampPicture(int campNo) {
		return sqlSession.delete("camp.deleteCampPicture", campNo);
	}
	public int updateCamp(CampVO c) {
		return sqlSession.update("camp.updateCamp",c);
	}
	public int updateMainImg(CampPictureVO cp) {
		return sqlSession.update("camp.updateMainImg",cp);
	}
	public ArrayList<SiteVO> selectSiteList(CampVO c) {
		List<SiteVO> list = sqlSession.selectList("camp.selectSiteListNo", c.getCampNo());
		return (ArrayList<SiteVO>)list;
	}
	public ArrayList<String> selectCategorys(int campNo) {
		List<String> list = sqlSession.selectList("camp.selectCategorys", campNo);
		return (ArrayList<String>)list;
	}
	public int insertSite(SiteVO s) {
		return sqlSession.insert("camp.insertSite", s);
	}
	public int updateSite(SiteVO s) {
		return sqlSession.update("camp.updateSite", s);
	}
	public int deleteSite(int siteNo) {
		return sqlSession.delete("camp.deleteSite", siteNo);
	}
	public SiteVO selectOneSite(int siteNo) {
		return sqlSession.selectOne("camp.selectOneSite", siteNo);
	}
	public int updateInfoImg(CampPictureVO f) {
		return sqlSession.update("camp.updateInfoImg", f);
	}
	public int insertInfoImg(CampPictureVO f) {
		return sqlSession.insert("camp.insertCampPicture", f);
	}
	public ArrayList<ReserveVO> selectReserveList(ReserveVO r) {
		 List<ReserveVO> list = sqlSession.selectList("reserve.selectReserveList", r);
		 return (ArrayList<ReserveVO>)list;
	}

}
