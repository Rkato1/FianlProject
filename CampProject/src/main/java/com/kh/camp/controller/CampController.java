package com.kh.camp.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.service.CampService;
import com.kh.camp.model.vo.CampPageData;
import com.kh.camp.model.vo.CampVO;


@Controller
public class CampController {
	@Autowired
	private CampService service;
	
	@RequestMapping("/campList.do")
	public String campList(int reqPage, Model model) {
		CampPageData cpd = service.campList(reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		return "camp/campList";
	}
	
	@RequestMapping("/campView.do")
	public String campView(CampVO c,Model model) {
		CampVO camp = service.campView(c);		
		model.addAttribute("camp", camp);
		return "camp/campView";
	}
}
