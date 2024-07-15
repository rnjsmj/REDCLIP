package com.kh.redclip.member.model.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;


import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.member.model.vo.BlockMember;

import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

public interface MemberService {

	int idCheck(String userId);
	
	int nickCheck(String userNick);

	Member login(Member member);

	//회원정보 수정
	public int update(Member member);
	
	//회원상태 업데이트(탈퇴)
	public int changeStatus(String userId);

	//회원 삭제
	public int delete(String userId);
	
	//관리자 계정 생성
	public int insertAdmin(Member member);
	
	// 내가 쓴 글 조회
	public List<Barter> selectById(String userId);
	
	// 차단한 회원 조회
	List<BlockMember> selectByBlock(String userId);
	
	//차단 해제
	int deleteByBlock(String usreId);
	// 신고 내역 조회 
	//회원 아이디 검색
	//누적 신고 횟수 조회



	List<Region> selectgu(int cityCode);

	List<Region> selectdong(int townCode);

	int insert(Member member);
	
	//아이디찾기
	public String searchid(Member member);

	//api 로그인 토큰 
	String getToken(String code) throws  IOException, ParseException;

	void kakaoLogout(String accessToken) throws IOException;

	void getUserInfo(String accessToken);

	int searchPw(Member member);




}
