package com.kh.redclip.barter.model.service;

import java.util.List;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterReply;
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
	//댓글 삭제
	int replyDelete(int barterNo);
	
}
