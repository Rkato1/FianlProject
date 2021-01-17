package com.kh.reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.member.model.vo.MemberVO;
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
		ReserveListsVO rlv = service.selectAllLists(camp, date);
		CampVO c =  service.selectOneCamp(camp);		
		
		model.addAttribute("sitePriceList", rlv.getSitePriceList());
		model.addAttribute("siteList", rlv.getSiteList());
		model.addAttribute("memberList", rlv.getMemberList());
		model.addAttribute("reserveList", rlv.getReserveList());
		model.addAttribute("camp", c);
		model.addAttribute("date", date);
		return "reserve/reserveWriteFrm";
	}	

	@RequestMapping("/insertReserve.do")
	public String insertReserve(Model model,ReserveVO reserve,String siteArr) {
		int result = service.insertReserve(reserve,siteArr);
		if((result) > 0) {
			model.addAttribute("msg", "예약 되었습니다.");			
		}else {
			model.addAttribute("msg", "예약이 실패했습니다.");
		}
		model.addAttribute("loc", "/reserveWriteFrm.do?campNo="+reserve.getCampNo()+"&date="+reserve.getCheckInDate());
		return "common/msg";
	}
	
	@RequestMapping("/searchOneReserve.do")
	public String searchReserve(Model model,ReserveVO reserve,String date) {
		ReserveVO r = service.selectOneReserve(reserve);
		if(r ==null) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("loc", "/reserveWriteFrm.do?campNo="+reserve.getCampNo()+"&date="+date);
		}else {
			model.addAttribute("msg", "정상확인 되었습니다.");
			model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo="+r.getReserveNo());
		}
		return "common/msg";
	}
	@RequestMapping("/reserveUpdateFrm.do")
	public String searchReserve(Model model,ReserveVO reserve) {
		ReserveVO r = service.selectOneReserve(reserve);
		SiteVO s = service.selectOneSiteReserve(r);
		MemberVO m = service.selectOneMember(r);
		model.addAttribute("reserve", r);
		model.addAttribute("site", s);
		model.addAttribute("member", m);
		return "reserve/reserveUpdateFrm";
	}
	@RequestMapping("/updateReserve.do")
	public String updateReserve(Model model,ReserveVO reserve) {
		int result = service.updateReserve(reserve);
		if(result>0) {
			model.addAttribute("msg", "정보가 최신화 되었습니다.");
		}else {
			model.addAttribute("msg", "서버오류로인해 수정되지않았습니다 관리자에게 문의해주세요.");
		}
		model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo="+reserve.getReserveNo());
		return "common/msg";
	}
	@RequestMapping("/reserveDelete.do")
	public String reserveDelete(Model model,ReserveVO reserve) {
		int result = service.reserveDelete(reserve);
		if((result) > 0) {
			model.addAttribute("msg", "예약 취소되었습니다.");	
			model.addAttribute("loc", "/reserveWriteFrm.do?campNo="+reserve.getCampNo()+"&date="+reserve.getCheckInDate());
		}else {
			model.addAttribute("msg", "서버오류로인해 취소되지않았습니다 관리자에게 문의해주세요.");
			model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo="+reserve.getReserveNo());
		}
		
		return "common/msg";
	}
}
