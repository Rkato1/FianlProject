package com.kh.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.CampVOPageData;
import com.kh.admin.model.vo.ChartBasicData;
import com.kh.admin.model.vo.MemberVOPageData;
import com.kh.admin.model.vo.ReserveVOPageData;
import com.kh.camp.model.vo.CampVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveVO;

@Service
public class AdminService{
	@Autowired
	AdminDao dao;
	
	public MemberVOPageData selectAllMember(int reqPage) {
		//게시물 구해오기
		//한 페이지당 게시물 수
		int numPerPage = 10;
		//게시물 10개 가져오기(start,end값 계산)				
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<MemberVO> list = dao.selectMemberList(map);
		//System.out.println("조회 거친후 크기 = "+list.size());
		//pageNavi제작
		//총 개수
		int totalCount = dao.totalCount();
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
			pageNavi += "<a href='/admin/memberAdmin.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/admin/memberAdmin.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
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
			pageNavi += "<a href='/admin/memberAdmin.do?reqPage="+pageNo+"'>[다음]</a>";;
		}
		//System.out.println(pageNavi);
		MemberVOPageData mpd = new MemberVOPageData(list,pageNavi);
		return mpd;
	}

	public CampVOPageData selectAllBusiness(int reqPage) {
		//게시물 구해오기
		//한 페이지당 게시물 수
		int numPerPage = 10;
		//게시물 10개 가져오기(start,end값 계산)				
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<CampVO> list = dao.selectBusinessList(map);
		//pageNavi제작
		//총 개수
		int totalCount = dao.totalBusinessCount();
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
			pageNavi += "<a href='/admin/businessAdmin.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/admin/businessAdmin.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
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
			pageNavi += "<a href='/admin/businessAdmin.do?reqPage="+pageNo+"'>[다음]</a>";;
		}
		//System.out.println(pageNavi);
		CampVOPageData cpd = new CampVOPageData(list,pageNavi);
		return cpd;
	}

	public ReserveVOPageData selectAllReserve(int reqPage) {
		//게시물 구해오기
		//한 페이지당 게시물 수
		int numPerPage = 10;
		//게시물 10개 가져오기(start,end값 계산)
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<ReserveVO> list = dao.selectReserveList(map);
		//pageNavi제작
		//총 개수
		int totalCount = dao.totalReserveCount();
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
			pageNavi += "<a href='/admin/reserveAdmin.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/admin/reserveAdmin.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
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
			pageNavi += "<a href='/admin/reserveAdmin.do?reqPage="+pageNo+"'>[다음]</a>";;
		}
		//System.out.println(pageNavi);
		ReserveVOPageData rpd = new ReserveVOPageData(list,pageNavi);
		return rpd;
	}
	
	public List<List<Map<Object, Object>>> getCanvasjsChartData(int campNo, int year) {
		return dao.getCanvasjsChartData(campNo,year);
	}

	public List<List<Map<Object, Object>>> getCanvasjsStickChartData() {
		return dao.getCanvasjsStickChartData();
	}
	
	public ArrayList<Integer> getNumList() {
		return dao.getNumList();
	}

	public ArrayList<String> nameList(ArrayList<Integer> numList) {
		return dao.getNameList(numList);
	}
}
