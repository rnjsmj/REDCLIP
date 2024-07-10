package com.kh.redclip.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.redclip.member.model.dao.MemberMapper;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

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
	public List<Region> selectgu(int cityCode) {
		return memberMapper.selectgu(cityCode);
	}


	@Override
	public List<Region> selectdong(int townCode) {
		return memberMapper.selectdong(townCode);
	}


	@Override
	public int insert(Member member) {
		return memberMapper.insertMember(member);
	}

}
