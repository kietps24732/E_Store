package com.fpoly.Controller_EStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpoly.Entity.User;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Service.FavoriteService;
import com.fpoly.Service.HomeService;
import com.fpoly.Service.UserService;
import com.fpoly.Utils.CookieService;

@Controller
public class Wish_List {

	@Autowired
	FavoriteService ServiceF;

	@Autowired
	CookieService cookie;

	@Autowired
	UserService userService;
	
	@Autowired
	UserDAO Udao;

	@Autowired
	CookieService cookieService;

	@Autowired
	HomeService serviceHome;
	
	
	@GetMapping("/wish-list")
	public String wishList(Model model) {
		// lấy tên username trong cookie

		String userName = cookieService.getValue("uName");
		if(!userName.equals("")) {
			User us = Udao.findByUserName(userName);
			model.addAttribute("count", serviceHome.getCountFavorite(us.getId()));
			// set username trong findUser để lấy ra user
			List<Object[]> list = ServiceF.getAllProductDataFavorite(us.getId());
			model.addAttribute("list", list);
		}else {
			return "redirect:/login";
		}
		return "User/wishList";
	}

	@GetMapping("/wish-list/{id}")
	public String delete(@PathVariable("id") Integer id) {
		ServiceF.delFavorite(id);
		return "redirect:/wish-list";
	}
}
