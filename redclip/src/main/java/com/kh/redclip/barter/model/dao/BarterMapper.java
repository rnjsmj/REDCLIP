package com.kh.redclip.barter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.barter.model.vo.Wishlist;
import com.kh.redclip.member.model.vo.ReportMember;

@Mapper
public interface BarterMapper {
	//전체목록 조회 (지역별 검색 가능)
	List<BarterVO> getAllBarters(Integer code);
	//상세보기
	BarterVO findById(int barterNo);
	//게시글 작성
	int insert (Barter barter);
	//게시글 등록
	int barterInsert(BarterFile barterFile);
	//검색 조회
	List<BarterVO> getFilteredBarters(Map<String, Object> params);
	//게시글 수정
	public int update(SqlSessionTemplate sqlSession, Barter barter);
	
	
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
	

	//게시글 삭제
	int barterDelete(int barterNo);
	//게시글에 포함된 파일 갯수
	int getBarterFileCount(int barterNo);
	//게시글에 포함된 파일 삭제
	int barterFileDelete(int barterNo);
	
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
	// 게시글에 포함된 답글 개수
	int replyCount(int barterNo);
	// 게시글에 포함된 답글 삭제
	int replyListDelete(int barterNo);
	
	//메인화면 목록출력
	List<BarterVO> getRecentProducts();
	List<BarterVO> getTopCount();
	List<BarterVO> getTopBarters(int barterNo);
	
	
	
}
