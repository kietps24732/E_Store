package com.fpoly.Controller_EStore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.Entity.Product;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Repository.ProductDAO;
import com.fpoly.Repository.ProductDetailDAO;
import com.fpoly.Repository.ProductImgDAO;
import com.fpoly.Service.AddToCartService;
import com.fpoly.Utils.CookieService;



@Controller
public class Product_Detail {
	
	@Autowired
	ProductDetailDAO PDdao;
	
	@Autowired
	ProductDAO Pdao;
	@Autowired
	FavoriteDAO Fdao;
	@Autowired
	ProductImgDAO imgDAO;
	@Autowired
	HttpServletRequest request;
	@Autowired
	CookieService cookieService;
	
	@Autowired
	AddToCartService addToCartService;
	
	public static Integer idP;
	
	@GetMapping("/product-detail")
	public String productDetail (Model model,@RequestParam(value = "id") Integer IdProudct) {
		idP = IdProudct;
		model.addAttribute("review", Fdao.getReview(IdProudct));
		model.addAttribute("productDetailImg", PDdao.findProductDetailImg(IdProudct));
		model.addAttribute("productAllImg", imgDAO.getAllImgProduct(IdProudct));
		model.addAttribute("productDetail", Pdao.getReferenceById(IdProudct));
		model.addAttribute("productColor", PDdao.getColorDetail(IdProudct));
		model.addAttribute("productSize", PDdao.getSize(IdProudct));
		model.addAttribute("countCart", addToCartService.getCount());
		Product product = Pdao.getReferenceById(IdProudct);
		model.addAttribute("brand", Pdao.findProductDataTop6Brand(product.getBrand()));
		return "User/Product_Detail";
	}

	
	
//	@ResponseBody
//	@GetMapping("/shop-carts")
//	public List<OrdersDetails> shopCarts (Model model) {
//		
//		for (OrdersDetails details : order.getOrderDetail()) {
//			System.out.println(details.getProduct().getPrice());
//	}
//		return order.getOrderDetail();
//	}
//	
	
//	
	@GetMapping("/addtocart")
	public String addtoCart(
			@RequestParam("id") int idProduct,
			@RequestParam("quantity") int quantity,
			@RequestParam("color") String color,
			@RequestParam("size") String size,
			Model model
			
	) {
		
		addToCartService.addID(idP,color,size,quantity);
		
		idP = idProduct;
		return "redirect:/product-detail" + "?id="+idP;
	}
}

