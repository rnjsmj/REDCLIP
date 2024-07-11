package com.kh.redclip.barter.model.service;

import java.util.List;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface BarterService {


	List<BarterVO> getAllBarters(Integer code);
	BarterVO findById(int barterNo);
	int insert(Barter barter);

	
	
	
	
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
}
