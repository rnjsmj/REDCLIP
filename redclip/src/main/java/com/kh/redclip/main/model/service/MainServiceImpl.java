package com.kh.redclip.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.main.model.dao.MainMapper;
import com.kh.redclip.member.model.dao.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	private final MainMapper mainMapper;

	@Override
	public List<BarterVO> getRecentProducts() {
		return mainMapper.getRecentProducts();
	}
	
}
