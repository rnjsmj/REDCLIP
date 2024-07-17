package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.barter.model.vo.Wishlist;
import com.kh.redclip.member.model.vo.ReportMember;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BarterServiceImpl implements BarterService{

	private final BarterMapper barterMapper;
	
	

	@Override
	public List<BarterVO> getAllBarters(Integer code) {
		return barterMapper.getAllBarters(code);
	}
	
	@Override
	public BarterVO findById(int barterNo) {
		return barterMapper.findById(barterNo);
	}

	@Override
	public int insert(Barter barter) {
		return barterMapper.insert(barter);
	}

	@Override
	public int barterInsert(BarterFile barterFile) {
		return barterMapper.barterInsert(barterFile);
	}
	

	@Override
	public List<BarterVO> getFilteredBarters(String categoryNo, String si, String gu, String dong) {
		return barterMapper.getFilteredBarters(categoryNo, si, gu, dong);
	}
	
	@Override
	public List<BarterReply> getBarterReply(int barterNo) {
		return barterMapper.getBarterReply(barterNo);
	}
	@Override
	public int replyInsert(BarterReply baterReply) {
		return barterMapper.replyInsert(baterReply);
	}

	@Override
	public int replyUpdate(BarterReply barterReply) {
		return barterMapper.replyUpdate(barterReply);
	}

	@Override
	public int replyDelete(int replyNo) {
		return barterMapper.replyDelete(replyNo);
	}
	
	@Override
	public int increaseHit(int barterNo) {
		return barterMapper.increaseHit(barterNo);
	}
	
	@Override
	public BarterReply getBarterReplyById(int replyNo) {
		return barterMapper.getBarterReplyById(replyNo);
	}
	
	@Override
	public int replyFileInsert(BarterReplyFile replyFile) {
		return barterMapper.replyFileInsert(replyFile);
	}

	@Override
	public int barterDelete(int barterNo) {
		int replyCount = barterMapper.replyCount(barterNo);
		if (barterMapper.replyListDelete(barterNo) == replyCount) {
			return barterMapper.barterDelete(barterNo);
		}
		return 0;
		
	}
	
	@Override
	public int getBarterFileCount(int barterNo) {
		
		return barterMapper.getBarterFileCount(barterNo);
	}
	
	@Override
	public int barterFileDelete(int barterNo) {
		return barterMapper.barterFileDelete(barterNo);
		
	}
	@Override
	public int replyFileDelete(int replyNo) {
		return barterMapper.replyFileDelete(replyNo);
	}
	
	// 좋아요 상태 확인
	@Override
	public Wishlist wishStatus(Wishlist wish) {
		return barterMapper.wishStatus(wish);
	}

	@Override
	public int wishInsert(Wishlist wish) {
		return barterMapper.wishInsert(wish);
	}

	@Override
	public int wishDelete(Wishlist wish) {
		return barterMapper.wishDelete(wish);
	}

	@Override
	public int barterReport(ReportMember report) {
		return barterMapper.barterReport(report);
	}

	
	
	
}
