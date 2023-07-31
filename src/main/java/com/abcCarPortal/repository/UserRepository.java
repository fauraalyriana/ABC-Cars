package com.abcCarPortal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abcCarPortal.model.User;


public interface UserRepository extends JpaRepository<User, Long>{

	User findByUserName(String name);
	
	
}
