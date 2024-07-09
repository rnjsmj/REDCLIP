package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface BarterService {


	List<BarterVO> getAllBarters(Integer code);
	BarterVO findById(int barterNo);
	int insert(Barter barter);

}
