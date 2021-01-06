package com.kh.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.model.dao.AdminDao;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;
}
