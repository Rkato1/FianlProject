package com.kh.camp.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@RequestMapping("/reviewList.do")
	public String reviewList() {
		return "review/reviewList";
	}
	
	@RequestMapping("/reviewWriteFrm.do")
	public String reviewWriteFrm() {
		return "review/reviewWriteFrm";
	}

}
