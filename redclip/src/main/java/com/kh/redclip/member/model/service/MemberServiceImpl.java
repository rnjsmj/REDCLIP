package com.kh.redclip.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.redclip.member.model.dao.MemberMapper;
import com.kh.redclip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

	@Override
	public int idCheck(String userId) {
		return memberMapper.checkId(userId);
	}
	
	
	@Override
	public int nickCheck(String userNick) {
		return memberMapper.checkNick(userNick);
	}


	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(member);
	}

	@Override
	public int changeStatus(String userId) {
		return memberMapper.changeStatus(userId);
	}

	@Override
	public int delete(String userId) {
		return memberMapper.delete(userId);
	}

	@Override
	public int insertAdmin(Member member) {
		return memberMapper.insertAdmin(member);
	}

}
