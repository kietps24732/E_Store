package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Favorite;

@Repository
public interface FavoriteDAO  extends JpaRepository<Favorite, Integer>{


		
	
	// Lấy ra số lược Thích từ cao đến thấp của thống kê
	@Query(value = "select Favorite.productId, Products.imgP, Products.[name], count(Favorite.productId) as SumFavorite, Products.price									 \n"
			+ "										from Favorite \n"
			+ "										join Products on Products.id =  Favorite.productId								\n"
			+ "										GROUP BY Favorite.productId , Products.[name],Products.price,Products.imgP\n"
			+ "										ORDER BY SumFavorite DESC",nativeQuery = true)
	List<Object[]> findAllFavoriteProductDataUser();
	
	// Lấy ra sản phẩm Yêu thích của User
	@Query( value = "Select   Products.id, Products.name, Products.price, Products.imgP ,Favorite.id as idF from Products \n"
			+ "											join Favorite on Products.id =  Favorite.productId\n"
			+ "												where Favorite.userID = ?1",nativeQuery = true)
	List<Object[]> findAllFavorite(Integer IdUser);
	
	
	// Lấy Ra count lượt thích ủa User
	@Query("select count(f.product.id) from Favorite f where f.User.id = ?1")
	int getCountFavotiteUser( Integer IdUser);
	

	@Query("Select o from Favorite o where o.product.id = ?1 and  o.reviews is not null")
	List<Favorite> getReview(Integer id);
}


