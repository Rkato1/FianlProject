package com.kh.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.review.model.vo.ReviewCampVO;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO selectOneMember(MemberVO m) {
		return sqlSession.selectOne("member.selectOneMember", m);
	}

	public MemberVO selectOneMemberId(MemberVO m) {
		return sqlSession.selectOne("member.selectOneMemberId", m);
	}
	
	public MemberVO selectOneMemberPw(MemberVO m) {
		return sqlSession.selectOne("member.selectOneMemberPw", m);
	}
	
	public int insertMember(MemberVO m) {
		return sqlSession.insert("member.insertMember", m);
	}

	public MemberVO mypageMember(int memberNo) {
		return sqlSession.selectOne("member.mypageMember", memberNo);
	}
	
	public int cntReserve(int memberNo) {
		return sqlSession.selectOne("member.cntReserve", memberNo);
	}
	
	public int cntReview(String memberId) {
		return sqlSession.selectOne("member.cntReview", memberId);
	}

	public int cntUsedTrade(String memberId) {
		return sqlSession.selectOne("member.cntUsedTrade", memberId);
	}
	
	public ArrayList<ReserveCampVO> mypageReserve(int memberNo) {
		List<ReserveCampVO> list = sqlSession.selectList("member.mypageReserve", memberNo);
		return (ArrayList<ReserveCampVO>)list;
	}
	
	public ArrayList<ReviewCampVO> mypageReview(String memberId) {
		List<ReviewCampVO> list = sqlSession.selectList("member.mypageReview", memberId);
		return (ArrayList<ReviewCampVO>)list;
	}
	
	public ArrayList<UsedVO> mypageUsedTrade(String memberId) {
		List<UsedVO> list = sqlSession.selectList("member.mypageUsedTrade", memberId);
		return (ArrayList<UsedVO>)list;
	}
	
	public String selectChangePw(int memberNo) {
		return sqlSession.selectOne("member.selectChangePw", memberNo);
	}

	public int updateMemberPw(MemberVO m) {
		return sqlSession.update("member.updateMemberPw", m);
	}

	public int updateMember(MemberVO m) {
		return sqlSession.update("member.updateMember", m);
	}
	
	public int deleteMember(int memberNo) {
		return sqlSession.delete("member.deleteMember", memberNo);
	}

}
