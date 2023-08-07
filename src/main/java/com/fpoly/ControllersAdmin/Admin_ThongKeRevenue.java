package com.fpoly.ControllersAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.Service.Order_DetailService;

@Controller
public class Admin_ThongKeRevenue {

	@Autowired
	Order_DetailService service;
	
	@GetMapping("/index/Revenue/day")
	public String RevenueByDay(Model model) {
		List<Object[]> list = service.getThongkeByDay();
		List<Object[]> listTotal = service.getTotalProductsSoldToday();
		model.addAttribute("list", list);
		model.addAttribute("listTotal", listTotal);
		return "Admin/tblStatistical";
	}
	
	@GetMapping("/index/Revenue/month")
	public String RevenueByMonth(Model model) {
		List<Object[]> list = service.getThongkeByMonth();
		List<Object[]> listTotal = service.getTotalProductsSoldMonth();
		model.addAttribute("list", list);
		model.addAttribute("listTotal", listTotal);
		return "Admin/tblStatistical";
	}
}
