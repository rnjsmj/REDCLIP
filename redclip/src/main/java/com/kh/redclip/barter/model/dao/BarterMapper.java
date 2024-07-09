package com.kh.redclip.barter.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.barter.model.vo.BarterVO;

@Mapper
public interface BarterMapper {

	BarterVO findById(int barterNo);
	
	
}
