package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	private final SqlSessionTemplate sqlSession;

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
	
	//게시글 수정
	@Override
	public int update(Barter barter) {
		return barterMapper.update(sqlSession, barter);
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
	
	/*
	 * public void replyListDelete(int barterNo) {
	 * barterMapper.replyListDelete(barterNo); }
	 */
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

	@Transactional
	@Override
	public int barterDelete(int barterNo, int fileExist) {
		try {
			
			if (fileExist != 0) {
				barterMapper.barterFileDelete(barterNo);
			}
			
			for ( BarterReply reply : getBarterReply(barterNo) ) {
				replyFileDelete(reply.getReplyNo());
			}
			
			barterMapper.replyListDelete(barterNo);
			barterMapper.barterDelete(barterNo);
			
			return 1;
			
			
		} catch (Exception e) {
			
			return 0;
		}
		
	}
	
	
	public int getBarterFileCount(int barterNo) {
		return barterMapper.getBarterFileCount(barterNo);
	}
	
	/*
	 * public void barterFileDelete(int barterNo) {
	 * barterMapper.barterFileDelete(barterNo);
	 * 
	 * }
	 */
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

	@Override
	public List<BarterVO> getFilteredBarters(Map<String, Object> params) {
		return barterMapper.getFilteredBarters(params);
	}

		
}
