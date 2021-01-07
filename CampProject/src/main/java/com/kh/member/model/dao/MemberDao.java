package com.kh.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.member.model.vo.MemberVO;

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

	public int updateMember(MemberVO m) {
		return sqlSession.update("member.updateMember", m);
	}
	
	public int deleteMember(int memberNo) {
		return sqlSession.delete("member.deleteMember", memberNo);
	}

}
