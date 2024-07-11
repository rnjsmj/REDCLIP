package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterVO;

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
	
}
