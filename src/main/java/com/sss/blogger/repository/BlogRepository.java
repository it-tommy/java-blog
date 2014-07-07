package com.sss.blogger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sss.blogger.entity.Blog;
import com.sss.blogger.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	
	List<Blog> findByUser(User user);

}
