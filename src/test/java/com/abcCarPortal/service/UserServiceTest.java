package com.abcCarPortal.service;

import java.util.HashSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.abcCarPortal.model.User;
import com.abcCarPortal.repository.RoleRepository;
import com.abcCarPortal.repository.UserRepository;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
	
	@InjectMocks
	UserService userService;
	
	@Mock
	RoleRepository roleRepository;
	
	@Mock
	PasswordEncoder passwordEncoder;
	
	@Mock
	UserRepository userRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void saveRegisterUserData() {
		User user = new User();
		user.setId((long) 1);
		user.setName("Sandra");
		user.setUserName("sansan");
		user.setEmail("Sandra@gmail.com");
		String encodedPassword = passwordEncoder.encode("sansan123");
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		Mockito.when(userRepository.save(user)).thenReturn(user);
		String userResponse = userService.save(user);
		Assert.assertEquals("User saved successfully", userResponse);
	}

}
