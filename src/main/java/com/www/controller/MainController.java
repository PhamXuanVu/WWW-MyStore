package com.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.entity.LoaiHang;
import com.www.entity.NguoiDung;
import com.www.entity.SanPham;
import com.www.repository.SanPhamRepository;

@Controller
@Transactional
@EnableWebMvc
public class MainController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@GetMapping("/")
	public String hi(Model model) {
		model.addAttribute("sanPham", sanPhamRepository.findAll());
	    return "index";
	}
	
	@RequestMapping(value="/chiTietSP/{id}")   
	public String showProductDetail(@PathVariable int id, Model model){    
		SanPham sanPham = sanPhamRepository.findById(id).get();   
		model.addAttribute("sanPham",sanPham);
		return "chi-tiet-sp";
	}
}
