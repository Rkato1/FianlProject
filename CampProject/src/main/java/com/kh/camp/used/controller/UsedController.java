package com.kh.camp.used.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mortbay.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.camp.used.service.UsedService;
import com.kh.camp.used.vo.FileNameOver;
import com.kh.camp.used.vo.UsedCommentData;
import com.kh.camp.used.vo.UsedCommentVO;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedMessageChatVO;
import com.kh.camp.used.vo.UsedMessageVO;
import com.kh.camp.used.vo.UsedPageNavi;
import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.vo.MemberVO;


@Controller
public class UsedController {

	@Autowired
	private UsedService service;
	//중고거래 물품들의 초기 리스트
	@RequestMapping("/usedPage.do")
	public String usedPage(int reqPage, Model model) {
		UsedPageNavi cpn = service.usedPage(reqPage);
		model.addAttribute("list", cpn.getList());
		model.addAttribute("pageNavi", cpn.getPageNavi());
		return "used/usedPage";
	}
	//중고거래 물품 검색
	@RequestMapping("/usedSearch.do")
	public String usedSearch(int reqPage, String search, Model model) {
		UsedPageNavi cpn = service.usedSearch(reqPage, search);
		System.out.println(search);
		model.addAttribute("list", cpn.getList());
		model.addAttribute("pageNavi", cpn.getPageNavi());
		return "used/usedPage";
	}
	//Datail 중고판매 상세정보를 보기위한 controller
	@RequestMapping("/usedDatail.do")
	public String usedDatail(Model model, UsedVO used) {
		System.out.println(used.getUsedNo());
		UsedVO u = service.selectDatail(used);
		UsedCommentData ucd = service.selectUcd(u.getUsedNo());
		System.out.println(u.getUsedPrice());
		model.addAttribute("u",u);
		model.addAttribute("list", u.getFile());
		model.addAttribute("clist",ucd.getClist());
		model.addAttribute("cnt",ucd.getCnt());
		return "used/usedDatail";
	}
	//댓글 달기
	@RequestMapping("/usedComment.do")
	public String usedComment(Model model, UsedCommentVO uc) {
		int usedNo = uc.getUsedNo();
		System.out.println("usedNO : "+usedNo);
		int result = service.insertComment(uc);
		if(result > 0) {
			model.addAttribute("msg","댓글 등록 완료!");
		}else {
			model.addAttribute("msg","댓글 등록 실패!");
		}
		model.addAttribute("loc","/usedDatail.do?usedNo="+usedNo);
		return "common/msg";
	}
	//댓글 수정
	@RequestMapping("/updateComment.do")
	public String updateComment(Model model, UsedCommentVO uc) {
		int usedNo = uc.getUsedNo();
		System.out.println("usedNo : "+usedNo);
		int result = service.updateComment(uc); 
		if(result>0) {
			model.addAttribute("msg", "댓글이 수정되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 수정에 실패하였습니다."); 
		} 
		model.addAttribute("loc","/usedDatail.do?usedNo="+usedNo);
		return "common/msg";
	}
	//댓글 삭제
	@RequestMapping("/deleteComment.do")
	public String deleteComment(Model model, UsedCommentVO uc) {
		int usedNo = uc.getUsedNo();
		System.out.println("usedNo : "+usedNo);
		int result = service.deleteComment(uc); 
		if(result>0) {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제를 실패하였습니다."); 
		} 
		model.addAttribute("loc","/usedDatail.do?usedNo="+usedNo);
		return "common/msg";
	}
	//물품등록 페이지연결
	@RequestMapping("/usedEnroll.do")
	public String usedEnroll() {
		return "used/usedEnroll";
	}
	//물품등록
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
				String filename;
				try {
					filename = new String(file.getOriginalFilename().getBytes("8859_1"), "UTF-8");
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
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
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
	//상품 업데이트 페이지들어가기(정보검사)
		@RequestMapping("/updateEnroll.do")
		public String updateEnroll(UsedVO used, Model model) {
			UsedVO usedVO = service.updateEnroll(used);
			if(used != null) {
				model.addAttribute("u",usedVO);
				model.addAttribute("list",usedVO.getFile());
				return "used/updateEnroll";
			}else {
				model.addAttribute("msg", "정보가 없습니다.");
				return "common/msg";
			}
		}
	//물품 수정
	@RequestMapping("/updateEnrollEnd.do")
	public String updateEnrollEnd(UsedVO used, Model model) {
		int result = service.updateEnrollEnd(used);
		System.out.println(result);
		if (result > 0) {
			model.addAttribute("msg", "물품수정을 완료하였습니다.");
		} else {
			model.addAttribute("msg", "물품수정을 실패하였습니다.");
		}
		model.addAttribute("loc", "/usedPage.do?reqPage=1");
		return "common/msg";
	}
	//물품 삭제
	@RequestMapping("/deleteEnroll.do")
	public String deleteEnroll(int usedNo, Model model) {
		int result = service.deleteEnroll(usedNo);
		if(result > 0) {
			model.addAttribute("msg","등록하신 물품이 삭제되었습니다.");
		}else {
			model.addAttribute("msg","등록하신 물품이 삭제되었습니다.");
		}
		model.addAttribute("loc","/usedPage.do?reqPage=1");
		return "common/msg";
	}
	
	
	@ResponseBody
	@RequestMapping("/insertUm.do")
	public int insertUm(UsedMessageVO msg, HttpSession session) {
		//1차 채팅방이 있는지 없는지 확인 memberId와 판매자 SQL AND로 판매자만 넘기면
		System.out.println(msg.getUmReceiver());
		UsedMessageChatVO chat = service.selectChat(msg,session);
		int insertUM = 0;
		if(chat != null) {
			insertUM = service.insertUm(msg,session);
		}else {
			service.insertRoom(msg,session);
			insertUM = service.insertUm(msg,session);
		}
		return insertUM;
	}
	
	@ResponseBody
	@RequestMapping("/selectRoom.do")
	public ArrayList<UsedMessageChatVO> selectRoom(HttpSession session) {
			MemberVO m = (MemberVO) session.getAttribute("m");
			ArrayList<UsedMessageChatVO> chatList = null;
			chatList = service.selectMessageChatList(m.getMemberId());
			if(chatList.size() == 0 ) {
				chatList = service.selectMessageChatListR(m.getMemberId());
				return chatList;
			}else {
				return chatList;
		}
	}
	
	//방을 눌렀을때 
	@ResponseBody
	@RequestMapping("/selectMessage.do")
	public ArrayList<UsedMessageVO> selectMessage(HttpSession session, UsedMessageVO msg){
		MemberVO m = (MemberVO) session.getAttribute("m");
		System.out.println(msg);
		ArrayList<UsedMessageVO> msgList = service.selectMessageList(m.getMemberId(), msg);
		System.out.println(msgList);
		return msgList;
	}
	//채팅방 클릭시
	@ResponseBody
	@RequestMapping("/insertMessage.do")
	public int insertMessage(UsedMessageVO msg, HttpSession session) {
		//1차 채팅방이 있는지 없는지 확인 memberId와 판매자 SQL AND로 판매자만 넘기면
		System.out.println(msg.getUmReceiver());
		UsedMessageChatVO chat = service.selectChat(msg,session);
		int insertUM = 0;
		if(chat != null) {
			insertUM = service.insertUm(msg,session);
		}else {
			service.insertRoom(msg,session);
			insertUM = service.insertUm(msg,session);
		}
		return insertUM;
	}
	
//	@RequestMapping("/selectBox.do")
//	public String select(String ware) {
//		System.out.println(ware);
//		return "used/usedPage";
//	}
	
	
	
	
	
	
	
	
	
}


