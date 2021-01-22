package com.kh.camp.used.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.dao.UsedDao;
import com.kh.camp.used.vo.UsedCommentData;
import com.kh.camp.used.vo.UsedCommentVO;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedMessageChatVO;
import com.kh.camp.used.vo.UsedMessageVO;
import com.kh.camp.used.vo.UsedPageNavi;
import com.kh.camp.used.vo.UsedVO;
import com.kh.review.model.vo.ReviewCommentVO;

@Service
public class UsedService {
	@Autowired
	private UsedDao dao;

	// 페이지 초기 리스트
	public UsedPageNavi usedPage(int reqPage) {
		// 한 페이지의 게시물 수를 정함
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<UsedVO> list = dao.usedPage(map);
		for (UsedVO u : list) {
			map.put("usedNo", u.getUsedNo());
			ArrayList<UsedFileVO> fileList = dao.UsedFileList(map);
			u.setFile(fileList);
		}
		int totalCount = dao.totalCount();
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/usedPage.do?reqPage=";
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>&nbsp;";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>&nbsp;"; // <a
																				// href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>&nbsp;";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		UsedPageNavi cpn = new UsedPageNavi();
		cpn.setList(list);
		cpn.setPageNavi(pageNavi);
		return cpn;
	}

	// 페이지 검색 리스트
	public UsedPageNavi usedSearch(int reqPage, String search) {
		// 한 페이지의 게시물 수를 정함
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		ArrayList<UsedVO> list = dao.usedSearch(map);
		for (UsedVO u : list) {
			map.put("usedNo", u.getUsedNo());
			ArrayList<UsedFileVO> fileList = dao.UsedFileListSearch(map);
			u.setFile(fileList);
		}
		int totalCount = dao.totalCountSearch(search);
		System.out.println("count개수" + totalCount);
		int totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage != 0) {
			totalPage++;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		String repeatStr = "<a class='btn btn-outline-primary navi-btn' href='/usedPage.do?reqPage=";
		
		if (pageNo != 1) {
			pageNavi += repeatStr + (pageNo - 1) + "'>이전</a>&nbsp;";
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi += repeatStr + pageNo + "'>" + pageNo + "</a>&nbsp;"; // <a
																				// href='/noticeList.do?reqPage=1'>1</a>
			} else {
				pageNavi += "<span class='btn btn-outline-primary navi-btn'>" + pageNo + "</span>&nbsp;";
			}
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi += repeatStr + (pageNo) + "'>다음</a>";
		}
		
		// 검색 후에 조회된 결과가 없으면 페이지 네비 없애기
		if (totalCount == 0) {
			pageNavi = "";
		}
		
		UsedPageNavi cpn = new UsedPageNavi();
		cpn.setList(list);
		cpn.setPageNavi(pageNavi);
		return cpn;
	}
	public int usedEnrollOk(UsedVO usedVO) {
		int result = dao.usedEnrollOk(usedVO);
		if (result > 0) {
			int usedNo = dao.selectNo();
			System.out.println(usedNo);
			for (UsedFileVO ufv : usedVO.getFile()) {
				result = dao.insertFile(usedNo, ufv.getFilename(), ufv.getFilepath());
			}
		}
		return result;
	}
	// Datail 중고판매 상세정보를 보기위한 service
	public UsedVO selectDatail(UsedVO used) {
		UsedVO u = dao.selectDatail(used);
		ArrayList<UsedFileVO> fileList = dao.selectDatailFile(used.getUsedNo());
		u.setFile(fileList);
		return u;
	}
	// 상세보기 댓글 
	//상품 수정select과정
	public UsedVO updateEnroll(UsedVO used) {
		return dao.updateEnroll(used);
	}
	//업데이트
	public int updateEnrollEnd(UsedVO used) {
		return dao.updateEnrollEnd(used);
	}
	//삭제
	public int deleteEnroll(int usedNo) {
		int result = dao.deleteEnroll(usedNo);
		if(result > 0) {
				result = dao.deleteFile(usedNo);
		}
		return result;
	}
	//댓글 부분 service
	//댓글 인서트
	public int insertComment(UsedCommentVO uc) {
		System.out.println(uc);
		return dao.insertComment(uc);
	}
	public UsedCommentData selectUcd(int usedNo) {
		//중고거래를 받아옴
		//UsedVO usv = dao.selectOneUsed(usedNo);
		
		//중고거래의 댓글 갯수를 가져옴
		int cnt = dao.selectCommentCnt(usedNo);
		
		//중고거래의 댓글을 가져옴
		ArrayList<UsedCommentVO> list = dao.selectComment(usedNo);
		
		UsedCommentData ucd = new UsedCommentData();
		ucd.setCnt(cnt);
		ucd.setClist(list);
		
		return ucd;
	}
	//댓글 수정
	public int updateComment(UsedCommentVO uc) {
		return dao.updateComment(uc);
	}
	//댓글 삭제
	public int deleteComment(UsedCommentVO uc) {
		return dao.deleteComment(uc);
	}

	//채팅 service
	public ArrayList<UsedMessageVO> selectUMList(String memberId, HttpSession session) {
		return dao.selectUMList(memberId);
	}
	//채팅방이 있는지 없는지 검색
	public UsedMessageChatVO selectChat(UsedMessageVO msg, HttpSession session) {
		System.out.println("service:"+msg.getUmReceiver());
		return dao.selectChat(msg,session);
	}
	//메세지를 보내는 서비스
	public int insertUm(UsedMessageVO msg, HttpSession session) {
		return dao.insertUm(msg,session);
	}
	//채팅방이 없다면 만들어줌
	public int insertRoom(UsedMessageVO msg, HttpSession session) {
		return dao.insertRoom(msg, session);
	}
	//채팅방의 리스트를 가져오는 것
	public ArrayList<UsedMessageChatVO> selectMessageChatList(String memberId) {
		ArrayList<UsedMessageChatVO> chatList = dao.selectMessageChatList(memberId);
		System.out.println(chatList);
		return chatList;
	}

	public ArrayList<UsedMessageVO> selectMessageList(String memberId, UsedMessageVO msg) {
		ArrayList<UsedMessageVO> msgList = dao.selectMessageList(memberId, msg);
		System.out.println(msg);
		System.out.println(msgList);
		return msgList;
	}
	
	


}
