package com.kh.camp.used.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.used.vo.UsedCommentVO;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedMessageChatVO;
import com.kh.camp.used.vo.UsedMessageVO;
import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.vo.MemberVO;


@Repository
public class UsedDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//리스트
	public ArrayList<UsedVO> usedPage(HashMap<String, Integer> map) {
		List<UsedVO> list = sqlSession.selectList("used.selectList",map);
		return (ArrayList<UsedVO>)list;
	}

	public ArrayList<UsedFileVO> UsedFileList(HashMap<String, Integer> map) {
		List<UsedFileVO> fileList = sqlSession.selectList("used.selectFileList",map);
		return (ArrayList<UsedFileVO>)fileList;
	}
	public int totalCount() {
		return sqlSession.selectOne("used.totalCount");
	}
	//가격순
	
	
	
	//검색
	public ArrayList<UsedVO> usedSearch(HashMap<String, Object> map) {
		System.out.println(map);
		List<UsedVO> list = sqlSession.selectList("used.selectListSearch",map);
		return (ArrayList<UsedVO>)list;
	}
	public ArrayList<UsedFileVO> UsedFileListSearch(HashMap<String, Object> map) {
		List<UsedFileVO> fileList = sqlSession.selectList("used.selectFileListSearch",map);
		return (ArrayList<UsedFileVO>)fileList;
	}
	public int totalCountSearch(String search) {
		return sqlSession.selectOne("used.totalCountSearch",search);
	}
	////////////////////////////////////////////////////////////////////////////////////////
	public int usedEnrollOk(UsedVO usedVO) {
		return sqlSession.insert("used.usedInsert", usedVO);
	}

	public int insertFile(int usedNo, String filename, String filepath) {
		UsedFileVO fileVO = new UsedFileVO();
		fileVO.setUsedNo(usedNo);
		fileVO.setFilename(filename);
		fileVO.setFilepath(filepath);
		return sqlSession.insert("used.fileInsert", fileVO);
	}

	public int selectNo() {
		return sqlSession.selectOne("used.selectNo");
	}
	//Datail 중고판매 상세정보를 보기위한 dao	
	public UsedVO selectDatail(UsedVO used) {
		return sqlSession.selectOne("used.selectOneDatail",used);
	}
	public ArrayList<UsedFileVO> selectDatailFile(int usedNo) {
		List<UsedFileVO> fileList = sqlSession.selectList("used.selectDatailFile",usedNo);
		return (ArrayList<UsedFileVO>)fileList;
	}
	//중고상품
	public UsedVO updateEnroll(UsedVO used) {
		return sqlSession.selectOne("used.updateEnroll",used);
	}
	//중고상품 업데이트
	public int updateEnrollEnd(UsedVO used) {
		return sqlSession.update("used.usedUpdate", used);
	}
	//물품 삭제
	public int deleteEnroll(int usedNo) {
		return sqlSession.delete("used.deleteEnroll", usedNo);
	}
	//물품 삭제
	public int deleteFile(int usedNo) {
		return sqlSession.delete("used.deleteFile", usedNo);
	}

	public int insertComment(UsedCommentVO uc) {
		System.out.println(uc);
		return sqlSession.insert("used.insertComment", uc);
	}

	public UsedVO selectOneUsed(int usedNo) {
		return sqlSession.selectOne("used.selectOneUsed",usedNo);
	}

	public int selectCommentCnt(int usedNo) {
		return sqlSession.selectOne("used.selecCommentCnt", usedNo);
	}
	public ArrayList<UsedCommentVO> selectComment(int usedNo) {
		List<UsedCommentVO> list = sqlSession.selectList("used.selectComment",usedNo);
		return (ArrayList<UsedCommentVO>)list;
	}

	public int updateComment(UsedCommentVO uc) {
		return sqlSession.update("used.updateComment",uc);
	}

	public int deleteComment(UsedCommentVO uc) {
		return sqlSession.delete("used.deleteComment",uc);
	}

	public ArrayList<UsedMessageVO> selectUMList(String memberId) {
		List<UsedMessageVO> list = sqlSession.selectList("used.selectUMList",memberId);
		return (ArrayList<UsedMessageVO>)list;
	}

//	public int umInsert(UsedMessageVO msg) {
//		//select 방이 존재하는지
//		//존재하는 경우
//		//존재하지 않는 경
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("sender",msg.getUmSender());
//		map.put("receiver",msg.getUmReceiver());
//		map.put("message",msg.getMessage());
//		return sqlSession.insert("used.insertMsg",map);
//	}
	//채팅방이 있는지 없는지 검색
	public UsedMessageChatVO selectChat(UsedMessageVO msg, HttpSession session) {
			MemberVO member = (MemberVO)session.getAttribute("m");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("sender", member.getMemberId());
			map.put("receiver", msg.getUmReceiver());
			System.out.println("Dao:"+map);
		return sqlSession.selectOne("used.selectChat",map);
	}
	public int insertUm(UsedMessageVO msg, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", member.getMemberId());
		map.put("receiver", msg.getUmReceiver());
		map.put("message", msg.getMessage());
		return sqlSession.insert("used.insertUm",map);
	}

	public int umCount(String data) {
		return sqlSession.selectOne("used.umCount",data);
	}

	public int insertRoom(UsedMessageVO msg, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", member.getMemberId());
		map.put("receiver", msg.getUmReceiver());
		return sqlSession.insert("used.insertRoom",map);
	}
	public int insertRoom2(UsedMessageVO msg, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("m");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", member.getMemberId());
		map.put("receiver", msg.getUmReceiver());
		return sqlSession.insert("used.insertRoom2",map);
	}

	public ArrayList<UsedMessageChatVO> selectMessageChatList(String memberId) {
		List<UsedMessageChatVO> list = sqlSession.selectList("used.selectMessageChatList",memberId);
		System.out.println(list);
		return (ArrayList<UsedMessageChatVO>)list;
	}
	
	public ArrayList<UsedMessageChatVO> selectMessageChatListR(String memberId) {
		List<UsedMessageChatVO> list = sqlSession.selectList("used.selectMessageChatListR",memberId);
		System.out.println(list);
		return (ArrayList<UsedMessageChatVO>)list;
	}

	public ArrayList<UsedMessageVO> selectMessageList(String memberId, UsedMessageVO msg) {
		HashMap<String,String> map = new HashMap<String, String>();
		System.out.println(msg);
		map.put("sender", memberId);
		map.put("receiver", msg.getUmReceiver());
		List<UsedMessageVO> list = sqlSession.selectList("used.selectMessageList",map);
		return (ArrayList<UsedMessageVO>)list;
	}





	


	
	
}
