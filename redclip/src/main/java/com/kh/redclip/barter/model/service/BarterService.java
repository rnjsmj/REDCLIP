package com.kh.redclip.barter.model.service;

import java.util.List;

import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface BarterService {

	public List<Barter> getAllBarters();
	
	
	public BarterVO findById(int barterNo);

}
