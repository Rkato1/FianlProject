package com.kh.reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.reserve.model.service.ReserveService;
import com.kh.reserve.model.vo.ReserveVO;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	

	/*
	 * public ReserveController() { super();
	 * System.out.println("ReserveController객체 생성"); }
	 */


	@RequestMapping("/reserveList.do")
	public String reserveList(Model model) {
		ArrayList<ReserveVO> list =service.selectReserveList();
		/* System.out.println("listSize = "+list.size()); */
		model.addAttribute("list", list);
		return "reserve/reserveList";
	}
	
	@RequestMapping("/reserveWriteFrm.do")
	public String reserveWriteFrm(Model model,CampVO camp,String date) {
		//campNo로 모든 사이트 정보 구하기
		ArrayList<SiteVO> sitePriceList = service.selectSitePriceList(camp);
		ArrayList<SiteVO> siteReserveList = service.selectSiteReserveList(camp,date);
		model.addAttribute("sitePriceList", sitePriceList);
		model.addAttribute("siteReserveList", siteReserveList);
		model.addAttribute("date", date);
		return "reserve/reserveWriteFrm";
	}
}
