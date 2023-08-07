package com.fpoly.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.Entity.User;
import com.fpoly.Repository.UserDAO;

@Service
public class UserService {

	@Autowired
	UserDAO dao;

	public void addUser(User us) {
		dao.save(us);
	}

	public User findUser(String us) {
		return dao.findByUserName(us);
	}
	
	public User findMail(String mail) {
		return dao.findByMail(mail);
	}

	public List<User> findAllUser() {
		return dao.findAll();
	}

	public User findByUserId(Integer us) {
		User u = dao.getReferenceById(us);
		return u;
	}
	
	public void deleteUser(User us) {
		User u = dao.getReferenceById(us.getId());
		dao.delete(u);
	}
}
