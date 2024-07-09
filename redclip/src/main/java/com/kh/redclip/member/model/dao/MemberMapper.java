package com.kh.redclip.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.member.model.vo.Member;

@Mapper
public interface MemberMapper {
    int checkId(String userId);

	int checkNick(String userNick);

	Member login(Member member);
}
