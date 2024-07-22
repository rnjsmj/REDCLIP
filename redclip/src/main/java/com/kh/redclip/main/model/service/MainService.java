package com.kh.redclip.main.model.service;

import java.util.List;
import com.kh.redclip.barter.model.vo.BarterVO;

public interface MainService {
    List<BarterVO> getRecentProducts();
}
