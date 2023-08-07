package com.fpoly.ControllersAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Entity.Category;
import com.fpoly.Service.CategoryService;

@Controller
@RequestMapping("index/category")
public class Admin_Category {
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping()
	public String viewTable (Model model) {
		
		model.addAttribute("list", categoryService.getAll());
		
		return "Admin/tblLoaihang";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(Model model,@ModelAttribute("category") Category category,@PathVariable("id") String idCategory) {
		
		category =	categoryService.getByCate(category.getId());
		
		model.addAttribute("category", category);
		return "Admin/editLoaiHang";
	}
	
	@PostMapping("/save")
	public String save(@ModelAttribute("category") Category category) {
		categoryService.saveCate(category);
		
		return "redirect:/index/category";
	}
	
	@PostMapping("/delete")
	public String del(@ModelAttribute("category") Category category) {
		
		categoryService.delCate(category.getId());
		
		return "redirect:/index/category";
	}
	
	@GetMapping("/create-new")
	public String createNew(@ModelAttribute("category") Category category) {
		
		return "Admin/editLoaiHang";
	}
	
}
