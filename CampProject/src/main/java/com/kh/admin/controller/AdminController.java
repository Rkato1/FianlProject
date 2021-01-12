package com.kh.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.admin.service.AdminService;
import com.kh.member.model.vo.MemberVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	boolean isAdmin = false;
	
	//admin이 맞는지 판단하는 함수
	private boolean isAdmin(HttpSession session) {
		//MemberVO member = service.selectOneMember(m);
		MemberVO member = (MemberVO) session.getAttribute("m");
		if(member.getMemberId().equals("admin")) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/memberAdmin.do")
	public String memberAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/memberAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/businessAdmin.do")
	public String businessAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/businessAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/reserveAdmin.do")
	public String reserveAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/reserveAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/salesAdmin.do")
	public String salesAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/salesAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/greatcampAdmin.do")
	public String greatcampAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/greatcampAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/helpAdmin.do")
	public String helpAdmin(Model model, HttpSession session) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/helpAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/test.do")
	public String test() {
		//return "admin/memberAdmin";
		return "admin/helpAdmin";
	}
	
	
}
