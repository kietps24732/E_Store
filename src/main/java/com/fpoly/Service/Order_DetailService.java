package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.OrdersDetails;
import com.fpoly.Repository.Order_DetailDAO;

@Service
public class Order_DetailService {

	@Autowired
	Order_DetailDAO dao;

	public OrdersDetails getOrdersDetails(Integer id) {
		OrdersDetails details = dao.getReferenceById(id);
		return details;
	}

	public OrdersDetails SaveOrdersDetails(OrdersDetails details) {
		dao.save(details);
		return details;
	}

	public List<OrdersDetails> findAllOrderById(Integer id) {
		List<OrdersDetails> list = dao.findAllOrderUser(id);
		return list;
	}
	
	public List<OrdersDetails> findAlls() {
		List<OrdersDetails> list = dao.findAllOder();
		return list;
	}

	public List<OrdersDetails> getAllDelivering() {
		List<OrdersDetails> list = dao.findAllDelivering();
		return list;
	}

	public List<OrdersDetails> getAllDelivered() {
		List<OrdersDetails> list = dao.findAllDelivered();
		return list;
	}

	public List<OrdersDetails> getUserOrder(Integer idOrder_Detail) {
		List<OrdersDetails> list = dao.findByIdLike(idOrder_Detail);
		return list;
	}

	// Thống kê theo Ngày
	public List<Object[]> getThongkeByDay() {
		List<Object[]> list = dao.getStatisticsByDay();
		return list;
	}

	// thống kê tổng số lượng bán, tổng tiền bán theo ngày
	public List<Object[]> getTotalProductsSoldToday() {
		List<Object[]> list = dao.getTotalProductsSoldToday();
		return list;
	}

	// Thống kê theo tháng
	public List<Object[]> getThongkeByMonth() {
		List<Object[]> list = dao.getStatisticsByMonth();
		return list;
	}

	// Thống kê theo // thống kê tổng số lượng bán, tổng tiền bán theo ngày
	public List<Object[]> getTotalProductsSoldMonth() {
		List<Object[]> list = dao.getTotalProductsSoldMonth();
		return list;
	}
}
