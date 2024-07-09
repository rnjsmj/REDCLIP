package com.kh.redclip.barter.model.service;

import java.util.List;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface BarterService {


	List<Barter> getAllBarters();
	BarterVO findById(int barterNo);
	int insert(Barter barter);

}
