package com.fpoly.Beans;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	@Id
	//@Column(name = "id")
	private Integer id;
	
	//@Column(name = "id")
	private String username;
	//@Column(name = "reviews")
	private String reviews;
}
