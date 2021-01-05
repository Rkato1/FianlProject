package com.cac.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/login.do")
	public String loginFrm() {
		return "member/login";
	}
	
}
