package com.kh.camp.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.member.model.service.MemberService;
import com.kh.camp.member.model.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping("/login.do")
	public String login(MemberVO m, HttpSession session, Model model) {
		MemberVO member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("m", member);
			model.addAttribute("msg", "로그인 되었습니다.");
			model.addAttribute("loc", "/WEB-INF/views/member/blank.jsp");
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("loc", "/WEB-INF/views/member/blank.jsp");
		}
		return "common/msg";
	}
	
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	
}
