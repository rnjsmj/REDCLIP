package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.barter.model.vo.Wishlist;
import com.kh.redclip.member.model.vo.ReportMember;

public interface BarterService {


	List<BarterVO> getAllBarters(Integer code);
	BarterVO findById(int barterNo);
	int insert(Barter barter);
	int barterInsert(BarterFile barterfile);
	List<BarterVO> getFilteredBarters(Map<String, Object> params);
	//게시글 수정
	int update(Barter barter);
	
	//댓글 목록
	List<BarterReply> getBarterReply(int barterNo);
	//댓글 작성
	int replyInsert(BarterReply baterReply);
	//댓글 수정
	int replyUpdate(BarterReply barterReply);
	//댓글 삭제s
	int replyDelete(int replyNo);
	//게시글 조회수 증가
	int increaseHit(int barterNo);
	//하나의 답글 select
	BarterReply getBarterReplyById(int replyNo);
	// 답글 파일 등록
	int replyFileInsert(BarterReplyFile replyFile);

	//게시글 삭제
	int barterDelete(int barterNo, int fileExist);
	//게시글에 포함된 파일 갯수
	int getBarterFileCount(int barterNo);
	//게시글에 포함된 파일 삭제
//	int barterFileDelete(int barterNo);
	
	//답글에 포함된 파일 삭제
	int replyFileDelete(int replyNo);
	
	// 좋아요 상태 확인
	Wishlist wishStatus(Wishlist wish);
	// 좋아요 등록
	int wishInsert(Wishlist wish);
	// 좋아요 해제
	int wishDelete(Wishlist wish);
	//게시글 신고
	int barterReport(ReportMember report);
	//위시 목록 조회
	
	
	

	
}
