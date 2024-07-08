package com.kh.redclip.member.model.service;

import com.kh.redclip.member.model.vo.Member;

public interface MemberService {

	//회원정보 수정
	public int update(String member);
	
	//회원상태 업데이트(탈퇴)
	public int changeStatus(String userId);

	//회원 삭제
	public int delete(String userId);
	
	//관리자 계정 생성
	public int insertAdmin(Member member);
}
