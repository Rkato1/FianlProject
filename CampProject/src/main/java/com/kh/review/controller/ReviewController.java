package com.kh.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.ReviewPageData;
import com.kh.review.model.vo.ReviewVO;
import com.kh.review.model.vo.ReviewViewData;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping("/reviewList.do")
	public String reviewList(int reqPage, Model model) {
		ReviewPageData rpd = service.reviewList(reqPage);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		return "review/reviewList";
	}
	
	@RequestMapping("/reviewView.do")
	public String reviewView(int reviewNo, int campNo, Model model) {
		ReviewViewData rvd = service.reviewView(reviewNo);
		//ReviewVO review = service.selectOneReview(reviewNo);
		CampVO camp = service.selectOneCamp(campNo);
		model.addAttribute("rev", rvd.getR());
		model.addAttribute("comCnt", rvd.getCnt());
		model.addAttribute("comList", rvd.getList());
		model.addAttribute("camp", camp);
		return "review/reviewView";
	}
	
	@RequestMapping("/reviewWriteFrm.do")
	public String reviewWriteFrm() {
		return "review/reviewWriteFrm";
	}
	
	@RequestMapping("/searchReserve.do.")
	public String searchReserve() {
		return "review/searchReserve";
	}
	
	@RequestMapping("/reviewUpdateFrm.do")
	public String reviewUpdateFrm() {
		return "review/reviewUpdateFrm";
	}
	

}
