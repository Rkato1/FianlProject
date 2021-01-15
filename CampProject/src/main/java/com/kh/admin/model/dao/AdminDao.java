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
		List<ReserveVO> list = sqlSession.selectList("selectReserveList",map);
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
					//예약완료로 바뀌게 된다면 꼭 수정해야될 부분
					if(r.getReserveStatus().equals("예약중")) {
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
}
