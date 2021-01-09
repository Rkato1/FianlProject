package com.kh.camp.used.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.dao.UsedDao;
import com.kh.camp.used.vo.UsedVO;

@Service
public class UsedService {
	@Autowired
	private UsedDao dao;

	public ArrayList<UsedVO> usedPage() {
		return dao.usedPage();
	}

	
}
