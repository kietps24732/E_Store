package com.fpoly.ControllersAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class Admin_index {

	@GetMapping()
	public String home () {
		return "Admin/index";
	}
}
