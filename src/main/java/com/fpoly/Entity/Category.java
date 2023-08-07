package com.fpoly.Entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Categories")
public class Category {
	@Id
	@Column(name = "id")
	private String id;
	
	@Column(name = "name")
	private String name;	
	
	@OneToMany(mappedBy="category",cascade = CascadeType.ALL)
	List<Product> product;
}
