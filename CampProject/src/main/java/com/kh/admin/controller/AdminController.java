package com.kh.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.admin.model.vo.CampVOPageData;
import com.kh.admin.model.vo.ChartBasicData;
import com.kh.admin.model.vo.MemberVOPageData;
import com.kh.admin.model.vo.ReserveVOPageData;
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
		if(member!= null && member.getMemberId().equals("admin")) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/mainAdmin.do")
	public String mainAdmin(HttpSession session, Model model) {
		isAdmin = isAdmin(session);
		if(isAdmin) {			
			return "admin/mainAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/memberAdmin.do")
	public String memberAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {			
			MemberVOPageData mpd = service.selectAllMember(reqPage);
			model.addAttribute("list",mpd.getList());
			model.addAttribute("pageNavi",mpd.getPageNavi());
			return "admin/memberAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/businessAdmin.do")
	public String businessAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			CampVOPageData cpd = service.selectAllBusiness(reqPage);
			model.addAttribute("list",cpd.getList());
			model.addAttribute("pageNavi",cpd.getPageNavi());
			return "admin/businessAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/reserveAdmin.do")
	public String reserveAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			ReserveVOPageData rpd = service.selectAllReserve(reqPage);
			model.addAttribute("list",rpd.getList());
			model.addAttribute("pageNavi",rpd.getPageNavi());
			return "admin/reserveAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/salesAdmin.do")
	public String salesAdmin(Model model, HttpSession session, int campNo, int year) {
		isAdmin = isAdmin(session);
		if(isAdmin) {			
			ArrayList<Integer> numList = service.getNumList();
			ArrayList<String> nameList = service.nameList(numList);
			ArrayList<ChartBasicData> dataList = new ArrayList<ChartBasicData>();
			for(int i=0; i<numList.size(); i++) {
				dataList.add(new ChartBasicData(numList.get(i), nameList.get(i)));
			}
			String campName="";			
			if(campNo==0) {
				campNo = dataList.get(0).getCampNo();
				campName = dataList.get(0).getCampName();
			}else {
				for(ChartBasicData cbd : dataList) {
					if(cbd.getCampNo()==campNo) {
						campName = cbd.getCampName();
					}
				}
			}
			if(year==0) {
				//원래는 달력기준 올해로 설정해야함
				year = 2021;
			}
			
			List<List<Map<Object, Object>>> list = service.getCanvasjsChartData(campNo, year);
			model.addAttribute("dataPointsList", list);
			model.addAttribute("list", dataList);			
			model.addAttribute("campName", campName);
			model.addAttribute("year", year);
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
			List<List<Map<Object, Object>>> list = service.getCanvasjsStickChartData();
			model.addAttribute("dataPointsList", list);
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
