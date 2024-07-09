package com.kh.redclip.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.redclip.member.model.dao.MemberMapper;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	private final MemberMapper memberMapper;
	@Override
	public int idCheck(String userId) {
		return memberMapper.checkId(userId);
	}
}
