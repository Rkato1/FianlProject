package com.kh.camp.used.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.used.service.UsedService;

@Controller
public class UsedController {

	@Autowired
	private UsedService service;
	
	@RequestMapping("/usedPage.do")
	public String usedPage() {
		return "used/usedPage";
	}
	@RequestMapping("/usedDatail.do")
	public String usedDatail() {
		return "used/usedDatail";
	}
}
