package com.fpoly.ControllersAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("index/order-detail")
public class Admin_OrderDetail {
	
	@Autowired
	private com.fpoly.Service.Order_DetailService  Order_DetailService;
	
	/*
	 * @GetMapping() public String viewOrderDetail (Model model) {
	 * model.addAttribute("list", Order_DetailService.getUserOrder(idOrder_Detail));
	 * return "Admin/tblDonHang_ChiTiet"; }
	 */
	@GetMapping("/edit/{id}")
	public String edit (Model model,@PathVariable("id") Integer idOrder_Detail) {
		model.addAttribute("list", Order_DetailService.getUserOrder(idOrder_Detail));
		return "Admin/tblDonHang_ChiTiet";
	}
}
