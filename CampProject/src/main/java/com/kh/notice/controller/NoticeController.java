package com.kh.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.notice.model.vo.Notice;
import com.kh.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		ArrayList<Notice> list = service.selectAllNotice();
		model.addAttribute("list",list);
		return "notice/noticeList";
	}
	
	@RequestMapping("/shownotice.do")
	public String selectOnenotice(Notice n, Model model) {
		Notice notice = service.selectOneNotice(n.getNoticeNo());
		System.out.println(notice.getNoticeNo());
		model.addAttribute("n", notice);
		return "notice/shownotice";
	}
}
