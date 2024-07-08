package com.kh.redclip.barter.model.service;

import java.util.List;
import com.kh.redclip.barter.model.vo.Barter;

public interface BarterService {
    List<Barter> getAllBarters();

	Barter getBarterByNo(int no);
}
