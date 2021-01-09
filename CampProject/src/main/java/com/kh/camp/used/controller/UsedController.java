package com.kh.camp.used.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.member.model.vo.MemberVO;
import com.kh.camp.used.service.UsedService;
import com.kh.camp.used.vo.UsedVO;


@Controller
public class UsedController {

	@Autowired
	private UsedService service;
	
	@RequestMapping("/usedPage.do")
	public String usedPage(Model model) {
		ArrayList<UsedVO> list = service.usedPage();
		model.addAttribute("list",list);
		return "used/usedPage";
	}
	@RequestMapping("/usedDatail.do")
	public String usedDatail(String memberId,Model model) {
		
		return "used/usedDatail";
	}
	@RequestMapping("/usedEnroll.do")
	public String usedEnroll() {
		return "used/usedEnroll";
	}
}
