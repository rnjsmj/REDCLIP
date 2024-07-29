package com.kh.redclip.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;

@Mapper
public interface AdminMapper {

	List<ReportMember> findAll();

	List<Member> allMember();

	List<Member> status();

}
