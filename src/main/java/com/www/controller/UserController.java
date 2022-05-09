package com.www.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.RedirectView;

import com.www.dto.NguoiDungDTO;
import com.www.entity.NguoiDung;
import com.www.entity.Role;
import com.www.entity.User;
import com.www.repository.NguoiDungRepository;
import com.www.repository.RoleRepository;
import com.www.repository.UserRepository;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("/user")
public class UserController {
	@Autowired
	private NguoiDungRepository nguoiDungRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String login() {	
	    return "login";
	}
	
	@GetMapping("/register")
	public String register() {	
	    return "register";
	}
	
	@PostMapping(value = "/register", consumes = "application/x-www-form-urlencoded")
    public RedirectView postRegister(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
                Role role = roleRepository.findByName("ROLE_MEMBER");

                User user = new User();
                Set<Role> roles = new HashSet<>();
                roles.add(role);
                user.setRoles(roles);
                user.setEmail(nguoiDungDTO.getEmail());
                user.setPassword(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(user);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setUser(user);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/login?success");
            }

            return new RedirectView(request.getContextPath() + "/user/register?failure");
    }
	
	@GetMapping("/nguoi-dung-admin")
	public String getNguoiMua(Model model) {
		model.addAttribute("nguoiDungAdmin",nguoiDungRepository.findByRoleMember());
		return "/admin/danh-sach-nguoi-dung";
	}
	
	@GetMapping("/form-add-nguoi-dung")
	public String formAddNguoiDung() {
	    return "/admin/form-add-nguoi-dung";
	}
	
	@PostMapping(value = "/form-add-nguoi-dung", consumes = "application/x-www-form-urlencoded")
    public RedirectView postAddNguoiDung(NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
            if (userRepository.findByEmail(nguoiDungDTO.getEmail()) == null) {
            	Role role = roleRepository.findByName("ROLE_MEMBER");

                User user = new User();
                Set<Role> roles = new HashSet<>();
                roles.add(role);
                user.setRoles(roles);
                user.setEmail(nguoiDungDTO.getEmail());
                user.setPassword(passwordEncoder.encode(nguoiDungDTO.getMatKhau()));
         
                userRepository.save(user);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setUser(user);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/nguoi-dung-admin?addSuccess=true");
            }

            return new RedirectView(request.getContextPath() + "/user/form-add-nguoi-dung?failure=true");
    }
	
	@GetMapping("/form-update-nguoi-dung/{id}")
	public String updateNguoiDung(@PathVariable int id,Model model) {
		model.addAttribute("nguoiDungAdmin",nguoiDungRepository.findById(id));
	    return "/admin/form-update-nguoi-dung";
	}
	
	@PostMapping(value = "/form-update-nguoi-dung/{id}", consumes = "application/x-www-form-urlencoded")
    public RedirectView postUpdateNguoiDung(@PathVariable int id,NguoiDungDTO nguoiDungDTO, BindingResult bindingResult, Model model, HttpServletRequest request) {
				
                NguoiDung nguoiDung = nguoiDungRepository.findById(id);
                nguoiDung.setHoTenDem(nguoiDungDTO.getHoTenDem());
                nguoiDung.setTen(nguoiDungDTO.getTen());
                nguoiDung.setSoDienThoai(nguoiDungDTO.getSoDienThoai());
                nguoiDung.setDiaChi(nguoiDungDTO.getDiaChi());
                nguoiDungRepository.save(nguoiDung);
                return new RedirectView(request.getContextPath() + "/user/nguoi-dung-admin?updateSuccess=true");
	}
	
	@RequestMapping(value = "deleteNguoiDung/{id}", method = RequestMethod.GET)
	public String deleteNguoiDung(@PathVariable int id) {
		nguoiDungRepository.delete(nguoiDungRepository.findById(id));
		return "redirect:/user/nguoi-dung-admin?deleteSuccess=true";
	}
}
