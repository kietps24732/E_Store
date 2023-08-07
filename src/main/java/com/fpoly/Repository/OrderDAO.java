package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.Order;

@Repository
public interface OrderDAO  extends JpaRepository<Order, Integer>{

	@Query(value = "SELECT * FROM Orders ",nativeQuery = true)
	List<Object[]> findAlls();

	@Query(value = "SELECT od.id, p.name AS product_name,p.price AS product_price,pd.size AS product_size,pd.color AS product_color,od.quantity AS product_quantity\n"
			+ "FROM OrdersDetails od JOIN   Products p ON od.productId = p.id JOIN ProductDetail pd ON p.id = pd.productID				\n"
			+ "	where od.id = ?1",nativeQuery = true)
	List<Object[]> findOrderDtail(Integer id);
}
