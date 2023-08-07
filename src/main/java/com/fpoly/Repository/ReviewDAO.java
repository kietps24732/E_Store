package com.fpoly.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.Beans.Review;

@Repository
public interface ReviewDAO  extends JpaRepository<Review, Integer>{

}
