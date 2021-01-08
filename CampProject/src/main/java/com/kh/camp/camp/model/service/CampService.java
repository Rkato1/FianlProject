package com.kh.camp.camp.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.camp.model.dao.CampDao;
import com.kh.camp.camp.model.vo.CampPageData;
import com.kh.camp.camp.model.vo.CampPictureVo;
import com.kh.camp.camp.model.vo.CampVO;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

	public CampPageData campList(int reqPage) {
		int numPerPage = 20;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);		
		ArrayList<CampVO> list = dao.selectList(map);
		for(CampVO c : list) {
			map.put("campNo",c.getCampNo());
			map.put("filegrade", 1);
			ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
			c.setPictureList(pictureList);		
		}
		int totalCount = dao.totalCount();
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/campList.do?reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>";// <a href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		CampPageData cpd = new CampPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}

	public CampVO campView(CampVO c) {
		CampVO camp = dao.campView(c);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("campNo", c.getCampNo());
		map.put("filegrade", 2);
		ArrayList<CampPictureVo> pictureList = dao.selectPictureList(map);
		camp.setPictureList(pictureList);
		return camp;
	}
}
