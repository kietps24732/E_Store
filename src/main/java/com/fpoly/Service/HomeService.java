package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.Product;
import com.fpoly.Repository.FavoriteDAO;
import com.fpoly.Repository.ProductDAO;

@Service
public class HomeService {

	@Autowired
	ProductDAO daoPro;
	@Autowired
	FavoriteDAO daoFa;

	// Lấy ra tất cả sản phẩm top 6 DATE
	public List<Product> getProductDataTop6Date() {
		return daoPro.findProductDataTop6Date();
	}

	// Lấy ra tất cả sản phẩm
	public List<Product> getProductDataAll() {
		return daoPro.findAll();
	}

	// Lấy ra sản phẩm top 6 được yêu thích
	public List<Product> getProductDataFavorite() {
		return daoPro.findProductDataTop6Favorite();
	}

	// Lấy Ra count lượt thích ủa User
	public int getCountFavorite(Integer id) {
		return daoFa.getCountFavotiteUser(id);
	}

}
