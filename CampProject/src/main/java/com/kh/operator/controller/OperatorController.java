package com.kh.operator.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.camp.model.vo.CampVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.operator.model.service.OperatorService;
import com.kh.operator.model.vo.CampNoticeVO;

@Controller
public class OperatorController {
@Autowired
private OperatorService service;

	@RequestMapping("/operatorpage.do")
	public String operatorPage(HttpSession session,Model model) { //세션을 가져와 멤버등급이 2가아닌경우 메인페이지로 돌려보냄.
		MemberVO member = (MemberVO) session.getAttribute("m");
		if(member!=null) {
			if(member.getMemberGrade()==2) {
				ArrayList<CampVO> camplist = service.selectCampList(member.getMemberGrade()); //camp 리스트 가져옴.
				model.addAttribute("campList",camplist);
				model.addAttribute("pictureList",camplist);
				return "operator/operatorpage";
			}else {
				model.addAttribute("msg", "사업자가 아닙니다.");
				model.addAttribute("loc", "/");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주시기 바랍니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	@RequestMapping("/selectAllCampNotice.do")
	private String selectAllCampNotice(int campNo,HttpSession session,Model model) {
		MemberVO member = (MemberVO) session.getAttribute("m");
		if(member!=null) {
			ArrayList<CampVO> list = service.selectAllCampNotice(campNo);
			model.addAttribute("campList",list);
		}
		else {
			model.addAttribute("msg", "로그인 후 이용해 주시기 바랍니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/insertCampNotice.do")
	private String insertCampNotice(CampNoticeVO cn,Model model) {
		int result = service.insertCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
	}
	
	@RequestMapping("/deleteCampNotice.do")
	private String deleteCampNotice(CampNoticeVO cn,Model model) {
		
		return null;
	}
}
