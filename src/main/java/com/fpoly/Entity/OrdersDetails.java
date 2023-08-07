package com.fpoly.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="ordersdetails", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"orderid", "productid"})
})
public class OrdersDetails {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name="id")
	private Integer id;
	
	@Column(name="price")
	private float price;
	
	@Column(name="status")
	private Integer status;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@ManyToOne @JoinColumn(name="productid")
	Product product;
	
	@ManyToOne @JoinColumn(name="orderid")
	Order order;
}
