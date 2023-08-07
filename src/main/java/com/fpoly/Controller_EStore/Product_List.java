package com.fpoly.Controller_EStore;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Product;
import com.fpoly.Repository.ProductDAO;
import com.fpoly.Service.HomeService;
import com.fpoly.Service.ProductService;
import com.fpoly.Utils.SessionService;


@Controller
public class Product_List {
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	ProductService productService;
	@Autowired
	HomeService serviceHome;
	
	@GetMapping("/product-list")
	public String productDetail (Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		// lấy tất cả sản phẩm
		Page<Product> page  = productService.findAlls(pageable);
		model.addAttribute("page", page);
		model.addAttribute("listFeatured", serviceHome.getProductDataFavorite());
		return "User/product-list";
	}
	
	@GetMapping("/product-list/search")
	public String search(@RequestParam("search") Optional<String> keyS, Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findAllByNameLike("%"+keyS.orElse("")+"%", pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/bitits")
	public String search1( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findAllByBitits(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/jordan")
	public String search2( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findAllByJordan(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/adidas")
	public String search3( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findAllByAdidas(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/price050")
	public String searchprice1( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findByPrice050(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/price5110")
	public String searchprice2( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findByPrice5110(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	@GetMapping("/product-list/search/price1150")
	public String searchprice3( Model model,@RequestParam("page") Optional<Integer> page) {
	
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<Product> pages = dao.findByPrice1150(pageable);
		model.addAttribute("page", pages);
		return"User/product-list";
	}
	
//	@GetMapping("/product-list-search")
//	public String searchByName (Model model, @RequestParam("serchByName") String name) {
//		// lấy sản phẩm có tên
//		System.out.println(name);
//		List<Product> list  = productService.searchByname(name);
//		model.addAttribute("list", list);
//		return "User/product-list";
//	}

}
