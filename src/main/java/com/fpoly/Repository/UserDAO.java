package com.fpoly.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.Entity.User;

@Repository
public interface UserDAO  extends JpaRepository<User, Integer>{

	@Query("select o from User o where o.username = ?1")
	User findByUserName(String us);
	
	@Query("select o from User o where o.email = ?1")
	User findByMail(String mail);
	
//	@Query(value = "update Users set password =?1 where username =?2",nativeQuery = true)
//	User SavePass( String passnew, String username);
	
}
