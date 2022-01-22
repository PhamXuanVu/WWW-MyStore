package com.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.repository.SanPhamRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/danhmuc")
public class SanPhamController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@GetMapping("/keo")
	public String getSanPhamByLoaiKeo(Model model) {
		model.addAttribute("keo", sanPhamRepository.getSanPhamByLoaiKeo());
	    return "/danhmuc/keo";
	}
	
	@GetMapping("/socola")
	public String getSanPhamByLoaiSocola(Model model) {
		model.addAttribute("socola", sanPhamRepository.getSanPhamByLoaiSocola());
	    return "/danhmuc/socola";
	}
}
