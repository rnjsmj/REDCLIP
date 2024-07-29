package com.kh.redclip.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.redclip.admin.model.dao.AdminMapper;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;
import com.kh.redclip.member.model.vo.StatusMember;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminMapper adminMapper;

	@Override
	public List<ReportMember> findAll() {
		return adminMapper.findAll();
	}

	@Override
	public List<Member> allMember() {
		return adminMapper.allMember();
	}

	@Override
	public List<StatusMember> status() {
		return adminMapper.status();
	}

	@Override
	public int reportCount(String userId) {
		return adminMapper.reportCount(userId);
	}

	@Transactional
	@Override
	public int change(String[] members) {
		try {
			changeMember(members);
			getMember(members);
			
			return 1;
		} catch (Exception e) {
			return 0;
		} 
	}
	
	void changeMember(String[] members) {
		adminMapper.changeMember(members);
	}
	
	void getMember(String[] members) {
		adminMapper.getMember(members);
	}

	
	
	
}
