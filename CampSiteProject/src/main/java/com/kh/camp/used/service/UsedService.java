package com.kh.camp.used.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.dao.UsedDao;

@Service
public class UsedService {
	@Autowired
	private UsedDao dao;
	
}
