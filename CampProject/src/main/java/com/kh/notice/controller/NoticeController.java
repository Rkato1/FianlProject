package com.kh.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.member.model.vo.MemberVO;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageData;
import com.kh.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
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
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, int reqPage) {
		NoticePageData npd = service.selectAllNotice(reqPage);
		model.addAttribute("notiList", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		return "notice/noticeList";
	}
	
	/*
	@RequestMapping("/shownotice.do")
	public String selectOnenotice(Notice n, Model model) {
		Notice notice = service.selectOneNotice(n.getNoticeNo());
		//System.out.println(notice.getNoticeNo());
		model.addAttribute("n", notice);
		return "notice/shownotice";
	}
	*/
	
	//noticeController부터작업재개하면됨
	//글쓸때,수정할때는 isadmin사용
}
