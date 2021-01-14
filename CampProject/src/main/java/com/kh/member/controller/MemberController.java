package com.kh.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.vo.ReviewCampVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}

	@RequestMapping("/login.do")
	public String login(MemberVO m, HttpSession session, Model model) {
		MemberVO member = service.selectOneMember(m);
		if (member != null) {
			session.setAttribute("m", member);
			if(m.getMemberId().equals("admin")) {
				model.addAttribute("msg", "관리자 로그인되었습니다.");
				model.addAttribute("loc", "/admin/mainAdmin.do");
			}else {
				model.addAttribute("msg", "[로그인]되었습니다.");
				model.addAttribute("loc", "/campList.do?reqPage=1");
			}
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
			model.addAttribute("msg", "[로그아웃]되었습니다");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/loginFrm.do");

		return "common/msg";
	}

	@RequestMapping("/searchIdFrm.do")
	public String searchIdFrm() {
		return "member/searchIdFrm";
	}

	@RequestMapping("/searchId.do")
	public String searchId(MemberVO m, Model model) {
		MemberVO member = service.selectOneMemberId(m);
		//아이디 찾기에서 조회되지 않을 때
		if(member != null) {
			model.addAttribute("m", member);
			return "member/searchId";
		} else {
			model.addAttribute("msg", "입력하신 정보를 다시 한 번 확인해주세요.");
			model.addAttribute("loc", "/searchIdFrm.do");
			return "common/msg";
		}
	}

	@RequestMapping("/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPwFrm";
	}

	@RequestMapping("/searchPw.do")
	public String searchPw(MemberVO m, Model model) {
		MemberVO member = service.selectOneMemberPw(m);
		//비밀번호 찾기에서 조회되지 않을 때
		if(member != null) {
			model.addAttribute("m", member);
			return "member/searchPw";
		} else {
			model.addAttribute("msg", "입력하신 정보를 다시 한 번 확인해주세요.");
			model.addAttribute("loc", "/searchPwFrm.do");
			return "common/msg";
		}
	}

	@ResponseBody
	@RequestMapping("/idCheck.do")
	public String checkId(MemberVO m) {
		MemberVO member = service.selectOneMember(m);
		if (member != null) { // 아이디 사용불가능(중복) -> 1을 리턴
			return "1";
		} else { // 아이디 사용가능 -> 0을 리턴
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
			model.addAttribute("loc", "/loginFrm.do");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
			model.addAttribute("loc", "/joinFrm.do");
		}
		return "common/msg";
	}

	@RequestMapping("/mypage.do")
	public String mypage(int memberNo, String memberId, Model model) {
		MemberVO member = service.mypageMember(memberNo);
		//갯수 조회
		int cntRes = service.cntReserve(memberNo);
		int cntRev = service.cntReview(memberId);
		int cntUsed = service.cntUsedTrade(memberId);
		//데이터 조회
		ArrayList<ReserveCampVO> listRes = service.mypageReserve(memberNo);
		ArrayList<ReviewCampVO> listRev = service.mypageReview(memberId);
		//ArrayList<UsedVO> listUsed = service.mypageUsedTrade(memberId);
		
		model.addAttribute("m", member);
		//갯수 전달
		model.addAttribute("cntRes", cntRes);
		model.addAttribute("cntRev", cntRev);
		model.addAttribute("cntUsed", cntUsed);
		//데이터 전달
		model.addAttribute("listRes", listRes);
		model.addAttribute("listRev", listRev);
		//model.addAttribute("listUsed", listUsed);
		
		return "member/mypage";
	}
	
	@RequestMapping("/changePw.do")
	public String changePw(MemberVO m, Model model) {
		return "member/changePw";
	}
	
	@ResponseBody
	@RequestMapping("/pwCheck.do")
	public String pwCheck(MemberVO m) {
		MemberVO member = service.selectOneMember(m);
		if (member != null) { // 비밀번호 일치하지 않음 -> 1을 리턴
			return "1";
		} else { // 비밀번호 일치함 -> 0을 리턴
			return "0";
		}
	}

	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO m, Model model) {
		int result = service.updateMember(m); 
		if(result>0) {
			model.addAttribute("msg", "회원정보를 수정했습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/campList.do?reqPage=1");
		return "common/msg";
	}

	@RequestMapping("/deleteMember.do")
	public String deleteMember(int memberNo, HttpSession session, Model model) {
		int result = service.deleteMember(memberNo);
		if (result > 0) {
			session.invalidate();
			model.addAttribute("msg", "탈퇴되었습니다.");
			model.addAttribute("loc", "/");
		} else {
			session.invalidate();
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
			model.addAttribute("loc", "/loginFrm.do");
		}

		return "common/msg";
	}

}
