package com.kh.review.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.camp.model.vo.CampVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewPageData;
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
		CampVO camp = service.selectOneCamp(campNo);
		ReviewViewData rvd = service.reviewView(reviewNo);
		model.addAttribute("camp", camp);
		model.addAttribute("rev", rvd.getR());
		model.addAttribute("comCnt", rvd.getCnt());
		model.addAttribute("comList", rvd.getList());
		return "review/reviewView";
	}
	
	@RequestMapping("/reviewWriteFrm.do")
	public String reviewWriteFrm() {
		return "review/reviewWriteFrm";
	}
	
	@RequestMapping("/searchReserve.do")
	public String searchReserve(int memberNo, Model model) {
		ArrayList<ReserveCampVO> listRes = service.selectListReserve(memberNo);
		model.addAttribute("listRes", listRes);
		return "review/searchReserve";
	}
	
	@RequestMapping("/reviewUpdateFrm.do")
	public String reviewUpdateFrm() {
		return "review/reviewUpdateFrm";
	}

	@RequestMapping("/insertReviewComment.do")
	public String insertReviewComment(ReviewCommentVO rc, Model model) {
		int reviewNo = rc.getReviewNo();
		int campNo = service.searchCampNo(reviewNo);
		
		int result = service.insertReviewComment(rc);
		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록 되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/reviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
	
	@RequestMapping("/updateReviewComment.do")
	public String updateReviewComment(ReviewCommentVO rc, Model model) {
		int reviewNo = rc.getReviewNo();
		int campNo = service.searchCampNo(reviewNo);
		
		int result = service.updateReviewComment(rc); 
		if(result>0) {
			model.addAttribute("msg", "댓글이 수정되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/reviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
	
	@RequestMapping("/deleteReviewComment.do")
	public String deleteReviewComment(int reviewCommentNo, int reviewNo, Model model) {
		int campNo = service.searchCampNo(reviewNo);
		
		int result = service.deleteReviewComment(reviewCommentNo);
		if (result > 0) {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/reviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
	
}
