package com.kh.redclip.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.member.model.vo.Member;

@Mapper
public interface MemberMapper {

		//회원정보 수정
		public int update(Member member); 
		
		//회원상태 업데이트(탈퇴)
		public int changeStatus(String userId);

		//회원 삭제
		public int delete(String userId);
		
		//관리자 계정 생성
		public int insertAdmin(Member member);
		
		// 내가 쓴 글 조회
		// 차단한 회원 조회
		// 신고 내역 조회 
		//회원 아이디 검색
		//누적 신고 횟수 조회
}
