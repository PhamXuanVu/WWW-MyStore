package com.www.controller;

import com.www.entity.*;
import com.www.repository.ChiTietHoaDonRepository;
import com.www.repository.HoaDonRepository;
import com.www.repository.NguoiDungRepository;
import com.www.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/hoaDon")
public class HoaDonControler {
	@Autowired
	private NguoiDungRepository nguoiDungRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private HoaDonRepository hoaDonRepository;

	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;

	@RequestMapping("/add")
	public String getAddHoaDon(HttpSession session) {
		try {
			HoaDon hoaDon = new HoaDon();
			hoaDon = (HoaDon) session.getAttribute("cart");
			
			HoaDon hoaDon2 = new HoaDon();
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User user = userRepository.findByEmail(authentication.getName());
			NguoiDung nguoiDung = nguoiDungRepository.findByUser(user);
			hoaDon2.setNgayMua(new Date());
			hoaDon2.setNguoiDung(nguoiDung);
			hoaDonRepository.save(hoaDon2);
			List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
			ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
			chiTietHoaDon.setHoaDon(hoaDon2);
			
//			List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
//			ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
//			chiTietHoaDon.set
			
//			chiTietHoaDonRepository.saveAll(chiTietHoaDons);
			System.out.println("BBB" + hoaDon2);
			
//			HoaDon hoaDon1 = new HoaDon();
//			hoaDon1.setNgayMua(new Date());
//
			
//			hoaDon1.setNguoiDung(nguoiDung);
//			hoaDon1.setSanPhams(chiTietHoaDons);
//			hoaDonRepository.save(hoaDon1);
			return "redirect:/gioHang/thanhToan?success=true";
		}catch (Exception e) {
			e.printStackTrace();

			return "redirect:/gioHang/thanhToan?failure=true";
		}

	}
}
