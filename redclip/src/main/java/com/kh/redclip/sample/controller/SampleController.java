package com.kh.redclip.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.sample.model.service.SampleService;
import com.kh.redclip.sample.model.vo.Sample;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("sample")
@RequiredArgsConstructor
public class SampleController {
	
	private final SampleService sampleService;
	
	@GetMapping
	public String findAll(Model model) {
		
		List<Sample> sampleList = sampleService.findAll();
		
		model.addAttribute("list", sampleList);
		return "sample/list";
  }
	
	@GetMapping("/{id}")
	public String findById() {
		
		return "sample/list";
		
		adasdas
	}
	
}
