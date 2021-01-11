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

	public UsedPageNavi usedPage(int reqPage) {
		//한 페이지의 게시물 수를 정함
		int numPerPage = 9;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);		
		ArrayList<UsedVO> list = dao.usedPage(map);
		for(UsedVO u : list) {
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
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>";  // <a href='/noticeList.do?reqPage=1'>1</a>
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
		UsedPageNavi cpn = new UsedPageNavi();
		cpn.setList(list);
		cpn.setPageNavi(pageNavi);
		return cpn;
	}

	public int usedEnrollOk(UsedVO usedVO) {
		int result = dao.usedEnrollOk(usedVO);
		if(result > 0) {
			int usedNo = usedVO.getUsedNo();
			for(UsedFileVO ufv : usedVO.getFile()) {
				result = dao.insertFile(ufv);
			}
		}
		return result;
	}

	
}
