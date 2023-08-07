package com.fpoly.Entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "productdetail")
public class ProductDetail {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name="id")
	private Integer id;
	

	@Column(name="size")
	private String size;
	
	@Column(name="color")
	private String color;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="productid", referencedColumnName = "id")
	Product product;
	
	@OneToMany(mappedBy="productDetail", cascade = CascadeType.ALL)
	List<ProductImg> productimgs;
}
