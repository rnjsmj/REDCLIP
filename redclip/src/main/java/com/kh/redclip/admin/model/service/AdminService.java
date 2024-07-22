package com.kh.redclip.admin.model.service;

import java.util.List;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;

public interface AdminService {

	List<ReportMember> findAll();

	List<Member> allMember();

	List<Member> status();
	
	int reportCount(String userId);

}
