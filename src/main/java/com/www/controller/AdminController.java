package com.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.www.repository.HoaDonRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@GetMapping(value = {"", "/"})
    public String getDashboard() {
        return "admin/index";
    }
	
	@GetMapping("/hoadon")
	public String getHoaDon(Model model) {
		model.addAttribute("hoaDon",hoaDonRepository.findAll());
		return "admin/hoa-don";
	}
	
}
