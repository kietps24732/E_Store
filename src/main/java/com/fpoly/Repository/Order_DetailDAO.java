package com.fpoly.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.OrdersDetails;

@Repository
public interface Order_DetailDAO  extends JpaRepository<OrdersDetails, Integer>{
	
	@Query("SELECT o FROM OrdersDetails o where o.status = 0")
	List<OrdersDetails> findAllDelivered();
		
	@Query("SELECT o FROM OrdersDetails o where o.status = 1")
	List<OrdersDetails> findAllDelivering();
	
	@Query("SELECT o FROM OrdersDetails o where o.status = 2")
	List<OrdersDetails> findAllOder();
	// Lấy order theo id user
	@Query("SELECT od FROM OrdersDetails od where od.order.user.id = ?1")
	List<OrdersDetails> findAllOrderUser(Integer id);
	
	// view orderDetail
	@Query(value = "SELECT od.id, p.name ,p.price ,pd.size ,pd.color ,od.quantity \n"
			+ "FROM OrdersDetails od \n"
			+ "JOIN  Products p ON od.productId = p.id \n"
			+ "JOIN ProductDetail pd ON p.id = pd.productID				\n"
			+ "	where od.id = ?1" , nativeQuery = true)
	List<Object[]> findAllOrderDetailUser(Integer id);
	
	
	List<OrdersDetails> findByIdLike(Integer id);
	
	// thống kê theo ngày
	@Query(value = "select p.id,p.imgP,p.name,p.price,od.quantity,u.username,od.status,o.createdate from OrdersDetails od\n"
			+ "			INNER JOIN Orders o ON od.orderId = o.id\n"
			+ "			INNER JOIN Users u ON o.usernameid = u.id\n"
			+ "			INNER JOIN Products p ON  od.productId = p.id\n"
			+ "	 WHERE CONVERT(date, o.createdate) = CONVERT(date, GETDATE())",nativeQuery = true)
	List<Object[]> getStatisticsByDay(); 
	
	// thống kê tổng số lượng bán, tổng tiền bán theo ngày
	@Query(value = "SELECT Sum(OrdersDetails.quantity) AS SoLuongSanPham, SUM(OrdersDetails.price * OrdersDetails.quantity) AS TongTienBanDuoc\n"
			+ "FROM OrdersDetails\n"
			+ "INNER JOIN Orders ON OrdersDetails.orderId = Orders.id\n"
			+ "WHERE CONVERT(date, Orders.createdate) = CONVERT(date, GETDATE())",nativeQuery = true)
	List<Object[]> getTotalProductsSoldToday(); 
	
	// thống kê theo Tháng
	@Query(value = "select p.id,p.imgP,p.name,p.price,od.quantity,u.username,od.status,o.createdate from OrdersDetails od\n"
			+ "			INNER JOIN Orders o ON od.orderId = o.id\n"
			+ "			INNER JOIN Users u ON o.usernameid = u.id\n"
			+ "			INNER JOIN Products p ON  od.productId = p.id\n"
			+ "	 WHERE YEAR(o.createdate) = YEAR(GETDATE()) AND MONTH(o.createdate) = MONTH(GETDATE())",nativeQuery = true)
	List<Object[]> getStatisticsByMonth(); 
	
	
	// thống kê tổng số lượng bán, tổng tiền bán theo tháng
		@Query(value = "SELECT  Sum(OrdersDetails.quantity) AS SoLuongSanPham, SUM(OrdersDetails.price * OrdersDetails.quantity) AS TongTienBanDuoc\n"
				+ "FROM OrdersDetails\n"
				+ "INNER JOIN Orders ON OrdersDetails.orderId = Orders.id\n"
				+ "WHERE YEAR(Orders.createdate) = YEAR(GETDATE()) AND MONTH(Orders.createdate) = MONTH(GETDATE())",nativeQuery = true)
		List<Object[]> getTotalProductsSoldMonth(); 
}
