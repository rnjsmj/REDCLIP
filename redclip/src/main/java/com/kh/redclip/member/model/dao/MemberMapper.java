package com.kh.redclip.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

@Mapper
public interface MemberMapper {
    int checkId(String userId);

	int checkNick(String userNick);

	Member login(Member member);

	List<Region> selectgu(int cityCode);
	
	List<Region> selectdong(int townCode);

	int insertMember(Member member);


	
}
