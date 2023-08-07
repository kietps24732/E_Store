package com.fpoly.ControllersAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Repository.ProductDAO;

@Controller
@RequestMapping("/index/selling")
public class Admin_Selling {

	@Autowired
	ProductDAO dao;
	
	@GetMapping()
	public String bestSelling(Model model) {
		List<Object> list = dao.sortListSelling();
		model.addAttribute("list", list);
		return "Admin/tblBestSelling";
	}
}
