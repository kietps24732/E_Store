package com.fpoly.ControllersAdmin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Entity.User;
import com.fpoly.Service.UserService;
import com.fpoly.Utils.HashPass;
@Controller
@RequestMapping("index/user")
public class Admin_User {
	
	@Autowired
	private UserService service;
	
	@Autowired
	HashPass hassPass;
	private Integer idUser;
	private String password;
	@GetMapping()
	public String viewTable (Model model) {
		
		model.addAttribute("list", service.findAllUser());
		
		return "Admin/tblUser";
	}
	
	@GetMapping("edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer idU) {
		
		User us = service.findByUserId(idU);
		idUser = us.getId();
		//hash lại mật khẩu
		password = us.getPassword();
		model.addAttribute("user", us);		
		return "Admin/editUser";
	}
	
	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("user") User us , BindingResult result) {
	
		us.setId(idUser);
		us.setPassword(password);
		service.addUser(us);
		return "Admin/editUser";
	}
	
	@PostMapping("/delete")
	public String delete(@ModelAttribute("user") User us) {	
		us.setId(idUser);
		us.setPassword(password);
		service.deleteUser(us);
		return "redirect:/index/user";
	}
	
	// Mặc định password = 123;
	@GetMapping("/create-user")
	public String createUser(@ModelAttribute("user") User us) {		
		 us.setPassword(hassPass.hash("123"));	
		 password = us.getPassword();
		return "Admin/editUser";
	}
}
