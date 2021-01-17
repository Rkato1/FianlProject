package com.kh.camp.used.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.dao.UsedDao;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedPageNavi;
import com.kh.camp.used.vo.UsedVO;

@Service
public class UsedService {
	@Autowired
	private UsedDao dao;

	// 페이지 초기 리스트
	public UsedPageNavi usedPage(int reqPage) {
		// 한 페이지의 게시물 수를 정함
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<UsedVO> list = dao.usedPage(map);
		for (UsedVO u : list) {
			map.put("usedNo", u.getUsedNo());
			ArrayList<UsedFileVO> fileList = dao.UsedFileList(map);
			u.setFile(fileList);
		}
		int totalCount = dao.totalCount();
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/usedPage.do?reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>&nbsp;";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>&nbsp;"; // <a
																				// href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>&nbsp;";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		UsedPageNavi cpn = new UsedPageNavi();
		cpn.setList(list);
		cpn.setPageNavi(pageNavi);
		return cpn;
	}

	// 페이지 검색 리스트
	public UsedPageNavi usedSearch(int reqPage, String search) {
		// 한 페이지의 게시물 수를 정함
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		ArrayList<UsedVO> list = dao.usedSearch(map);
		for (UsedVO u : list) {
			map.put("usedNo", u.getUsedNo());
			ArrayList<UsedFileVO> fileList = dao.UsedFileListSearch(map);
			u.setFile(fileList);
		}
		int totalCount = dao.totalCountSearch(search);
		System.out.println("count개수" + totalCount);
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/usedPage.do?reqPage=";
		
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>&nbsp;";
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>&nbsp;"; // <a
																				// href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>&nbsp;";
			}
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		
		// 검색 후에 조회된 결과가 없으면 페이지 네비 없애기
		if (totalCount == 0) {
			pageNavi = "";
		}
		
		UsedPageNavi cpn = new UsedPageNavi();
		cpn.setList(list);
		cpn.setPageNavi(pageNavi);
		return cpn;
	}
	public int usedEnrollOk(UsedVO usedVO) {
		int result = dao.usedEnrollOk(usedVO);
		if (result > 0) {
			int usedNo = dao.selectNo();
			System.out.println(usedNo);
			for (UsedFileVO ufv : usedVO.getFile()) {
				result = dao.insertFile(usedNo, ufv.getFilename(), ufv.getFilepath());
			}
		}
		return result;
	}
	// Datail 중고판매 상세정보를 보기위한 service
	public UsedVO selectDatail(UsedVO used) {
		return dao.selectDatail(used);
	}

}
