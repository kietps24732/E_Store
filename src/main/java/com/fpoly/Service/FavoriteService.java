package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.Favorite;
import com.fpoly.Repository.FavoriteDAO;

@Service
public class FavoriteService {


	@Autowired
	FavoriteDAO dao;
	
	public List<Favorite> findAlls(){
		List<Favorite> list = dao.findAll();	
		return list;
	}
	
	public List<Object[]> getAllProductDataFavorite(Integer idUser){
		List<Object[]> list = dao.findAllFavorite(idUser);
		return list;
	}
	
	public List<Object[]> getAllFavoriteProductDataUser(){
		List<Object[]> list = dao.findAllFavoriteProductDataUser();
		return list;
	}
	
	public void delFavorite(Integer id) {
		Favorite favorite = dao.getReferenceById(id);
		dao.delete(favorite);
	}
	
}
