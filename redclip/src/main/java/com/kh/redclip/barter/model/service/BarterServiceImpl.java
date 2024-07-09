package com.kh.redclip.barter.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BarterServiceImpl implements BarterService{

	private final BarterMapper barterMapper;
	
	@Override
	public List<Barter> getAllBarters() {
		return null;
	}

	@Override
	public BarterVO findById(int barterNo) {
		return barterMapper.findById(barterNo);
	}

	
}
