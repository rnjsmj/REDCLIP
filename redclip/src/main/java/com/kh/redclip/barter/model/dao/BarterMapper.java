package com.kh.redclip.barter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.barter.model.vo.BarterVO;

@Mapper
public interface BarterMapper {
	
	List<BarterVO> getAllBarters(Map<String, Integer> map);
	
	BarterVO findById(int barterNo);
	
	
}
