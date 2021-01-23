package com.kh.reserve.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.common.DateList;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.service.ReserveService;
import com.kh.reserve.model.vo.ReserveListsVO;
import com.kh.reserve.model.vo.ReserveVO;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	@Autowired
	private DateList datelist;
	
	@RequestMapping("/reserveWriteFrm.do")
	public String reserveWriteFrm(HttpSession session, @SessionAttribute(required = false) MemberVO m, Model model,
			CampVO camp, String date) {
		if (m == null) {
			// 로그인이 안된상태에서 버튼을 누른경우
			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/msg";
		} else {
			ReserveListsVO rlv = service.selectAllLists(camp, date);
			CampVO c = service.selectOneCamp(camp);
			ArrayList<String> dateList = datelist.GetDates();
			//date = 2021-01-01
			int search = -1;
			for(String dates : dateList) {
				if(dates.equals(date)) {
					search =1;
					break;
				}
			}
			//search = 1;// 막은거 막기 //막은거 막기에 다시 막기
			if(search == -1) {
				model.addAttribute("msg", "이용할 수 없는 페이지를 호출하였습니다.");
				model.addAttribute("loc", "/");
				return "common/msg";
			}else {
				model.addAttribute("sitePriceList", rlv.getSitePriceList());//가격표리스트
				model.addAttribute("siteList", rlv.getSiteList()); //출력되는 사이트 리스트
				model.addAttribute("memberList", rlv.getMemberList()); //출력되는 맴버이름 리스트
				model.addAttribute("reserveList", rlv.getReserveList()); //출력되는 예약리스트 (맴버이름+예약번호버튼)
				model.addAttribute("dateList", dateList); //날짜리스트
				model.addAttribute("camp", c); //camp정보
				model.addAttribute("date", date); //선택한 날짜 정보
				return "reserve/reserveWriteFrm";				
			}			
		}

	}

	@RequestMapping("/insertReserve.do")
	public String insertReserve(Model model, ReserveVO reserve, String siteArr, int reserveTotal, String date,
			CampVO camp) {
		/*
		 * System.out.println("/insertReserve.do 호출");
		 * System.out.println("reserve = "+reserve);
		 * System.out.println("siteArr = "+siteArr);
		 * System.out.println("reserveTotal = "+reserveTotal);
		 * System.out.println("date = "+date); System.out.println("camp = "+camp);
		 */
		int result = 1;
		result = service.insertReserve(reserve, siteArr);
		/*
		 * if (result > 0) { model.addAttribute("msg", "예약 되었습니다."); } else {
		 * model.addAttribute("msg", "예약이 실패했습니다."); } model.addAttribute("loc",
		 * "/reserveWriteFrm.do?campNo=" + reserve.getCampNo() + "&date=" +
		 * reserve.getCheckInDate()); return "common/msg";
		 */
		if (result > 0) {
			// 예약됨 결제페이지로 넘어감
			ArrayList<ReserveVO> reserveList = service.selectReserveList(reserve);
			CampVO c = service.selectOneCamp(camp);
			//System.out.println("reserveList.size = " + reserveList.size());
			model.addAttribute("camp", c);
			model.addAttribute("reserveList", reserveList);
			model.addAttribute("date", date); // 결제페이지 나가면
			model.addAttribute("total", reserveTotal);
			return "reserve/reserveFlex";
		} else {
			model.addAttribute("msg", "예약이 실패했습니다.");
			model.addAttribute("loc",
					"/reserveWriteFrm.do?campNo=" + reserve.getCampNo() + "&date=" + reserve.getCheckInDate());
			return "common/msg";

		}

	}

	@RequestMapping("/searchOneReserve.do")
	public String searchReserve(Model model, ReserveVO reserve, String date) {
		ReserveVO r = service.selectOneReserve(reserve);
		if (r == null) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("loc", "/reserveWriteFrm.do?campNo=" + reserve.getCampNo() + "&date=" + date);
		} else {
			model.addAttribute("msg", "정상확인 되었습니다.");
			model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo=" + r.getReserveNo());
		}
		return "common/msg";
	}

	@RequestMapping("/reserveUpdateFrm.do")
	public String searchReserve(Model model, ReserveVO reserve) {
		ReserveVO r = service.selectOneReserve(reserve);
		SiteVO s = service.selectOneSiteReserve(r);
		MemberVO m = service.selectOneMember(r);
		model.addAttribute("reserve", r);
		model.addAttribute("site", s);
		model.addAttribute("member", m);
		return "reserve/reserveUpdateFrm";
	}

	@RequestMapping("/updateReserve.do")
	public String updateReserve(Model model, ReserveVO reserve) {
		int result = service.updateReserve(reserve);
		if (result > 0) {
			model.addAttribute("msg", "정보가 최신화 되었습니다.");
		} else {
			model.addAttribute("msg", "서버오류로인해 수정되지않았습니다 관리자에게 문의해주세요.");
		}
		model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo=" + reserve.getReserveNo());
		return "common/msg";
	}

	@RequestMapping("/reserveDelete.do")
	public String reserveDelete(Model model, ReserveVO reserve) {
		int result = service.reserveDelete(reserve);
		if ((result) > 0) {
			model.addAttribute("msg", "예약 취소되었습니다.");
			model.addAttribute("loc",
					"/reserveWriteFrm.do?campNo=" + reserve.getCampNo() + "&date=" + reserve.getCheckInDate());
		} else {
			model.addAttribute("msg", "서버오류로인해 취소되지않았습니다 관리자에게 문의해주세요.");
			model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo=" + reserve.getReserveNo());
		}
		return "common/msg";
	}

	@RequestMapping("/flexOneRserve.do")
	public String flexOneRserve(Model model, ReserveVO reserve) {
		int result = service.flexOneRserve(reserve);
		if (result > 0) {
			model.addAttribute("msg", "결제완료 되었습니다");
		} else {
			model.addAttribute("msg", "서버 오류로 결제완료 설정 안되었습니다. 관리자에게 문의해주세요.");
		}
		model.addAttribute("loc", "/reserveUpdateFrm.do?reserveNo=" + reserve.getReserveNo());
		return "common/msg";
	}

	@RequestMapping("/flex.do")
	public String flex() {
		return "reserve/flex";
	}

	@RequestMapping("/flexAllRserve.do")
	public String flexAllRserve(Model model, String numbers, String date, int campNo) {
		numbers = numbers.replaceAll("'", "");
		// date = date.replaceAll("'", "");
		System.out.println("controller.numbers = " + numbers);
		System.out.println("controller.date = " + date);
		int result = service.flexAllReserve(numbers);
		if (result > 0) {
			model.addAttribute("msg", "예약(들)이 결제완료 처리 되었습니다.");
		} else {
			model.addAttribute("msg", "서버오류로인해 결제수정되지않았습니다 관리자에게 문의해주세요.");
		}
		model.addAttribute("loc", "/reserveWriteFrm.do?campNo=" + campNo + "&date=" + date);
		return "common/msg";
	}
}
