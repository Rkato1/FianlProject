package com.kh.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}

	public List<List<Map<Object, Object>>> getCanvasjsStickChartData() {
		return CanvasjsStickChartData.getCanvasjsDataList();
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
