package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;

import com.kh.redclip.barter.model.repository.BarterRepository;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BarterServiceImpl implements BarterService{

	private final BarterMapper barterMapper;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<BarterVO> getAllBarters(Map<String, Integer> map) {
		return barterMapper.getAllBarters(map);
	}

	@Override
	public BarterVO findById(int barterNo) {
		return barterMapper.findById(barterNo);
	}

	@Override
	public int insert(Barter barter) {
		return BarterRepository.insert(sqlSession,barter);
	}

	
}
