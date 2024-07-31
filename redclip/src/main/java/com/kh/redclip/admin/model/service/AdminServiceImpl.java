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
	public int reportCount(String reportedId) {
		return adminMapper.reportCount(reportedId);
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

	@Transactional
	@Override
	public int deleteMember(String[] members) {
		try {
			getMember(members);
			dropMember(members);
			
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	void dropMember(String[] members) {
		adminMapper.dropMember(members);
	}


	@Override
	public ReportMember ReportDetail(ReportMember report) {
		
		return adminMapper.getReportDetail(report);
		
	}
	
	
	
	@Override
	public ReportMember getDetail(int reportNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReport(int reportNo) {
		return adminMapper.deleteReport(reportNo);
	}
	
	
	
	
	
	
}
