package com.fpoly.Controller_EStore;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fpoly.Entity.Order;
import com.fpoly.Entity.OrdersDetails;
import com.fpoly.Entity.User;
import com.fpoly.Repository.OrderDAO;
import com.fpoly.Repository.Order_DetailDAO;
import com.fpoly.Repository.UserDAO;
import com.fpoly.Service.Order_DetailService;
import com.fpoly.Service.UserService;
import com.fpoly.Utils.CookieService;
import com.fpoly.Utils.HashPass;

@Controller
public class MyAccount {

	@Autowired
	UserDAO dao;
	@Autowired
	UserService userService;

	@Autowired
	CookieService cookie;

	@Autowired
	Order_DetailService detailService;

	@Autowired
	OrderDAO daoO;

	@Autowired
	Order_DetailDAO daoPD;

	@Autowired
	HashPass hashPass;

	private Integer idUser;
	private String password;

	@GetMapping("/account/order")
	public String viewOrder(Model model, @ModelAttribute("accountUser") User us) {
		String username = cookie.getValue("uName");
		if (us.equals(null)) {
			return "redirect:/login";
		}
		if (username != null) {
			us = userService.findUser(username);

			List<OrdersDetails> listOrder = detailService.findAllOrderById(us.getId());
			model.addAttribute("listOrder", listOrder);
		}

		return "User/_order";
	}

	@GetMapping("/account/payment")
	public String viewsPayment() {
		return "User/_payment";
	}

	@GetMapping("/account/address")
	public String viewAddress() {
		return "User/_address";
	}

	@GetMapping("/account")
	public String account() {
		return "User/MyAccount";
	}

	@GetMapping("/account/editaccount")
	public String viewProfile(Model model, @ModelAttribute("accountUser") User us) {
		// lấy tên username trong cookie
		String username = cookie.getValue("uName");

		if (us.equals(null)) {
			return "redirect:/login";
		}
		if (username != null) {
			// set username trong findUser để lấy ra user

			us = userService.findUser(username); // để tính bảo mật nên trên profile k hiển thị mật khẩu
			idUser = us.getId();
			password = us.getPassword();

			model.addAttribute("accountUser", us);

		}
		return "User/_editProfile";

	}

	@PostMapping("/account/editaccount/save")
	public String saveProfile(Model model, @ModelAttribute("accountUser") User us) {

		if (us != null) {
			us.setId(idUser);
			us.setPassword(password);
			userService.addUser(us);

			model.addAttribute("message", true);
		} else {
			model.addAttribute("message", false);
		}
		return "User/_editProfile";
	}

	// ----------------------------------------------------------------------------------------

	@GetMapping("/account/editaccount/savePass")
	public String viewsaveProfilePass() {
		return "User/_changePass";
	}

	@PostMapping("/account/editaccount/savePass")
	public String saveProfilePass(Model model, @RequestParam("password") String password,
			@RequestParam("passwordNew") String passwordNew, @RequestParam("passwordConfirm") String passwordConfirm) {
		String username = cookie.getValue("uName");
		User us = userService.findUser(username);
		// Boolean success = false;
		if (us != null) {
			Boolean checkPass = hashPass.verify(password, us.getPassword());
			if (checkPass == true && passwordNew.equals(passwordConfirm)) {
				us.setPassword(hashPass.hash(passwordConfirm));
				dao.save(us);

				model.addAttribute("message", true);
			} else {
				model.addAttribute("message", false);
			}
		}
		return "User/_changePass";
	}

	// -----------------------------------------------------------------------------------------
	@GetMapping("/cancel-order/{id}")
	public String Cancel(@PathVariable("id") Integer idO) {
		Order order = daoO.getReferenceById(idO);
		daoO.delete(order);
		return "redirect:/account";
	}

	@ResponseBody
	@GetMapping("/order-viewid/{id}")
	public List<Object[]> detail(Model model, @PathVariable("id") Integer idO) {
		List<Object[]> object = daoPD.findAllOrderDetailUser(idO);
		model.addAttribute("detail", daoPD.findAllOrderDetailUser(idO));
		return object;
	}
}
