package com.kh.redclip.main.model.dao;

import java.util.List;
import com.kh.redclip.barter.model.vo.BarterVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {
    List<BarterVO> getRecentProducts();
}
