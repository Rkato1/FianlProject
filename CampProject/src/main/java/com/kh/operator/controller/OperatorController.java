package com.kh.operator.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.operator.model.service.OperatorService;
import com.kh.operator.model.vo.CampNoticePageData;
import com.kh.operator.model.vo.CampNoticeVO;

@Controller
public class OperatorController {
@Autowired
private OperatorService service;
private boolean isOperator = false;
	
	public boolean isOperator(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("m");
		if(member!=null&&member.getMemberGrade()==2) {
			return true;
		}else {
			return false;
		}
	}

	
	@RequestMapping("/operatorpage.do")
	public String operatorPage(HttpSession session,Model model) { //세션을 가져와 멤버등급이 2가아닌경우 메인페이지로 돌려보냄.
		MemberVO member = (MemberVO) session.getAttribute("m");
		if(member!=null) {
			if(member.getMemberGrade()==2) {
				CampVO c = new CampVO();
				c.setMemberNo(member.getMemberGrade());
				ArrayList<CampVO> camplist = service.selectCampList(c); //camp 리스트 가져옴.
				model.addAttribute("campList",camplist);
				return "operator/operatorpage";
			}else {
				model.addAttribute("msg", "캠핑장 사업자가 아닙니다.");
				model.addAttribute("loc", "/");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주시기 바랍니다.");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/msg";
		}
	}
	@RequestMapping("/opCampView.do")
	public String selectOneCamp(CampVO c,HttpSession session,Model model) {
		isOperator = isOperator(session);
		if(isOperator) {
			CampVO camp = service.selectOneCamp(c);
			model.addAttribute("camp",camp);
			return "operator/opCampView";
		}else {
			model.addAttribute("msg", "캠핑장 사업자가 아닙니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	@RequestMapping("/opNoticeList.do")
	public String selectCampNoticeList(CampVO c,Model model,HttpSession session,int reqPage) {
		isOperator = isOperator(session);
		if(isOperator) {
			CampVO camp = service.selectOneCamp(c);
			if(camp!=null) {
				CampNoticePageData cnpd = service.selectCampNoticeList(c,reqPage);
				model.addAttribute("camp",camp);
				model.addAttribute("cnList", cnpd.getList());
				model.addAttribute("pageNavi", cnpd.getPageNavi());
			}
			return "operator/opCampNoticeList";
		}else {
			model.addAttribute("msg", "캠핑장 사업자가 아닙니다.");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	@RequestMapping("/campNoticeView.do")
	public String campNoticeView(CampNoticeVO cn,Model model) {
		CampNoticeVO cNotice = service.selectCampNotice(cn);
		model.addAttribute("cNotice",cNotice);
		return "operator/opCampNoticeView";
	}
	@RequestMapping("/campNoticeForm.do")
	public String opNoticeForm(Model model,int campNo) {
		model.addAttribute("campNo",campNo);
		return "operator/campNoticeForm";
	}
	@RequestMapping("/campNoticeUpdateForm.do")
	private String campNoticeUpdateForm(CampNoticeVO cn,Model model) {
		CampNoticeVO cNotice = service.selectCampNotice(cn);
		model.addAttribute("cNotice",cNotice);
		return "operator/campNoticeUpdateForm";
	}
	@RequestMapping("/insertCampNotice.do")
	private String insertCampNotice(HttpSession session,CampNoticeVO cn,Model model) {
		int result = service.insertCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "등록되었습니다.");
		}else {
			model.addAttribute("msg", "등록되었습니다.");
		}
		model.addAttribute("loc", "/opNoticeList.do?campNo="+cn.getCampNo()+"&reqPage=1");
		return "common/msg";
	}
	@RequestMapping("/updateCampNotice.do")
	public String opNoticeUpdate(CampNoticeVO cn,Model model,HttpSession session) {
		int result = service.updateCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "업데이트 성공");
		}else {
			model.addAttribute("msg", "업데이트 실패");
		}
		model.addAttribute("loc", "/campNoticeView.do?campNoticeNo="+cn.getCampNoticeNo()+"&campNo="+cn.getCampNo());
		return "common/msg";
	}
	
	@RequestMapping("/deleteCampNotice.do")
	private String deleteCampNotice(HttpSession session,CampNoticeVO cn,Model model) {
		int result = service.deleteCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "삭제 성공");
		}else {
			model.addAttribute("msg", "삭제 실패");
		}
		model.addAttribute("loc", "/opNoticeList.do?campNo="+cn.getCampNo()+"&reqPage=1");
		return "common/msg";
	}
	
}
