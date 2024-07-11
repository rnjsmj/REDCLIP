package com.kh.redclip.barter.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;

@Mapper
public interface BarterMapper {
	//전체목록 조회 (지역별 검색 가능)
	List<BarterVO> getAllBarters(Integer code);
	//상세보기
	BarterVO findById(int barterNo);
	//게시글 작성
	int insert (Barter barter);
	
	
	
	
	
	
	
	
	//댓글 목록
	List<BarterReply> getBarterReply(int barterNo);
	//댓글 작성
	int replyInsert(BarterReply baterReply);
	//댓글 수정
	int replyUpdate(BarterReply barterReply);
	//댓글 삭제
	int replyDelete(int replyNo);
	
	//게시글 조회수 증가
	int increaseHit(int barterNo);
	//하나의 답글
	BarterReply getBarterReplyById(int replyNo);
	//답글파일 입력
	int replyFileInsert(BarterReplyFile replyFile);
}
