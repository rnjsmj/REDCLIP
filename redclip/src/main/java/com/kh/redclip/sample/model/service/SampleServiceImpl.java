package com.kh.redclip.sample.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.sample.model.dao.SampleMapper;
import com.kh.redclip.sample.model.vo.Sample;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SampleServiceImpl implements SampleService {

	private final SampleMapper sampleMapper;
	
	@Override
	public List<Sample> findAll() {
		return sampleMapper.findAll();
	}

	@Override
	public Sample findById(int sampleNo) {
		return sampleMapper.findById(sampleNo);
	}

}
