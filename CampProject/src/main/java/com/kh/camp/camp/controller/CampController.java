package com.kh.camp.camp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.camp.model.service.CampService;
import com.kh.camp.camp.model.vo.CampVO;

@Controller
public class CampController {
	@Autowired
	private CampService service;
	
	@RequestMapping("/campList.do")
	public String campList(Model model) {
		ArrayList<CampVO> list =service.selectCampList();
		System.out.println("listSize = "+list.size());
		model.addAttribute("list", list);
		return "camp/campList";
	}
}
