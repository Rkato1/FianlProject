package com.kh.camp.used.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.camp.used.service.UsedService;
import com.kh.camp.used.vo.FileNameOver;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedPageNavi;
import com.kh.camp.used.vo.UsedVO;


@Controller
public class UsedController {

	@Autowired
	private UsedService service;

	@RequestMapping("/usedPage.do")
	public String usedPage(int reqPage, Model model) {
		UsedPageNavi cpn = service.usedPage(reqPage);
		model.addAttribute("list", cpn.getList());
		model.addAttribute("pageNavi", cpn.getPageNavi());
		return "used/usedPage";
	}
	//Datail 중고판매 상세정보를 보기위한 controller
	@RequestMapping("/usedDatail.do")
	public String usedDatail(Model model, UsedVO used) {
		UsedVO u = service.selectDatail(used);
		model.addAttribute("u",u);
		model.addAttribute("list",u.getFile());
		return "used/usedDatail";
	}
	@RequestMapping("/usedEnroll.do")
	public String usedEnroll() {
		return "used/usedEnroll";
	}
	@RequestMapping("/usedEnrollEnd.do")
	public String usedEnrollOk(UsedVO usedVO, Model model, MultipartFile[] files, HttpServletRequest request) {	
		String root = request.getSession().getServletContext().getRealPath("/");   //MultipartFile 은 input 타입의 네임과 같아야한다.(400뜸)
		//업로드할 지점 설정
		System.out.println("넌 뭐냐 :"+root);
		String path = root + "resources/upload/used/";
		System.out.println("경로 :"+ path);
		ArrayList<UsedFileVO> fileList = new ArrayList<UsedFileVO>();
		for (MultipartFile file : files) {
			System.out.println(file);
			if (!file.isEmpty()) {
				//올린 파일명을 저장하는 구문
				String filename = file.getOriginalFilename();
				//중복파일 처리
				String filepath = new FileNameOver().rename(path, filename);
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path + filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					System.out.println(fos);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					System.out.println(bos);
					bos.write(bytes);
					bos.close();
					UsedFileVO f = new UsedFileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					//파일이 업로드된 시점
					//DB에 저장하기 위해 객체를 리스트화
					fileList.add(f);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		usedVO.setFile(fileList);
		int result = service.usedEnrollOk(usedVO);
		if (result > 0) {
			model.addAttribute("msg", "물품등록을 완료하였습니다.");
		} else {
			model.addAttribute("msg", "물품등록을 실패하였습니다.");
		}
		model.addAttribute("loc", "/usedPage.do?reqPage=1");
		return "common/msg";
	}
//	//검색기능을 구현 컨트롤
//	@RequestMapping("/searchKeyword.do")
//	public String searchKeyword (String searchKeyword) {
//		UsedVO keyword = service.keyword(searchKeyword);
//		
//		return "used/usedPage.do";
//	}
	
}
