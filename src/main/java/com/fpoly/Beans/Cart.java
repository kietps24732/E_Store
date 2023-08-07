package com.fpoly.Beans;

import java.sql.Date;

import javax.persistence.Column;

import com.fpoly.Entity.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	

	private String color;
	
	private String size;
	
	private Integer id;
	
	private String name;
	
	private float price;
		
	private Date createdate;
	
	private int quantity = 0;
	
	private String description;
	
	private String brand;
	
	private String imgProduct; 
	
	private String category; 
}
