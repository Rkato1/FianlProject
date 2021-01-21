package com.kh.camp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.camp.model.service.CampService;
import com.kh.camp.model.vo.CampEventData;
import com.kh.camp.model.vo.CampPageData;
import com.kh.camp.model.vo.CampVO;
import com.kh.common.DateList;
import com.kh.operator.model.vo.CampNoticePageData;

@Controller
public class CampController {
	@Autowired
	private CampService service;
	@Autowired
	private DateList dateList;

	@RequestMapping("/campList.do")
	public String campList(int reqPage, Model model) {
		CampPageData cpd = service.campList(reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		return "camp/campList";
	}

	@RequestMapping("/campView.do")
	public String campView(HttpSession session,CampVO c, Model model,int reqPage) {
		CampEventData ced = service.campView(c);
		//ArrayList<CampNoticeVO> list = service.campNoticeList(c);
		CampNoticePageData cnpd = service.selectCampNoticeList(c,reqPage);
		model.addAttribute("camp", ced.getCamp());
		model.addAttribute("events", ced.getEvents());
		model.addAttribute("noticeList", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());
		if(ced.getReserveDates().getDateList().size()>0) {
			session.setAttribute("rdv", ced.getReserveDates());
		}
		return "camp/campView";
	}
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar";
	}

	@RequestMapping("/searchCampList.do")
	public String searchCampList(Model model,int reqPage,String keyword,String value) {
		CampPageData cpd = service.campSearchList(reqPage,keyword,value);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("keyword", keyword);
		model.addAttribute("value", value);
		return "camp/campList";
	}
	
	@RequestMapping("/searchCampListTest.do")
	public String searchCampListTest(Model model,int reqPage,String value,String startDate,String endDate) {
		CampPageData cpd = service.campSearchList(reqPage,value,startDate,endDate);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		//model.addAttribute("keyword", keyword);
		model.addAttribute("value", value);
		return "camp/campList";
	}
	
	@ResponseBody
	@RequestMapping("/onload.do")
	public String onload() {
		return dateList.GetStr();
	}
}
