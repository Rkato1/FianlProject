package com.kh.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.notice.model.vo.FileVO;
import com.kh.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public Notice selectOneNotice(int noticeNo) {
		return sqlSession.selectOne("selectOneNotice", noticeNo);
	}
	
	public ArrayList<Notice> selectNoticeList(HashMap<String, Integer> map) {
		List<Notice> list = sqlSession.selectList("selectNoticeList", map);
		return (ArrayList<Notice>) list;
	}
	
	public int totalNoticeCount() {
		return sqlSession.selectOne("selectNoticeCount");
	}
	
	public int insertReviewFile(FileVO fv) {
		return sqlSession.insert("insertNoticeFile", fv);
	}
	
	public ArrayList<FileVO> selectFileList(int noticeNo) {
		List<FileVO> list = sqlSession.selectList("selectNoticeFileList", noticeNo);
		return (ArrayList<FileVO>)list;
	}
	
	public int insertNotice(Notice n) {
		return sqlSession.insert("insertNotice", n);
	}

	public int selectNoticeNo() {
		return sqlSession.selectOne("selectNoticeNo");
	}

	public int insertNoticeFile(FileVO fv) {
		return sqlSession.insert("insertNoticeFile", fv);
	}
	
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete("deleteNotice", noticeNo);
	}
	
	public int updateNotice(Notice n) {
		return sqlSession.update("updateNotice", n);
	}
}
