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
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewPageData;
import com.kh.review.model.vo.ReviewViewData;

@Controller
public class OperatorController {
@Autowired
private OperatorService service;
@Autowired
private ReviewService rService;
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
	
	@RequestMapping("/opReviewList.do")
	private String ReviewList(int campNo,int reqPage,Model model) {
		CampVO c = new CampVO();
		c.setCampNo(campNo);
		CampVO camp = service.selectOneCamp(c);
		model.addAttribute("camp", camp);
		ReviewPageData rpd = service.reviewList(reqPage,campNo);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		return "operator/opReviewList";
	}
	@RequestMapping("/opReviewView.do")
	public String reviewView(int reviewNo, int campNo, Model model) {
		System.out.println("campNo : "+campNo);
		System.out.println("reviewNo : "+reviewNo);
		CampVO c = new CampVO();
		c.setCampNo(campNo);
		CampVO camp = service.selectOneCamp(c);
		ReviewViewData rvd = rService.reviewView(reviewNo);
		model.addAttribute("camp", camp);
		model.addAttribute("rev", rvd.getR());
		model.addAttribute("comCnt", rvd.getCnt());
		model.addAttribute("comList", rvd.getList());
		return "operator/opReviewView";
	}
	@RequestMapping("/insertReviewCommentOP.do")
	public String insertReviewComment(ReviewCommentVO rc, Model model) {
		int reviewNo = rc.getReviewNo();
		int campNo = rService.searchCampNo(reviewNo);
		
		int result = rService.insertReviewComment(rc);
		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록 되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/opReviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
	
	//캠핑 후기 - 댓글 수정하기
	@RequestMapping("/updateReviewCommentOP.do")
	public String updateReviewComment(ReviewCommentVO rc, Model model) {
		int reviewNo = rc.getReviewNo();
		int campNo = rService.searchCampNo(reviewNo);
		int result = rService.updateReviewComment(rc); 
		if(result>0) {
			model.addAttribute("msg", "댓글이 수정되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/opReviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
	
	//캠핑 후기 - 댓글 삭제하기
	@RequestMapping("/deleteReviewCommentOP.do")
	public String deleteReviewComment(int reviewCommentNo, int reviewNo, Model model) {
		int campNo = rService.searchCampNo(reviewNo);
		int result = rService.deleteReviewComment(reviewCommentNo);
		if (result > 0) {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/opReviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";
	}
}
