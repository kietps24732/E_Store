package com.fpoly.ControllersAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.Entity.Product;
import com.fpoly.Repository.ProductDAO;
import com.fpoly.Service.FavoriteService;

@Controller
public class Admin_ThongKeProduct {

	@Autowired
	FavoriteService service;
	@Autowired
	ProductDAO dao;
	@GetMapping("index/favotite")
	public String viewFavorite(Model model) {
		List<Object[]> list = service.getAllFavoriteProductDataUser();
		model.addAttribute("list", list);
		return "Admin/tblFavoriteProduct";
	}
	
	@GetMapping("index/inventory")
	public String inventory(Model model) {
		List<Product> list = dao.findProductInventory();
		model.addAttribute("listInventory", list);
		return "Admin/tblInventory";
	}
	
}
