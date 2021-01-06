package com.kh.camp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
}
