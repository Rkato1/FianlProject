package com.kh.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		// TODO Auto-generated method stub
		return null;
	}

}
