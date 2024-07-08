package com.kh.redclip.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    int checkId(String userId);

	int checkNick(String userNick);
}
