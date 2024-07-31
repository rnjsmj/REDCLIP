package com.kh.redclip.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.main.model.dao.MainMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	
	private final BarterMapper barterMapper;

	@Override
	public List<BarterVO> getRecentProducts() {
		return barterMapper.getRecentProducts();
	}

	@Override
	public List<BarterVO> getTopCount() {
		return barterMapper.getTopCount();
	}
	
}
