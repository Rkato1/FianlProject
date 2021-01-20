package com.kh.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.member.model.vo.MemberVO;
import com.kh.notice.model.vo.FileVO;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageData;
import com.kh.notice.service.NoticeService;
import com.kh.review.model.vo.ReviewFileName;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
		
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, int reqPage) {
		NoticePageData npd = service.selectAllNotice(reqPage);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}
	
	//캠핑 후기 - 글 작성하기
	@RequestMapping("/noticeInsert.do")
	public String insertNotice(Notice n, Model model, MultipartFile[] files, HttpServletRequest request) {	
	//MultipartFile[] 배열 처리하면 파일을 여러 개 올릴 수 있음 | MultipartFile-input(Name) 이름 맞추기
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/notice/";

		ArrayList<FileVO> fileList = new ArrayList<FileVO>();

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

					FileVO f = new FileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					fileList.add(f); //데이터베이스 처리를 위해 list에 추가
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//Notice 객체에 FileList 세팅 
		n.setFileList(fileList);
		
		//결과처리
		int result = service.insertNotice(n);
		if (result > 0) {
			model.addAttribute("msg", "공지사항이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/noticeList.do?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/noticeView.do")
	public String selectOnenotice(Notice n, Model model) {
		Notice notice = service.selectOneNotice(n.getNoticeNo());
		//System.out.println(notice.getNoticeNo());
		model.addAttribute("n", notice);
		return "notice/noticeView";
	}

	@RequestMapping("/noticeUpdateForm.do")
	public String noticeUpdateForm(Model model, int noticeNo) {		
		Notice notice = service.selectOneNotice(noticeNo);
		//System.out.println(notice.getNoticeNo());
		model.addAttribute("n", notice);
		return "notice/noticeUpdateFrm";
	}
	
	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(Model model, Notice n) {		
		int result = service.updateNotice(n);
		//System.out.println(notice.getNoticeNo());
		if (result > 0) {
			model.addAttribute("msg", "공지사항이 수정되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/noticeView.do?noticeNo="+n.getNoticeNo());
		return "common/msg";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(Model model, int noticeNo) {
		int result = service.deleteNotice(noticeNo);
		if (result > 0) {
			model.addAttribute("msg", "공지사항이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "※에러※ 관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/noticeList.do?reqPage=1");
		return "common/msg";
	}
	
}
