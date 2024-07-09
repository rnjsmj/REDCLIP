package com.kh.redclip.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

public interface MemberService {
	int idCheck(String userId);
	
	int nickCheck(String userNick);

	Member login(Member member);



	List<Region> selectgu(int cityCode);

	List<Region> selectdong(int townCode);

	int insert(Member member);
}
