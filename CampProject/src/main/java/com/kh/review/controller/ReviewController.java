package com.kh.review.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.camp.model.vo.CampVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewFileName;
import com.kh.review.model.vo.ReviewFileVO;
import com.kh.review.model.vo.ReviewPageData;
import com.kh.review.model.vo.ReviewVO;
import com.kh.review.model.vo.ReviewViewData;


@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//캠핑 후기 - 목록보기
	@RequestMapping("/reviewList.do")
	public String reviewList(int reqPage, Model model) {
		ReviewPageData rpd = service.reviewList(reqPage);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		return "review/reviewList";
	}
	
	//캠핑 후기 - 캠핑장 검색
	@RequestMapping("/searchKeyword.do")
	public String searchKeyword(int reqPage, String keyword, Model model) {
		ReviewPageData rpd = service.searchKeyword(reqPage, keyword);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		return "review/reviewList";
	}
	
	//캠핑 후기 - 상세보기
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
	
	//캠핑 후기 - 글 작성하기 (페이지 이동)
	@RequestMapping("/reviewWriteFrm.do")
	public String reviewWriteFrm() {
		return "review/reviewWriteFrm";
	}
	
	//캠핑 후기 - 글 작성하기 (예약번호 조회)
	@RequestMapping("/searchReserve.do")
	public String searchReserve(int memberNo, Model model) {
		ArrayList<ReserveCampVO> listRes = service.selectListReserve(memberNo);
		model.addAttribute("listRes", listRes);
		return "review/searchReserve";
	}
	
	//캠핑 후기 - 글 작성하기
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewVO r, Model model, MultipartFile[] files, HttpServletRequest request) {	
	//MultipartFile[] 배열 처리하면 파일을 여러 개 올릴 수 있음 | MultipartFile-input(Name) 이름 맞추기
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/review/";

		ArrayList<ReviewFileVO> fileList = new ArrayList<ReviewFileVO>();

		for (MultipartFile file : files) { // 파일이 여러 개여서 반복문으로 처리
			if (!file.isEmpty()) { //첨부파일이 없을 때는 if문을 수행하지 않음
				
				//getOriginalFilename() : 파일 이름을 String 값으로 반환
				String filename = file.getOriginalFilename();
				//파일이름 중복 시 넘버링 해주는 FileNameOverlap(ReveiwFilName)활용 
				String filepath = new ReviewFileName().rename(path, filename);
				System.out.println("filename : " + filename);
				System.out.println("filepath : " + filepath);
				
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path + filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();

					ReviewFileVO f = new ReviewFileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					fileList.add(f); //데이터베이스 처리를 위해 list에 추가
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//ReviewVO 객체에 FileList 세팅 
		r.setFileList(fileList);
		
		//결과처리
		int result = service.insertReview(r);
		if (result > 0) {
			model.addAttribute("msg", "후기 글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/reviewList.do?reqPage=1");
		return "common/msg";
	}

	
	//캠핑 후기 - 글 수정하기 (페이지 이동)
	@RequestMapping("/reviewUpdateFrm.do")
	public String reviewUpdateFrm(int reviewNo, Model model) {
		ReviewVO rev = service.selectOneReview(reviewNo);
		model.addAttribute("rev", rev);
		return "review/reviewUpdateFrm";
	}
	
	//캠핑 후기 - 글 수정하기
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewVO r, String delFileList, Model model) {
		//배열로 넘어온 거 int로 변경
		//System.out.println(delFileList);
		int reviewNo = r.getReviewNo();
		int campNo = service.searchCampNo(reviewNo);
		int result = service.updateReview(r); 
		if(result>0) {
			model.addAttribute("msg", "후기 글이 수정되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요"); 
		} 
		model.addAttribute("loc", "/reviewView.do?reviewNo="+reviewNo+"&campNo="+campNo);
		return "common/msg";		
	}
	
	//캠핑 후기 - 글 삭제하기
	@RequestMapping("/deleteReview.do")
	public String deleteReview(int reviewNo, Model model) {
		int result = service.deleteReview(reviewNo);
		if (result > 0) {
			model.addAttribute("msg", "후기 글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/reviewList.do?reqPage=1");
		return "common/msg";
	}
	
	//캠핑 후기 - 댓글 작성하기
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
	
	//캠핑 후기 - 댓글 수정하기
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
	
	//캠핑 후기 - 댓글 삭제하기
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
