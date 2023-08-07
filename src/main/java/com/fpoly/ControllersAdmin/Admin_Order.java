package com.fpoly.ControllersAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.Entity.OrdersDetails;
@Controller
@RequestMapping("index/order")
public class Admin_Order {
	
	@Autowired
	private com.fpoly.Service.Order_DetailService  Order_DetailService;
	
	@GetMapping()
	public String viewTable (Model model) {
		model.addAttribute("list", Order_DetailService.findAlls());
		return "Admin/tblDonHang";
	}
	/*
	setStatus()
	0 = Đã Giao
	1 = đang giao
	2 = đang sử lý
	*/
	@GetMapping("/edit/{id}")
	public String edit (Model model, @PathVariable("id") Integer idOrder) {		
		OrdersDetails details = Order_DetailService.getOrdersDetails(idOrder);		
		details.setStatus(1);
		Order_DetailService.SaveOrdersDetails(details);				
		return "redirect:/index/order";
	}
	
	@GetMapping("/delivering")
	public String TableDelivering (Model model) {
		model.addAttribute("list", Order_DetailService.getAllDelivering());
		return "Admin/tblDonHang";
	}
	
	@GetMapping("/delivered")
	public String TableDelivered (Model model) {
		model.addAttribute("list", Order_DetailService.getAllDelivered());
		return "Admin/tblDonHang";
	}

}
