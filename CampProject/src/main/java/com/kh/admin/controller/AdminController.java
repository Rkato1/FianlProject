package com.kh.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.admin.service.AdminService;
import com.kh.member.model.vo.MemberVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	boolean isAdmin = false;
	
	@RequestMapping("/memberAdmin.do")
	public String memberAdmin(MemberVO m) {
		isAdmin = isAdmin(m);
		if(isAdmin) {
			return "admin/member";
		}else {
			return "common/msg";
		}
	}
	
	@RequestMapping("/test.do")
	public String test() {		
		//return "admin/memberAdmin";
		return "admin/businessAdmin";
	}
	
	//admin이 맞는지 판단하는 함수
	private boolean isAdmin(MemberVO m) {
		MemberVO member = service.selectOneMember(m);
		if(member.getMemberId().equals("admin")) {
			return true;
		} else {
			return false;
		}
	}
}
