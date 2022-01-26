package com.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.RedirectView;

import com.www.dto.SanPhamDTO;
import com.www.entity.LoaiHang;
import com.www.entity.SanPham;
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

	@GetMapping("/socola-admin")
	public String getSanPhamByLoaiSocolaAdmin(Model model) {
		model.addAttribute("socola", sanPhamRepository.getSanPhamByLoaiSocola());
		return "/admin/danh-sach-socola";
	}

	@GetMapping("/keo-admin")
	public String getSanPhamByLoaiKeoAdmin(Model model) {
		model.addAttribute("keo", sanPhamRepository.getSanPhamByLoaiKeo());
		return "/admin/danh-sach-keo";
	}

	@GetMapping("/form-add-keo")
	public String getAddKeo() {
		return "/admin/form-add-keo";
	}

	@PostMapping(value = "/form-add-keo", consumes = "application/x-www-form-urlencoded")
	public RedirectView postAddKeo(SanPhamDTO sanPhamDTO, Model model, HttpServletRequest request) {

		SanPham sanPham = new SanPham();
		sanPham.setTenSanPham(sanPhamDTO.getTenSanPham());
		sanPham.setDonGia(sanPhamDTO.getDonGia());
		sanPham.setLoaiSanPham(LoaiHang.Kẹo);
		sanPham.setHinhAnh("/images/"+sanPhamDTO.getHinhAnh());
		sanPham.setMoTa(sanPhamDTO.getMoTa());
		sanPham.setSoLuong(sanPhamDTO.getSoLuong());

		sanPhamRepository.save(sanPham);

		return new RedirectView(request.getContextPath() + "/danhmuc/keo-admin");

	}

	@GetMapping("/form-add-socola")
	public String getAddSocola() {
		return "/admin/form-add-socola";
	}

	@PostMapping(value = "/form-add-socola", consumes = "application/x-www-form-urlencoded")
	public RedirectView postAddSocola(SanPhamDTO sanPhamDTO,HttpServletRequest request) {

		SanPham sanPham = new SanPham();
		sanPham.setTenSanPham(sanPhamDTO.getTenSanPham());
		sanPham.setDonGia(sanPhamDTO.getDonGia());
		sanPham.setLoaiSanPham(LoaiHang.Socola);
		sanPham.setHinhAnh("/images/"+sanPhamDTO.getHinhAnh());
		sanPham.setMoTa(sanPhamDTO.getMoTa());
		sanPham.setSoLuong(sanPhamDTO.getSoLuong());

		sanPhamRepository.save(sanPham);

		return new RedirectView(request.getContextPath() + "/danhmuc/socola-admin");

	}

	@RequestMapping(value = "deleteKeo/{id}", method = RequestMethod.GET)
	public String deleteKeo(@PathVariable("id") int id) {
		sanPhamRepository.deleteById(id);
		return "redirect:/danhmuc/keo-admin";
	}	
	
	@RequestMapping(value = "deleteSocola/{id}", method = RequestMethod.GET)
	public String deleteSocola(@PathVariable("id") int id) {
		sanPhamRepository.deleteById(id);
		return "redirect:/danhmuc/socola-admin";
	}

	@RequestMapping(value="/update/{id}")   
	public String getUpdateSanPham(@PathVariable int id, Model model){    
		SanPham sanPham = sanPhamRepository.findById(id).get();   
		model.addAttribute("sanPham",sanPham);
		return "admin/form-update-sanpham";
	}

	@RequestMapping(value="/saveUpdate",method = RequestMethod.POST)    
	public String saveUpdateSanPham(@ModelAttribute("sanPham") SanPham sanPham){
		sanPham.setHinhAnh("/images/"+sanPham.getHinhAnh());
		sanPhamRepository.save(sanPham);
		
		if(sanPham.getLoaiSanPham().toString().equals("Socola")) {
			return "redirect:/danhmuc/socola-admin";
		}
		
		return "redirect:/danhmuc/keo-admin";
	}  
}
