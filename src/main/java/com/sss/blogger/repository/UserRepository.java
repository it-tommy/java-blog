package com.sss.blogger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sss.blogger.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
