package com.kh.redclip.barter.model.service;

import java.util.List;
import java.util.Map;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface BarterService {


  List<BarterVO> getAllBarters(Map<String, Integer> map);
	
  BarterVO findById(int barterNo);

}
