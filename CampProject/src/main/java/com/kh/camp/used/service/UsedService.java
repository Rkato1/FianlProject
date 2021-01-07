package com.kh.camp.used.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.dao.UsedDao;
import com.kh.camp.used.vo.UsedPageNavi;
import com.kh.camp.used.vo.UsedVO;

@Service
public class UsedService {
	@Autowired
	private UsedDao dao;

	public UsedPageNavi usedPage(int reqPage) {
		//게시물을 구해올값
		int numperPage = 9;
		//게시물 9개 가져오기 -> start값 end값 계산
		int end = reqPage * numperPage;
		int start = end - numperPage + 1;
		ArrayList<UsedVO> list = dao.usedPage(end, start);
		return null;
	}
	
}
