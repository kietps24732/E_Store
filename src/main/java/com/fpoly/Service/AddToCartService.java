package com.fpoly.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.fpoly.Beans.Cart;
import com.fpoly.Entity.Product;
import com.fpoly.Entity.ProductDetail;
import com.fpoly.Repository.ProductDAO;

@Service
public class AddToCartService {

	@Autowired
	ProductDAO daoP;
	@Autowired
	HttpServletRequest request;

	// Map<Integer, Product> map = new HashMap<>();
	List<Cart> list = new ArrayList<>();

	public void addID(Integer id, String color, String size, int quantity) {
		HttpSession session = request.getSession();

		Cart cart = new Cart();
		Product product = daoP.getReferenceById(id);

		cart.setColor(color);
		cart.setSize(size);
		cart.setId(product.getId());
		cart.setName(product.getName());
		cart.setPrice(product.getPrice());
		cart.setCreatedate(product.getCreatedate());
		cart.setQuantity(quantity);
		cart.setBrand(product.getBrand());
		cart.setImgProduct(product.getImgProduct());
		cart.setCategory(product.getCategory().getName());
		list.add(cart);
		for (Cart productDetail : list) {
			System.out.println("Add to cart: " + productDetail.getName());
		}
		session.setAttribute("order", cart);
	}

	public List<Cart> getAll() {

		return list;
	}

	public int getCount() {
		return list.size();
	}

	public void remove(int id) {
		list.remove(id);

	}

	public double getAmount() {
		double totalPrice = 0;
		for (Cart item : list) {
			totalPrice += item.getPrice() * item.getQuantity();

		}
		return totalPrice;
	}

	public int getTotalProduct() {
		int totalProduct = 0;
		for (Cart item : list) {
			totalProduct += item.getQuantity();

		}
		return totalProduct;
	}

	// hiển thị cart buynow
	public Cart cart(Integer idProduct, String color, String size, int quantity) {
		Product product = daoP.getReferenceById(idProduct);
		Cart cart = new Cart();
		cart.setColor(color);
		cart.setSize(size);
		cart.setId(product.getId());
		cart.setName(product.getName());
		cart.setPrice(product.getPrice());
		cart.setCreatedate(product.getCreatedate());
		cart.setQuantity(quantity);
		cart.setBrand(product.getBrand());
		cart.setImgProduct(product.getImgProduct());
		cart.setCategory(product.getCategory().getName());
		return cart;
	}

}
