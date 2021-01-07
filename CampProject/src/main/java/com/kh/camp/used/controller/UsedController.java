package com.kh.camp.used.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.used.service.UsedService;
import com.kh.camp.used.vo.UsedPageNavi;

@Controller
public class UsedController {

	@Autowired
	private UsedService service;
	
	@RequestMapping("/usedPage.do")
	public String usedPage(int reqPage, Model model) {
		UsedPageNavi upn = service.usedPage(reqPage);
		return "used/usedPage";
	}
	@RequestMapping("/usedDatail.do")
	public String usedDatail() {
		return "used/usedDatail";
	}
	@RequestMapping("/usedEnroll.do")
	public String usedEnroll() {
		return "used/usedEnroll";
	}
}
