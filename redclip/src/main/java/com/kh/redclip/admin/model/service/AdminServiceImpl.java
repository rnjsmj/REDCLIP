package com.kh.redclip.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.admin.model.dao.AdminMapper;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;

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
	public List<Member> status() {
		return adminMapper.status();
	}

	
}
