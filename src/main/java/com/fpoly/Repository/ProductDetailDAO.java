package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Product;
import com.fpoly.Entity.ProductDetail;

@Repository
public interface ProductDetailDAO  extends JpaRepository<ProductDetail, Integer>{

	@Query(value = "select * from ProductDetail where productID = ?1",nativeQuery = true)	
	List<ProductDetail> findByProductId( Integer idProduct);
	
	@Query(value = "SELECT PD.productID, P.name, P.price, PD.size, PD.color, PI.img\n"
			+ "FROM ProductDetail PD\n"
			+ "JOIN Products P ON PD.productID = P.id\n"
			+ "JOIN ProductImg PI ON PD.productID = PI.productDetailID\n"
			+ "WHERE PD.productID = ?1",nativeQuery = true)
	List<Object[]> findProductDetail(Integer id);
	
	@Query(value = "SELECT PD.productID, P.name, P.price, PD.size, PD.color, PI.img\n"
			+ "FROM ProductDetail PD\n"
			+ "JOIN Products P ON PD.productID = P.id\n"
			+ "JOIN ProductImg PI ON PD.id = PI.productDetailID\n"
			+ "WHERE PD.productID = ?1",nativeQuery = true)
	List<Object[]> findProductDetailImg(Integer id);

	
	
	
	// lấy ra color k trùng m
	@Query("select DISTINCT o.color from ProductDetail o")
	List<String> getColor();
	
	
	@Query("select DISTINCT o.size from ProductDetail o where o.product.id = ?1")
	List<String> getSize(Integer IdProduct);
	
	@Query("select DISTINCT o.color from ProductDetail o where o.product.id = ?1")
	List<String> getColorDetail(Integer IdProduct);
}
