package com.kh.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.kh.camp.model.service.CampNoticeVO;
import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.operator.model.vo.CampNoticeVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CampVO> selectList(HashMap<String, Integer> map) {
		List<CampVO> list = sqlSession.selectList("camp.selectList",map);
		return (ArrayList<CampVO>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("camp.totalCount");
	}

	public CampVO campView(CampVO c) {
		return sqlSession.selectOne("camp.selectOne",c);
	}

	public ArrayList<CampPictureVO> selectPictureList(HashMap<String, Integer> map) {
		List<CampPictureVO> pictureList = sqlSession.selectList("camp.selectPictureList",map);
		return (ArrayList<CampPictureVO>)pictureList;
	}

	public ArrayList<SiteVO> selectSiteList(SiteVO site) {
		List<SiteVO> siteList = sqlSession.selectList("camp.selectSiteList",site);
		return (ArrayList<SiteVO>)siteList;
	}

	public int reserveTotalCount(SiteVO site) {	
		return sqlSession.selectOne("camp.reserveTotalCount",site);
	}

	public ArrayList<CampNoticeVO> campNoticeList(CampVO c) {
		List<CampNoticeVO> noticeList = sqlSession.selectList("camp.selectCampNoticeList",c);
		return  (ArrayList<CampNoticeVO>)noticeList;
	}

	public ArrayList<CampNoticeVO> selectCampNoticeList(HashMap<String, Integer> map) {
		List<CampNoticeVO> list = sqlSession.selectList("campNotice.selectCampNoticeList",map);
		return (ArrayList<CampNoticeVO>)list;
	}

	public int noticeTotalCount(int campNo) {
		return sqlSession.selectOne("campNotice.cNoticetotalCount",campNo);
	}

	public ArrayList<SiteVO> selectSiteListMap(HashMap<String, Integer> map) {
		List<SiteVO> list = sqlSession.selectList("camp.selectSiteListMap",map);
		return (ArrayList<SiteVO>)list;
	}

	public ArrayList<CampVO> campSearchListObject(HashMap<String, Object> map) {
		List<CampVO> list = sqlSession.selectList("camp.campSearchListObject",map);
		return (ArrayList<CampVO>)list;
	}

	public ArrayList<CampPictureVO> selectPictureListObject(HashMap<String, Object> map) {
		List<CampPictureVO> pictureList = sqlSession.selectList("camp.selectPictureList",map);
		return (ArrayList<CampPictureVO>)pictureList;
	}

	public ArrayList<SiteVO> selectSiteListMapObject(HashMap<String, Object> map) {
		List<SiteVO> list = sqlSession.selectList("camp.selectSiteListMap",map);
		return (ArrayList<SiteVO>)list;
	}

	public int totalSearchCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("camp.totalSearchCount",map);
	}

	public ArrayList<CampVO> campSearchListObject(HashMap<String, Object> map, HashMap<String, Object> map2) {
		List<Integer> campNolist = sqlSession.selectList("camp.campSearchListObject2",map.get("value"));
		//이 리스트가 null값이면 value가 비었거나 일치하는게 없음
		map2.put("list", campNolist);
		List<Integer> reserveCanCampNolist = sqlSession.selectList("camp.campSiteSearchListObject",map2);
		//사실은 날짜 비교를 통해서 해야하지만 현재 상황에선 이게 최선 같음 
		//이 리스트가 null값이면 일치하는 캠핑장들은 예약이 꽉 찼거나 value가 비었거나 일치하는게 없음
		map.put("reserveCanList", reserveCanCampNolist);
		List<CampVO> resultList = sqlSession.selectList("camp.campSearchResultList",map);
		return (ArrayList<CampVO>) resultList;
	}
	
	public int totalSearchCount(HashMap<String, Object> map, HashMap<String, Object> map2) {
		List<Integer> campNolist = sqlSession.selectList("camp.campSearchListObject2",map.get("value"));
		//이 리스트가 null값이면 value가 비었거나 일치하는게 없음
		map2.put("list", campNolist);
		List<Integer> reserveCanCampNolist = sqlSession.selectList("camp.campSiteSearchListObject",map2);
		//사실은 날짜 비교를 통해서 해야하지만 현재 상황에선 이게 최선 같음 
		//이 리스트가 null값이면 일치하는 캠핑장들은 예약이 꽉 찼거나 value가 비었거나 일치하는게 없음
		return reserveCanCampNolist.size();
	}

	public Object getPointAvg(int campNo) {
		return sqlSession.selectOne("camp.pointAvg",campNo);
	}



	//public ArrayList<CampNoticeVO> selectNoticeList(CampVO camp) {
	//	List<CampNoticeVO> noticeList = sqlSession.selectList("camp.selectNoticeList",camp);
	//	return (ArrayList<CampNoticeVO>)noticeList;
	//}	

	
}
