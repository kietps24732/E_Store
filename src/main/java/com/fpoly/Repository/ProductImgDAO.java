package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.ProductImg;

@Repository
public interface ProductImgDAO  extends JpaRepository<ProductImg, Integer>{

	@Query(value = "select img from ProductImg join ProductDetail on ProductDetail.id = ProductImg.productDetailID\n"
			+ "where ProductDetail.productID = ?1",nativeQuery = true)
	List<String> getAllImgProduct(Integer idP);
}
