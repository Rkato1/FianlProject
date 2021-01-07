package com.kh.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.admin.service.AdminService;
import com.kh.camp.member.model.vo.MemberVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	
	
	public AdminController() {
		super();
//		MemberVO member = service.selectOneMember(m);
//		if(member != null) {
//			session.setAttribute("m", member);
//			model.addAttribute("msg", "로그인 되었습니다.");
//			model.addAttribute("loc", "/WEB-INF/views/member/blank.jsp");
//		} else {
//			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
//			model.addAttribute("loc", "/WEB-INF/views/member/blank.jsp");
//		}
//		return "common/msg";
	}



	@RequestMapping("/member.do")
	public String member() {
		
	}
}
