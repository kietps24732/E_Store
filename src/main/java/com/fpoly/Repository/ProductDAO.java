package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Product;

@EnableJpaRepositories
@Repository
public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT p FROM Product p ")
	List<Product> findProductData();

	List<Product> findByNameLike(String name);

	@Query("SELECT p FROM Product p  where p.quantity > 0")
	List<Product> findProductInventory();

	@Query(value = "SELECT Products.id, Products.name, Products.imgP, Products.price, COUNT(OrdersDetails.productID) AS total_ordered\n"
			+ "	 		FROM Orders\n" + "	 		JOIN OrdersDetails ON Orders.id = OrdersDetails.orderID\n"
			+ "	 		JOIN Products ON OrdersDetails.productID = Products.id\n"
			+ "	 		GROUP BY Products.id, Products.name, Products.imgP, Products.price\n"
			+ "	 		ORDER BY total_ordered DESC;", nativeQuery = true)
	List<Object> sortListSelling();

	// lấy ra product co' Id =
	Product findByIdLike(Integer id);

	// Lấy ra sản phẩm top 6 được yêu thích
	@Query(value = "	select top 6  Products.id,  Products.[name],Products.price,imgP,brand,categoryId,quantity,description,createdate\n"
			+ "					from  Products\n"
			+ "					join Favorite on Products.id =  Favorite.productId				\n"
			+ "					GROUP BY Products.id , Products.[name],Products.price,imgP,brand,categoryId,quantity,description,createdate\n"
			+ "					ORDER BY COUNT(Favorite.productId) DESC", nativeQuery = true)
	List<Product> findProductDataTop6Favorite();

	@Query(value = "select top 6 * 	from  Products	ORDER BY createdate DESC", nativeQuery = true)
	List<Product> findProductDataTop6Date();

	@Query(value = "select top 6 * from Products where brand = :brand ", nativeQuery = true)
	List<Product> findProductDataTop6Brand(@Param("brand") String brand);

	@Query("SELECT p FROM Product p ")
	Page<Product> findProductData(Pageable pageable);

	@Query(value = "SELECT * FROM Products  WHERE name LIKE ?1", nativeQuery = true)
	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

	@Query(value = "SELECT * FROM Products  WHERE brand LIKE 'bitits'", nativeQuery = true)
	Page<Product> findAllByBitits(Pageable pageable);

	@Query(value = "SELECT * FROM Products  WHERE brand LIKE 'jordan'", nativeQuery = true)
	Page<Product> findAllByJordan(Pageable pageable);

	@Query(value = "SELECT * FROM Products  WHERE brand LIKE 'adidas'", nativeQuery = true)
	Page<Product> findAllByAdidas(Pageable pageable);

	@Query(value = "SELECT * FROM Products WHERE price BETWEEN 0 AND 50", nativeQuery = true)
	Page<Product> findByPrice050(Pageable pageable);

	@Query(value = "SELECT * FROM Products WHERE price BETWEEN 51 AND 100", nativeQuery = true)
	Page<Product> findByPrice5110(Pageable pageable);

	@Query(value = "SELECT * FROM Products WHERE price BETWEEN 101 AND 150", nativeQuery = true)
	Page<Product> findByPrice1150(Pageable pageable);
}
