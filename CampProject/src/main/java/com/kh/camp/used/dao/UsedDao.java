package com.kh.camp.used.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.used.vo.UsedCommentVO;
import com.kh.camp.used.vo.UsedFileVO;
import com.kh.camp.used.vo.UsedVO;


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



	


	
	
}
