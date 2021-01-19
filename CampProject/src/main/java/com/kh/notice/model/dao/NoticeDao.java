package com.kh.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectAllNotice() {
		List<Notice> list = sqlSession.selectList("selectAllNotice");
		return (ArrayList<Notice>) list;
	}
	public Notice selectOneNotice(int noticeNo) {
		return sqlSession.selectOne("selectOneNotice", noticeNo);
	}
}
