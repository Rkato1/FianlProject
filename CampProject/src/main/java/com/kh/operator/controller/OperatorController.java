package com.kh.operator.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.camp.model.vo.CampPictureVO;
import com.kh.camp.model.vo.CampVO;
import com.kh.camp.model.vo.SiteVO;
import com.kh.camp.used.vo.FileNameOver;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.MemberVO;
import com.kh.operator.model.service.OperatorService;
import com.kh.operator.model.vo.CampNoticePageData;
import com.kh.operator.model.vo.CampNoticeVO;
import com.kh.reserve.model.vo.ReserveVO;
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
@Autowired
private MemberService mService;

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
				model.addAttribute("loc", "/campList.do?reqPage=1");
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
			model.addAttribute("loc", "/campList.do?reqPage=1");
			return "common/msg";
		}
	}
	@RequestMapping("/deleteCamp.do")
	public String deleteCamp(int campNo,Model model,HttpServletRequest request) {
		ArrayList<CampPictureVO> cplist = service.selectCampPictureList(campNo,0);
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root +"resources/upload/camp/";
		for(CampPictureVO cp : cplist) {
			File delFile = new File(saveDirectory+cp.getFilepath());
			boolean delResult = delFile.delete();
			if(delResult) {
				System.out.println(cp.getFilepath()+": 삭제성공");
			}else {
				System.out.println(cp.getFilepath()+": 삭제실패");
			}
		}
		int result = service.deleteCamp(campNo);
		if(result>0) {
			model.addAttribute("msg", "캠핑목록에서 삭제되었습니다.");
		}else {
			model.addAttribute("msg", "캠핑장 삭제 실패");
		}
		model.addAttribute("loc", "/operatorpage.do");
		return "common/msg";
		
	}
	@RequestMapping("/campForm.do")
	public String CampForm() {
		return "operator/opCampForm";
	}
	
	@RequestMapping("/insertCamp.do")
	public String insertCamp(CampVO c,MultipartFile mainFile,MultipartFile[] files,Model model,HttpServletRequest request,HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		if(member!=null&&member.getMemberGrade()==2) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "/resources/upload/camp/";
			ArrayList<CampPictureVO> fileList = new ArrayList<CampPictureVO>();
			c.setMemberNo(member.getMemberNo());
			String mfilename = mainFile.getOriginalFilename();
			String mfilepath = new FileNameOver().rename(path, mfilename);
			try {
				byte[] mbytes = mainFile.getBytes();
				File upMFile = new File(path+mfilepath);
				FileOutputStream fos = new FileOutputStream(upMFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(mbytes);
				bos.close();
				CampPictureVO mf =new CampPictureVO();
				mf.setFilename(mfilename);
				mf.setFilepath(mfilepath);
				mf.setFileGrade(1);
				fileList.add(mf);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for(MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String filepath = new FileNameOver().rename(path, filename);
	
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path+filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					CampPictureVO f =new CampPictureVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					f.setFileGrade(2);
					fileList.add(f);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			c.setPictureList(fileList);
			int result = service.insertCamp(c);
			if(result>0) {
				model.addAttribute("msg","탬핑장이 등록 되었습니다.");
			}else {
				model.addAttribute("msg","등록실패");
			}
			model.addAttribute("loc","/operatorpage.do");
		}else {
			model.addAttribute("msg","사업자가 아닙니다.");
			model.addAttribute("loc","/");
		}
		return "common/msg";
	}
	
	
	@RequestMapping("/opCampUpdateForm.do")
	public String campUpdateForm(CampVO c,Model model) {
		CampVO camp = service.selectOneCamp(c);
		model.addAttribute("camp",camp);
		return "operator/opCampUpdateForm";
	}
	
	@RequestMapping("/updateCamp.do")
	public String updateCamp(CampVO c,MultipartFile mainFile,MultipartFile[] files,Model model,HttpServletRequest request,HttpSession session) {
		System.out.println("컨트롤러 메인: "+mainFile.isEmpty());
		System.out.println("컨트롤러 소개 : "+files.length);
		MemberVO member = (MemberVO)session.getAttribute("m");
		CampVO camp = service.selectOneCamp(c);
		if(member!=null&&member.getMemberGrade()==2&&camp.getMemberNo()==member.getMemberNo()) {
			c.setMemberNo(member.getMemberNo());
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "/resources/upload/camp/";
			
			ArrayList<CampPictureVO> cplist = service.selectCampPictureList(c.getCampNo(),1);
			for(CampPictureVO cp : cplist) {
				File delFile = new File(path+cp.getFilepath());
				boolean delResult = delFile.delete();
				if(delResult) {
					System.out.println(cp.getFilepath()+": 삭제성공");
				}else {
					System.out.println(cp.getFilepath()+": 삭제실패");
				}
			}
			
			ArrayList<CampPictureVO> fileList = new ArrayList<CampPictureVO>();
			if(!mainFile.isEmpty()) {
				String mfilename = mainFile.getOriginalFilename();
				String mfilepath = new FileNameOver().rename(path, mfilename);
				try {
					byte[] mbytes = mainFile.getBytes();
					File upMFile = new File(path+mfilepath);
					FileOutputStream fos = new FileOutputStream(upMFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(mbytes);
					bos.close();
					CampPictureVO mf =new CampPictureVO();
					mf.setFilename(mfilename);
					mf.setFilepath(mfilepath);
					mf.setCampNo(c.getCampNo());
					mf.setFileGrade(1);
					fileList.add(mf);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(files.length>=3) {
				
				ArrayList<CampPictureVO> cplist2 = service.selectCampPictureList(c.getCampNo(),2);
				for(CampPictureVO cp : cplist2) {
					File delFile = new File(path+cp.getFilepath());
					boolean delResult = delFile.delete();
					if(delResult) {
						System.out.println(cp.getFilepath()+": 삭제성공");
					}else {
						System.out.println(cp.getFilepath()+": 삭제실패");
					}
				}
				
				for(MultipartFile file : files) {
					
					String filename = file.getOriginalFilename();
					String filepath = new FileNameOver().rename(path, filename);
					try {
						byte[] bytes = file.getBytes();
						File upFile = new File(path+filepath);
						FileOutputStream fos = new FileOutputStream(upFile);
						BufferedOutputStream bos = new BufferedOutputStream(fos);
						bos.write(bytes);
						bos.close();
						CampPictureVO f =new CampPictureVO();
						f.setFilename(filename);
						f.setFilepath(filepath);
						f.setCampNo(c.getCampNo());
						f.setFileGrade(2);
						fileList.add(f);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			c.setPictureList(fileList);
			int result = service.updateCamp(c);
			if(result>0) {
				model.addAttribute("msg","캠핑장이 수정 되었습니다.");
			}else {
				model.addAttribute("msg","수정실패");
			}
			model.addAttribute("loc","/operatorpage.do");
		}else {
			model.addAttribute("msg","사업자가 아닙니다.");
			model.addAttribute("loc","/");
		}
		return "common/msg";
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
			model.addAttribute("loc", "/campList.do?reqPage=1");
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
	public String opNoticeForm(Model model,int campNo,HttpSession session) {
		isOperator = isOperator(session);
		if(isOperator) {
			model.addAttribute("campNo",campNo);
			return "operator/campNoticeForm";
		}else {
			model.addAttribute("msg", "캠핑장 사업자가 아닙니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
			return "common/msg";
		}
	}
	@RequestMapping("/campNoticeUpdateForm.do")
	private String campNoticeUpdateForm(CampNoticeVO cn,Model model,HttpSession session) {
		isOperator = isOperator(session);
		if(isOperator) {
			CampNoticeVO cNotice = service.selectCampNotice(cn);
			model.addAttribute("cNotice",cNotice);
			return "operator/campNoticeUpdateForm";
		}else {
			model.addAttribute("msg", "캠핑장 사업자가 아닙니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
			return "common/msg";
		}
	}
	@RequestMapping("/insertCampNotice.do")
	private String insertCampNotice(HttpSession session,CampNoticeVO cn,Model model) {
		int result = service.insertCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "동지사항이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "등록 실패");
		}
		model.addAttribute("loc", "/opNoticeList.do?campNo="+cn.getCampNo()+"&reqPage=1");
		return "common/msg";
	}
	@RequestMapping("/updateCampNotice.do")
	public String opNoticeUpdate(CampNoticeVO cn,Model model,HttpSession session) {
		int result = service.updateCampNotice(cn);
		if(result>0) {
			model.addAttribute("msg", "공지사항이 수정되었습니다.");
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
			model.addAttribute("msg", "공지사항이 삭제되었습니다.");
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
	
	@RequestMapping("/opMypage.do")
	public String opUpdateMember(HttpSession session, Model model) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		if(m!=null) {
			MemberVO member = mService.mypageMember(m.getMemberNo());
			model.addAttribute("m", member);
			return "operator/member/opMypage";
		}else {
			model.addAttribute("msg", "로그인 후 이용해 주시기 바랍니다.");
			model.addAttribute("loc", "/loginFrm.do");
			return "common/msg";
		}
	}
	
	@RequestMapping("/opUpdateMember.do")
	public String updateMember(MemberVO m, Model model) {
		int result = mService.updateMember(m); 
		if(result>0) {
			model.addAttribute("msg", "회원정보를 수정했습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/operatorpage.do");
		return "common/msg";
	}
	@RequestMapping("/opCampSite.do")
	public String opCampSite(CampVO c,Model model) {
		CampVO camp = service.selectOneCamp(c);
		ArrayList<SiteVO> sList = service.selectSiteList(c);
		ArrayList<String> categorys = service.selectCategorys(c.getCampNo());
		
		model.addAttribute("siteList",sList);
		model.addAttribute("camp",camp);
		model.addAttribute("categorys",categorys);
		
		return "operator/site/opCampSite";
	}
	@RequestMapping("/opCampSiteForm.do")
	public String opCampSiteForm(CampVO c,Model model) {
		CampVO camp = service.selectOneCamp(c);
		ArrayList<String> categorys = service.selectCategorys(c.getCampNo());
		model.addAttribute("camp",camp);
		model.addAttribute("categorys",categorys);
		return "operator/site/opCampSiteForm";
	}
	@RequestMapping("/insertSite.do")
	public String insertSite(SiteVO s,Model model,HttpSession session) {
		CampVO c = new CampVO();
		c.setCampNo(s.getCampNo());
		CampVO camp = service.selectOneCamp(c);
		MemberVO member = (MemberVO)session.getAttribute("m");
		if(camp.getMemberNo()==member.getMemberNo()) {
			int result = service.insertSite(s);
			if(result>0) {
				model.addAttribute("msg", "사이트가 등록되었습니다.");
			}else {
				model.addAttribute("msg", "등록실패. 관리자에게 문의하세요");
			}
			model.addAttribute("loc", "/opCampSite.do?campNo="+c.getCampNo());
		}else {
			model.addAttribute("msg", "사업자가 아닙니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
		}
		return "common/msg";
	}
	@RequestMapping("/siteUpdateForm.do")
	public String siteUpdateForm(SiteVO s,Model model) {
		CampVO c = new CampVO();
		c.setCampNo(s.getCampNo());
		CampVO camp = service.selectOneCamp(c);
		SiteVO site = service.selectOneSite(s.getSiteNo());
		
		model.addAttribute("camp",camp);
		model.addAttribute("site",site);
	
		return "operator/site/opCampSiteUpdateForm";
	}
		
	@RequestMapping("/updateSite.do")
	public String updateSite(SiteVO s,Model model,HttpSession session) {
		CampVO c = new CampVO();
		c.setCampNo(s.getCampNo());
		CampVO camp = service.selectOneCamp(c);
		MemberVO member = (MemberVO)session.getAttribute("m");
		if(camp.getMemberNo()==member.getMemberNo()) {
			int result = service.updateSite(s);
			if(result>0) {
				model.addAttribute("msg", "사이트가 수정되었습니다.");
			}else {
				model.addAttribute("msg", "수정실패. 관리자에게 문의하세요");
			}
			model.addAttribute("loc", "/opCampSite.do?campNo="+c.getCampNo());
		}else {
			model.addAttribute("msg", "사업자가 아닙니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
		}
		return "common/msg";
	}
	@RequestMapping("/insertInfoImg.do")
	public String insertInfoImg(CampVO c,HttpServletRequest request,MultipartFile file,HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		CampVO camp = service.selectOneCamp(c);
		if(member!=null&&member.getMemberGrade()==2&&camp.getMemberNo()==member.getMemberNo()) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "/resources/upload/camp/";
			CampPictureVO f = new CampPictureVO();
			if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String filepath = new FileNameOver().rename(path, filename);
				try {
					byte[] mbytes = file.getBytes();
					File upMFile = new File(path+filepath);
					FileOutputStream fos = new FileOutputStream(upMFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(mbytes);
					bos.close();
					f.setFilename(filename);
					f.setFilepath(filepath);
					f.setFileGrade(3);
					f.setCampNo(c.getCampNo());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			int result = service.insertInfoImg(f);
			if(result>0) {
				model.addAttribute("msg","캠핑배치도가 등록되었습니다.");
			}else {
				model.addAttribute("msg","등록 실패");
			}
		}else {
			model.addAttribute("msg","사업자가 아닙니다.");
		}
		model.addAttribute("loc", "/opCampSite.do?campNo="+c.getCampNo());
		return "common/msg";
	}
	@RequestMapping("/updateInfoImg.do")
	public String updateInfoImg(CampVO c,HttpServletRequest request,MultipartFile file,HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		CampVO camp = service.selectOneCamp(c);
		if(member!=null&&member.getMemberGrade()==2&&camp.getMemberNo()==member.getMemberNo()) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root + "/resources/upload/camp/";
			
			ArrayList<CampPictureVO> cplist = service.selectCampPictureList(c.getCampNo(),3);
			for(CampPictureVO cp : cplist) {
				File delFile = new File(path+cp.getFilepath());
				boolean delResult = delFile.delete();
				if(delResult) {
					System.out.println(cp.getFilepath()+": 삭제성공");
				}else {
					System.out.println(cp.getFilepath()+": 삭제실패");
				}
			}
			
			CampPictureVO f = new CampPictureVO();
			if(!file.isEmpty()) {
				String mfilename = file.getOriginalFilename();
				String mfilepath = new FileNameOver().rename(path, mfilename);
				try {
					byte[] mbytes = file.getBytes();
					File upMFile = new File(path+mfilepath);
					FileOutputStream fos = new FileOutputStream(upMFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(mbytes);
					bos.close();
					f.setFilename(mfilename);
					f.setFilepath(mfilepath);
					f.setFileGrade(3);
					f.setCampNo(c.getCampNo());
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				int result = service.updateInfoImg(f);
				if(result>0&&!file.isEmpty()) {
					model.addAttribute("msg","캠핑배치도가 수정되었습니다.");
				}else {
					model.addAttribute("msg","수정 실패");
				}
			}
		}
		model.addAttribute("loc", "/opCampSite.do?campNo="+c.getCampNo());
		return "common/msg";
	}
	@RequestMapping("/deleteSite.do")
	public String deleteSite(SiteVO s,Model model,HttpSession session) {
		CampVO c = new CampVO();
		c.setCampNo(s.getCampNo());
		CampVO camp = service.selectOneCamp(c);
		MemberVO member = (MemberVO)session.getAttribute("m");
		if(camp.getMemberNo()==member.getMemberNo()) {
			int result = service.deleteSite(s.getSiteNo());
			if(result>0) {
				model.addAttribute("msg", "사이트가 삭제되었습니다.");
			}else {
				model.addAttribute("msg", "삭제실패. 관리자에게 문의하세요");
			}
			model.addAttribute("loc", "/opCampSite.do?campNo="+c.getCampNo());
		}else {
			model.addAttribute("msg", "사업자가 아닙니다.");
			model.addAttribute("loc", "/campList.do?reqPage=1");
		}
		return "common/msg";
	}
	@RequestMapping("/siteInfoPictureForm.do")
	public String siteInfoPictureForm(CampVO c,Model model) {
		CampVO camp = service.selectOneCamp(c);
		model.addAttribute("camp",camp);
		return "operator/site/opCampSitePicture";
	}
	@RequestMapping("/opCampSitePictureUpdateForm.do")
	public String siteInfoPictureUpdateForm(CampVO c,Model model) {
		CampVO camp = service.selectOneCamp(c);
		model.addAttribute("camp",camp);
		return "operator/site/opCampSiteUpdatePicture";
	}
	@RequestMapping("/opReservation.do")
	public String selectReservationList(ReserveVO r,Model model) {
		String today=r.getCheckInDate();
		CampVO c = new CampVO();
		c.setCampNo(r.getCampNo());
		CampVO camp = service.selectOneCamp(c);
		if(today==null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get ( cal.YEAR );
			int month = cal.get ( cal.MONTH ) + 1 ;
			int date = cal.get ( cal.DATE ) ;
			today = year+"-"+month+"-"+date;
			r.setCheckInDate(today);
		}
		ArrayList<ReserveVO> list = service.selectReservationList(r);
		model.addAttribute("list",list);
		model.addAttribute("camp",camp);
		model.addAttribute("checkInDate",r.getCheckInDate());
		return "operator/reserve/opReservationList";
	}
	
	
}
