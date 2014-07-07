package com.sss.blogger.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sss.blogger.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findByName(String name);

}
