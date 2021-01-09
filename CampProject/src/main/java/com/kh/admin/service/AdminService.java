package com.kh.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.model.dao.AdminDao;
import com.kh.member.model.vo.MemberVO;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	
	public MemberVO selectOneMember(MemberVO m) {
		// TODO Auto-generated method stub
		return null;
	}
}
