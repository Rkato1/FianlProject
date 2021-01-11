package com.kh.camp.used.controller;

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

	@RequestMapping("/usedDatail.do")
	public String usedDatail(Model model) {
		return "used/usedDatail";
	}
	@RequestMapping("/usedEnroll.do")
	public String usedEnroll() {
		return "used/usedEnroll";
	}
	
	@RequestMapping("/usedEnrollEnd.do")
	public String usedEnrollOk(UsedVO usedVO, Model model, MultipartFile[] files, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/used/";
		ArrayList<UsedFileVO> fileList = new ArrayList<UsedFileVO>();
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String filepath = new FileNameOver().rename(path, filename);
				System.out.println("filename = " + filename);
				System.out.println("filepath = " + filepath);
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path + filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					UsedFileVO f = new UsedFileVO();
					f.setFilename(filename);
					f.setFilepath(filepath);
					//파일이 업로드된 시점
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
		model.addAttribute("loc", "/usedPage.do");
		return "common/msg";
	}
}
