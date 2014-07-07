package com.sss.blogger.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sss.blogger.entity.Blog;
import com.sss.blogger.entity.Item;
import com.sss.blogger.entity.Role;
import com.sss.blogger.entity.User;
import com.sss.blogger.repository.BlogRepository;
import com.sss.blogger.repository.ItemRepository;
import com.sss.blogger.repository.RoleRepository;
import com.sss.blogger.repository.UserRepository;

@Transactional
@Service
public class InitDBService {
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BlogRepository blogRepository;
	@Autowired
	private ItemRepository itemRepository;
	
	@PostConstruct
	public void Init(){
		
		if(roleRepository.findByName("ROLE_ADMIN") == null){
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);
			
			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);
			
			User userAdmin = new User();
			userAdmin.setEnabled(true);
			userAdmin.setName("admin");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleUser);
			roles.add(roleAdmin);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);
			
			Blog blogs = new Blog();
			blogs.setName("JavaVids");
			blogs.setUrl("http://feeds.feedburner.com/javavids");
			blogs.setUser(userAdmin);
			blogRepository.save(blogs);
			
	/*		Item item1 = new Item();
			item1.setBlog(blogs);
			item1.setTitle("First Title");
			item1.setLink("http://www.javavids.com");
			item1.setPublishDate(new Date());
			itemRepository.save(item1);
			
			
			Item item2 = new Item();
			item2.setBlog(blogs);
			item2.setTitle("Second Title");
			item2.setLink("http://www.smithsoftwaresolutions.com");
			item2.setPublishDate(new Date());
			itemRepository.save(item2);*/
		
		}
		
		
		
		
		
		
	}

	
	
	

}
