package com.kh.redclip.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;
import com.kh.redclip.member.model.vo.StatusMember;

@Mapper
public interface AdminMapper {

	List<ReportMember> findAll();

	List<Member> allMember();

	List<StatusMember> status();

	int reportCount(String userId);

	void changeMember(@Param("members") String[] members);

	void getMember(@Param("members") String[] members);

}
