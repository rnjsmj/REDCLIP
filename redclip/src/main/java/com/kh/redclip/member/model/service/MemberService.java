package com.kh.redclip.member.model.service;

import com.kh.redclip.member.model.vo.Member;

public interface MemberService {
	int idCheck(String userId);
	
	int nickCheck(String userNick);

	Member login(Member member);
}
