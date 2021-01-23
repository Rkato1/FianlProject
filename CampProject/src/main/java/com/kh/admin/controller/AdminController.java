package com.kh.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.admin.model.vo.CampVOPageData;
import com.kh.admin.model.vo.ChartBasicData;
import com.kh.admin.model.vo.MemberVOPageData;
import com.kh.admin.model.vo.ReserveVOPageData;
import com.kh.admin.service.AdminService;
import com.kh.member.model.vo.MemberVO;
import com.kh.review.model.vo.ReviewPageData;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	boolean isAdmin = false;
	
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
	
	@RequestMapping("/mainAdmin.do")
	public String mainAdmin(HttpSession session, Model model) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			return "admin/mainAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/memberAdmin.do")
	public String memberAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			MemberVOPageData mpd = service.selectAllMember(reqPage);
			model.addAttribute("list",mpd.getList());
			model.addAttribute("numList",mpd.getOriNum());
			model.addAttribute("pageNavi",mpd.getPageNavi());
			return "admin/memberAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/businessAdmin.do")
	public String businessAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			CampVOPageData cpd = service.selectAllBusiness(reqPage);
			model.addAttribute("list",cpd.getList());
			model.addAttribute("numList",cpd.getOriNum());
			model.addAttribute("pageNavi",cpd.getPageNavi());
			return "admin/businessAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/reserveAdmin.do")
	public String reserveAdmin(Model model, HttpSession session, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			ReserveVOPageData rpd = service.selectAllReserve(reqPage);
			model.addAttribute("list",rpd.getList());
			model.addAttribute("numList",rpd.getOriNum());
			model.addAttribute("pageNavi",rpd.getPageNavi());
			return "admin/reserveAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/salesAdmin.do")
	public String salesAdmin(Model model, HttpSession session, int campNo, int year) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			ArrayList<Integer> numList = service.getNumList();
			ArrayList<String> nameList = service.nameList(numList);
			ArrayList<ChartBasicData> dataList = new ArrayList<ChartBasicData>();
			for(int i=0; i<numList.size(); i++) {
				dataList.add(new ChartBasicData(numList.get(i), nameList.get(i)));
			}
			String campName="";
			if(campNo==0 && dataList.size()!=0) {
				campNo = dataList.get(0).getCampNo();
				campName = dataList.get(0).getCampName();
			}else {
				for(ChartBasicData cbd : dataList) {
					if(cbd.getCampNo()==campNo) {
						campName = cbd.getCampName();
					}
				}
			}
			if(year==0) {
				//원래는 달력기준 올해로 설정해야함
				year = 2021;
			}
			
			List<List<Map<Object, Object>>> list = service.getCanvasjsChartData(campNo, year);
			model.addAttribute("dataPointsList", list);
			model.addAttribute("list", dataList);			
			model.addAttribute("campName", campName);
			model.addAttribute("year", year);
			return "admin/salesAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/greatcampAdmin.do")
	public String greatcampAdmin(Model model, HttpSession session, String option) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			List<List<Map<Object, Object>>> list = null;
			if(option.equals("sales")) {
				list = service.getCanvasjsStickChartData2();
			}else {
				list = service.getCanvasjsStickChartData();
			}
			model.addAttribute("dataPointsList", list);
			model.addAttribute("option", option);
			return "admin/greatcampAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/helpAdmin.do")
	public String helpAdmin(Model model, HttpSession session, String option, int reqPage) {
		isAdmin = isAdmin(session);
		if(isAdmin) {
			//System.out.println("옵션으로 넘긴값"+option);
			ReviewPageData rpd = null;
			//현재 리스트크기 null값에 대한 대처를 안해뒀음 그거 처리해야함
			if(option.equals("answer")) {
				rpd = service.adminAnswerList(reqPage);
				model.addAttribute("list", rpd.getList());
				model.addAttribute("pageNavi", rpd.getPageNavi());
				model.addAttribute("title", "답변한 글들");
			}else {
				rpd = service.adminNotAnswerList(reqPage);
				model.addAttribute("list", rpd.getList());
				model.addAttribute("pageNavi", rpd.getPageNavi());
				model.addAttribute("title", "답변하지 않은 글들");
			}
			model.addAttribute("option", option);
			//System.out.println("옵션으로 설정한 값"+option);
			return "admin/helpAdmin";
		}else {
			model.addAttribute("msg", "관리자가 아닙니다.");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
		
//	@ResponseBody
//	@RequestMapping(value ="/memberUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
//	public String memberUpdateAdmin(HttpSession session,int memberNo) {		
//		MemberVO m = service.selectOneMember(memberNo);
//		JsonObject obj = new JsonObject();
//		System.out.println(m.getMemberPhone());
//		System.out.println(m.getMemberPw());
//		obj.addProperty("msg", "성공");
//		//return m;
//		return new Gson().toJson(obj);
//	}
	
	@RequestMapping("/realUpdate.do")
	public String memberUpdateAdmin(HttpSession session, MemberVO m, Model model) {
		System.out.println(m.getMemberNo());
		int result = service.updateMember(m);
		if(result>0) {
			model.addAttribute("msg", "수정되었습니다.");
		}else {
			model.addAttribute("msg", "수정실패");
		}
		model.addAttribute("loc","/admin/memberAdmin.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/realDelete.do")
	public String memberDeleteAdmin(HttpSession session, int memberNo, Model model) {
		System.out.println(memberNo);
		int result = service.deleteMember(memberNo);
		if(result>0) {
			model.addAttribute("msg", "삭제되었습니다.");
		}else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc","/admin/memberAdmin.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/realCampDelete.do")
	public String campDeleteAdmin(HttpSession session, int campNo, Model model) {
		System.out.println(campNo);
		int result = service.deleteCamp(campNo);
		if(result>0) {
			model.addAttribute("msg", "삭제되었습니다.");
		}else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc","/admin/businessAdmin.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/realReserveDelete.do")
	public String reserveDeleteAdmin(HttpSession session, int reserveNo, Model model) {
		System.out.println(reserveNo);
		int result = service.deleteReserve(reserveNo);
		if(result>0) {
			model.addAttribute("msg", "삭제되었습니다.");
		}else {
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc","/admin/reserveAdmin.do?reqPage=1");
		return "common/msg";
	}
}
