package com.fpoly.Entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "orders")
public class Order {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "id")
	private Integer id;		
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "createdate")
	private java.util.Date createdate;

	@ManyToOne()
	@JoinColumn(name="usernameid" , referencedColumnName = "id")
	private User user;
	
	@OneToMany(mappedBy="order",cascade = CascadeType.ALL)
	List<OrdersDetails> orderDetail;
	
}
