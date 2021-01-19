package com.kh.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	NoticeDao dao;

	public ArrayList<Notice> selectAllNotice() {		
		return dao.selectAllNotice();
	}
	
	public Notice selectOneNotice(int noticeNo) {
		return dao.selectOneNotice(noticeNo);
	}
}
