package com.kh.notice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.FileVO;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageData;

@Service
public class NoticeService {
	@Autowired
	NoticeDao dao;

	public NoticePageData selectAllNotice(int reqPage) {
		//게시물 구해오기
		//한 페이지당 게시물 수
		int numPerPage = 10;
		//게시물 10개 가져오기(start,end값 계산)
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectNoticeList(map);
		//pageNavi제작
		//총 개수
		int totalCount = dao.totalNoticeCount();
		//총 페이지 수
		int totalPage=0;
		if(totalCount%numPerPage==0) {
			totalPage=totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		//페이지네비의 길이
		int pageNaviSize=5;
		//페이지 네비 시작 번호
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize +1;
		//페이지 네비 작성
		String pageNavi = "";
		//이전 버튼 생성
		if(pageNo!=1) {
			pageNavi += "<a href='/notice/noticeList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/notice/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			//끝 페이지라면
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/notice/noticeList.do?reqPage="+pageNo+"'>[다음]</a>";;
		}
		//System.out.println(pageNavi);
		NoticePageData npd = new NoticePageData(list,pageNavi);
		return npd;
	}
	
	public Notice selectOneNotice(int noticeNo) {
		Notice n = dao.selectOneNotice(noticeNo);
		if(n != null) {
			ArrayList<FileVO> fileList = dao.selectFileList(noticeNo);
			n.setFileList(fileList);
		}		
		return n;
	}
	
	public int insertNotice(Notice n) {
		
		int result = dao.insertNotice(n);
		if(result>0) {
			int NoticeNo = dao.selectNoticeNo();
			
			for(FileVO fv : n.getFileList()) {
				fv.setNoticeNo(NoticeNo);
				result = dao.insertNoticeFile(fv);
			}
		}
		return result;
	}
	
	public int updateNotice(Notice n) {
		return dao.updateNotice(n);
	}

	public int deleteNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}
}
