package com.kh.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.service.CampService;
import com.kh.camp.model.vo.CampEventData;
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
	public String campView(CampVO c, Model model) {
		CampEventData ced = service.campView(c);		
		model.addAttribute("camp", ced.getCamp());
		model.addAttribute("events", ced.getEvents());
		//model.addAttribute("list", ced.getNoticeList());
		return "camp/campView";
	}

	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar";
	}
	
}
