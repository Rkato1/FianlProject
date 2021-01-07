package com.kh.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveVO;
import com.kh.review.model.vo.ReviewVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	//임시 페이지 이동
	@RequestMapping("/blank.do")
	public String blank() {
		return "member/blank";
	}
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}

	@RequestMapping("/login.do")
	public String login(MemberVO m, HttpSession session, Model model) {
		MemberVO member = service.selectOneMember(m);
		if (member != null) {
			session.setAttribute("m", member);
			model.addAttribute("msg", "<로그인>되었습니다.");
			model.addAttribute("loc", "/blank.do");
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("loc", "/loginFrm.do");
		}
		return "common/msg";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model, @SessionAttribute(required = false) MemberVO m) {
		if (m != null) {
			session.invalidate();
			model.addAttribute("msg", "<로그아웃>되었습니다");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/");

		return "common/msg";
	}

	@RequestMapping("/searchIdFrm.do")
	public String searchIdFrm() {
		return "member/searchIdFrm";
	}

	@RequestMapping("/searchId.do")
	public String searchId(MemberVO m, Model model) {
		MemberVO member = service.selectOneMemberId(m);
		model.addAttribute("m", member);
		return "member/searchId";
	}

	@RequestMapping("/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPwFrm";
	}

	@RequestMapping("/searchPw.do")
	public String searchPw(MemberVO m, Model model) {
		MemberVO member = service.selectOneMemberPw(m);
		model.addAttribute("m", member);
		return "member/searchPw";
	}

	@ResponseBody
	@RequestMapping("/idCheck.do")
	public String checkId(MemberVO m) {
		MemberVO member = service.selectOneMember(m);
		if (member != null) { // 사용불가능 -> 1을 리턴
			return "1";
		} else { // 사용가능할 때 -> 0을 리턴
			return "0";
		}
	}

	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}

	@RequestMapping("/join.do")
	public String join(MemberVO m, Model model) {
		int result = service.insertMember(m);
		if (result > 0) {
			model.addAttribute("msg", "회원가입 되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/blank.do");

		return "common/msg";
	}

	@RequestMapping("/mypage.do")
	public String mypage(int memberNo, String memberId, Model model) {
		MemberVO member = service.mypageMember(memberNo);
		//갯수 조회
		int cntReserve = service.cntReserve(memberNo);
		int cntReview = service.cntReview(memberId);
		int cntUsedTrade = service.cntUsedTrade(memberId);
		//데이터 조회
		//ReserveVO reserve = service.mypageReserve(memberNo);
		//ReviewVO review = service.mypageReview(memberId);
		//UsedVO usedTrade = service.mypageUsedTrade(memberId);
		
		model.addAttribute("m", member);
		model.addAttribute("cntReserve", cntReserve);
		model.addAttribute("cntReview", cntReview);
		model.addAttribute("cntUsedTrade", cntUsedTrade);
		return "member/mypage";
	}

	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO m, Model model) {
		int result = service.updateMember(m); 
		if(result>0) {
		model.addAttribute("msg", "회원정보를 수정했습니다."); 
		} else {
		model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/blank.do");
		 
		return "common/msg";
	}

	@RequestMapping("/deleteMember.do")
	public String deleteMember(int memberNo, HttpSession session, Model model) {
		int result = service.deleteMember(memberNo);
		if (result > 0) {
			session.invalidate();
			model.addAttribute("msg", "탈퇴되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/blank.do");

		return "common/msg";
	}

}
