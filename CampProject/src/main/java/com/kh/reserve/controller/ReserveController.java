package com.kh.reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.reserve.model.service.ReserveService;
import com.kh.reserve.model.vo.ReserveListsVO;
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
		//ArrayList<SiteVO> sitePriceList = service.selectSitePriceList(camp);		
		//ArrayList<SiteVO> siteReserveList = service.selectSiteReserveList(camp,date);
		ReserveListsVO rlv = service.selectAllLists(camp, date);
		CampVO c =  service.selectOneCamp(camp);
		System.out.println("memberList.size = "+rlv.getMemberList().size());
		System.out.println("reserveList.size = "+rlv.getReserveList().size());
		
		model.addAttribute("sitePriceList", rlv.getSitePriceList());
		model.addAttribute("siteList", rlv.getSiteList());
		model.addAttribute("memberList", rlv.getMemberList());
		model.addAttribute("reserveList", rlv.getReserveList());
		model.addAttribute("camp", c);
		model.addAttribute("date", date);
		return "reserve/reserveWriteFrm";
	}	

	@RequestMapping("/insertReserve.do")
	public String insertReserveTest(Model model,ReserveVO reserve,String siteArr) {
		int result = service.insertReserve(reserve,siteArr);
		if((result) > 0) {
			model.addAttribute("msg", "site = "+result+"개 입력 올바르게 예약 되었습니다.");			
		}else {
			model.addAttribute("msg", "예약이 실패했습니다.");
		}
		model.addAttribute("loc", "/reserveWriteFrm.do?campNo="+reserve.getCampNo()+"&date="+reserve.getCheckInDate());
		return "common/msg";
	}
}
