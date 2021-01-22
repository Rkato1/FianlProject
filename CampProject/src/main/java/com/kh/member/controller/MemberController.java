package com.kh.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.camp.used.vo.UsedMessageChatVO;
import com.kh.camp.used.vo.UsedMessageVO;
import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.vo.ReviewCampVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	//메인에서 로그인 (페이지 이동)
	@RequestMapping("/loginFrm.do")
	public String loginFrm(HttpSession session, @SessionAttribute(required = false) MemberVO m, Model model) {
		if (m != null) { //로그인 되어있는 상태일 때
			model.addAttribute("msg", "오늘도 'Create A Camp'를 찾아주셔서 감사합니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
			return "common/msg";
		} else { //로그인 되어있지 않은 상태일 때
			return "member/loginFrm";
		}
	}

	//로그인
	@RequestMapping("/login.do")
	public String login(MemberVO m, HttpSession session, Model model) {		
		MemberVO member = service.selectOneMember(m);
		if (member != null) {
			session.setAttribute("m", member);
			//방을 가져오는 곳 	
			if(m.getMemberId().equals("admin")) {
				model.addAttribute("msg", "관리자 로그인되었습니다.");
				model.addAttribute("loc", "/admin/mainAdmin.do");
			}else {
				model.addAttribute("msg", "오늘도 'Create A Camp'를 찾아주셔서 감사합니다.");
				model.addAttribute("loc", "/campList.do?reqPage=1");
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("loc", "/loginFrm.do");
		}
		return "common/msg";
	}

	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model, @SessionAttribute(required = false) MemberVO m) {
		if (m != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃 되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/loginFrm.do");

		return "common/msg";
	}

	//아이디 찾기 (페이지 이동)
	@RequestMapping("/searchIdFrm.do")
	public String searchIdFrm() {
		return "member/searchIdFrm";
	}

	//아이디 찾기
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

	//비밀번호 찾기 (페이지 이동)
	@RequestMapping("/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPwFrm";
	}

	//비밀번호 찾기
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

	//회원가입 (페이지 이동)
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}

	//회원가입
	@RequestMapping("/join.do")
	public String join(MemberVO m, Model model) {
		int result = service.insertMember(m);
		if (result > 0) {
			model.addAttribute("msg", "'Create A Camp'에 오신 것을 환영합니다!");
			model.addAttribute("loc", "/loginFrm.do");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
			model.addAttribute("loc", "/joinFrm.do");
		}
		return "common/msg";
	}
	
	//회원가입 아이디 중복 체크
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
	
	//마이페이지
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
		ArrayList<UsedVO> listUsed = service.mypageUsedTrade(memberId);
		
		model.addAttribute("m", member);
		//갯수 전달
		model.addAttribute("cntRes", cntRes);
		model.addAttribute("cntRev", cntRev);
		model.addAttribute("cntUsed", cntUsed);
		//데이터 전달
		model.addAttribute("listRes", listRes);
		model.addAttribute("listRev", listRev);
		model.addAttribute("listUsed", listUsed);
		
		return "member/mypage";
	}
	
	//비밀번호 변경 (팝업창 이동)
	@RequestMapping("/changePw.do")
	public String changePw(int memberNo, Model model) {	
		model.addAttribute("memberNo", memberNo);	
		return "member/changePw";
	}
	
	//기존 비밀번호 확인
	@ResponseBody
	@RequestMapping("/pwCheck.do")
	public String pwCheck(int memberNo, String memberPw) {	
		//회원번호로 비밀번호 조회	
		String memberPw_check = service.selectChangePw(memberNo);
		if (memberPw.equals(memberPw_check)) { //비밀	번호 일치함 -> 0을 리턴	
			return "0";	
		} else { //비밀번호 일치하지않음 -> 1을 리턴	
			return "1";			
		}
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping("/updateMemberPw.do")
	public String updateMemberPw(int memberNo, String memberPw) {
		MemberVO m = new MemberVO();
		m.setMemberNo(memberNo);
		m.setMemberPw(memberPw);
		int result = service.updateMemberPw(m);
		if(result>0) { //새 비밀번호 변경 성공 -> 0을 리턴
			return "0";
		} else { //새 비밀번호 변경 실패 -> 1을 리턴
			return "1";
		} 
	}
	
	//회원정보 수정
	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO m, Model model) {
		int result = service.updateMember(m); 
		if(result>0) {
			model.addAttribute("msg", "회원정보가 수정되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/campList.do?reqPage=1");
		return "common/msg";
	}

	//회원탈퇴
	@RequestMapping("/deleteMember.do")
	public String deleteMember(int memberNo, HttpSession session, Model model) {
		int result = service.deleteMember(memberNo);
		if (result > 0) {
			session.invalidate();
			model.addAttribute("msg", "탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			model.addAttribute("loc", "/");
		} else {
			session.invalidate();
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
			model.addAttribute("loc", "/loginFrm.do");
		}
		return "common/msg";
	}

}
