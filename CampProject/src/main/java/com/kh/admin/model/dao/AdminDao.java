package com.kh.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.admin.model.vo.CanvasjsChartData;
import com.kh.admin.model.vo.CanvasjsStickChartData;
import com.kh.admin.model.vo.ChartBasicData;
import com.kh.camp.model.vo.CampVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveVO;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewCommentVO;

import oracle.net.aso.s;

@Repository
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<MemberVO> selectMemberList(HashMap<String, Integer> map) {
		List<MemberVO> list = sqlSession.selectList("selectMemberList",map);
		return (ArrayList<MemberVO>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("selectAllMemberCount");
	}

	public ArrayList<CampVO> selectBusinessList(HashMap<String, Integer> map) {
		List<CampVO> list = sqlSession.selectList("selectBusinessList",map);
		return (ArrayList<CampVO>)list;
	}

	public int totalBusinessCount() {
		return sqlSession.selectOne("selectAllBusinessCount");
	}

	public ArrayList<ReserveVO> selectReserveList(HashMap<String, Integer> map) {
		List<ReserveVO> list = sqlSession.selectList("selectReserveListAdmin",map);
		return (ArrayList<ReserveVO>)list;
	}

	public int totalReserveCount() {
		return sqlSession.selectOne("selectAllReserveCount");
	}

	public List<List<Map<Object, Object>>> getCanvasjsChartData(int campNo, int year) {
		ArrayList<String> monthArray = new ArrayList<String>();
		monthArray.add("01");
		monthArray.add("02");
		monthArray.add("03");
		monthArray.add("04");
		monthArray.add("05");
		monthArray.add("06");
		monthArray.add("07");
		monthArray.add("08");
		monthArray.add("09");
		monthArray.add("10");
		monthArray.add("11");
		monthArray.add("12");
		ArrayList<Integer> monthSales = new ArrayList<Integer>(monthArray.size());
		for(int i=0; i<monthArray.size(); i++) {
			HashMap<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("month", monthArray.get(i));
			tempMap.put("campNo", campNo);
			tempMap.put("year", year);
			List<ReserveVO> saleList = sqlSession.selectList("selectMonthSale",tempMap);
			if(saleList.size()!=0) {
				int monthSale=0;
				for(ReserveVO r : saleList) {
					//결제완료로 바뀌게 된다면 꼭 수정해야될 부분
					if(r.getReserveStatus().equals("결제완료")) {
					//if(r.getReserveStatus().equals("예약중")) {
						monthSale+=r.getReservePrice();
					}
				}
				monthSales.add(monthSale);
			}else {
				monthSales.add(0);
			}
		}
		return CanvasjsChartData.getCanvasjsDataList(monthArray, monthSales);
	}

	public List<List<Map<Object, Object>>> getCanvasjsStickChartData() {
		List<Integer> campNoList = sqlSession.selectList("selectReviewListNum");
		ArrayList<Float> reviewPointList = new ArrayList<Float>();
		ArrayList<String> campNameList = new ArrayList<String>();
		for(int i : campNoList) {
			Float reviewPoint = sqlSession.selectOne("selectReviewPointChart",i);
			reviewPointList.add(reviewPoint);
			String campName = sqlSession.selectOne("selectSalesListName", i);
			campNameList.add(campName);
		}
		return CanvasjsStickChartData.getCanvasjsDataList(campNameList, reviewPointList);
	}
	public ArrayList<Integer> getNumList() {
		List<Integer> numList = sqlSession.selectList("selectSalesListNum");
		return (ArrayList<Integer>)numList;
	}

	public ArrayList<String> getNameList(ArrayList<Integer> numList) {
		ArrayList<String> nameList = new ArrayList<String>();
		for(int i : numList) {
			String str = sqlSession.selectOne("selectSalesListName", i);
			nameList.add(str);
		}
		return nameList;
	}

	public List<List<Map<Object, Object>>> getCanvasjsStickChartData2() {
		List<Integer> campNoList = sqlSession.selectList("selectSalesListNum");
		//System.out.println("중복제거한 캠프 리스트수"+campNoList.size());
		ArrayList<Integer> salesList = new ArrayList<Integer>();
		ArrayList<String> campNameList = new ArrayList<String>();
		for(int i : campNoList) {
			//이 sql은 예약중으로 거르게 되어있어서 결제완료가 생성되면 바꿔야함
			//Integer로 받으면 null도 대처가 가능함
			Integer salesMoney = sqlSession.selectOne("selectSalesChart",i);
			if(salesMoney==null) {
				salesList.add(0);
			}else {
				salesList.add(salesMoney);
			}
			String campName = sqlSession.selectOne("selectSalesListName", i);
			campNameList.add(campName);
		}
		return CanvasjsStickChartData.getCanvasjsDataList2(campNameList, salesList);
	}

//	따로 변화하지 않으면 후기에서만 검색
	public ArrayList<ReviewCampVO> selectAdminAnswerList(int start, int end) {
	//public ArrayList<ReviewCampVO> selectAdminAnswerList(HashMap<String, Object> map) {
		//관리자가 댓글 단 글번호 리스트
		List<Integer> list = sqlSession.selectList("selectAdminAnswerReview");
		//System.out.println("관리자가 댓글 단 글번호 리스트"+list);
		//System.out.println("관리자가 댓글 단 글번호 리스트 크기"+list.size());
		if(list.size()!=0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("list", list);
			List<ReviewCampVO> resultList = sqlSession.selectList("selectAdminAnswerReviewList", map);
			//System.out.println("총 결과 사이즈 = "+resultList.size());
			return (ArrayList<ReviewCampVO>) resultList;
		}
		else {
			return null;
		}
	}

	public int totalAdminAnswerListCount() {
		List<Integer> reviewNoList = sqlSession.selectList("selectAdminAnswerReview");
		return reviewNoList.size();
	}

	public ArrayList<ReviewCampVO> selectAdminNotAnswerList(HashMap<String, Object> map) {
		//관리자가 댓글 단 글번호 리스트
		List<Integer> list = sqlSession.selectList("selectAdminAnswerReview");
		//System.out.println("관리자가 댓글 단 글번호 리스트"+list);
		//System.out.println("관리자가 댓글 단 글번호 리스트 크기"+list.size());
		map.put("list", list);
		List<ReviewCampVO> resultList = sqlSession.selectList("selectAdminNotAnswerReviewList", map);
		//System.out.println("총 결과 사이즈 = "+resultList.size());
		return (ArrayList<ReviewCampVO>) resultList;
	}

	public int totalAdminNotAnswerListCount() {
		int allCount = sqlSession.selectOne("selectReviewCount");
		List<Integer> reviewNoList = sqlSession.selectList("selectAdminAnswerReview");
		return allCount-reviewNoList.size();
	}

}
