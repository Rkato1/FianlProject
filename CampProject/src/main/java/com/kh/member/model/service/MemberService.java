package com.kh.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.used.vo.UsedMessageChatVO;
import com.kh.camp.used.vo.UsedMessageVO;
import com.kh.camp.used.vo.UsedVO;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.MemberVO;
import com.kh.reserve.model.vo.ReserveCampVO;
import com.kh.reserve.model.vo.ReserveVO;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		return dao.selectOneMember(m);
	}

	public MemberVO selectOneMemberId(MemberVO m) {
		return dao.selectOneMemberId(m);
	}

	public MemberVO selectOneMemberPw(MemberVO m) {
		return dao.selectOneMemberPw(m);
	}
	
	public int insertMember(MemberVO m) {
		return dao.insertMember(m);
	}

	public MemberVO mypageMember(int memberNo) {
		return dao.mypageMember(memberNo);
	}
	
	public int cntReserve(int memberNo) {
		return dao.cntReserve(memberNo);
	}
	
	public int cntReview(String memberId) {
		return dao.cntReview(memberId);
	}

	public int cntUsedTrade(String memberId) {
		return dao.cntUsedTrade(memberId);
	}
	
	public ArrayList<ReserveCampVO> mypageReserve(int memberNo) {
		return dao.mypageReserve(memberNo);
	}
	
	public ArrayList<ReviewCampVO> mypageReview(String memberId) {
		return dao.mypageReview(memberId);
	}
	
	public ArrayList<UsedVO> mypageUsedTrade(String memberId) {
		return dao.mypageUsedTrade(memberId);
	}
	
	public String selectChangePw(int memberNo) {
		return dao.selectChangePw(memberNo);
	}

	public int updateMemberPw(MemberVO m) {
		return dao.updateMemberPw(m);
	}

	public int updateMember(MemberVO m) {
		return dao.updateMember(m);
	}

	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}
	
}
