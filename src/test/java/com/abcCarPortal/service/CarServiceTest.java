package com.abcCarPortal.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abcCarPortal.model.Car;
import com.abcCarPortal.model.CarBidding;
import com.abcCarPortal.model.User;
import com.abcCarPortal.repository.BidRepository;
import com.abcCarPortal.repository.CarRepository;

@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	@Mock
	BidRepository bidRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveCar() {
		Car car = new Car();
		car.setId((long) 1);
		car.setName("Toyota Avanza");
		car.setModel("Avanza");
		car.setPrice("33000");
		car.setMake("2021");
		car.setRegisteration("Jan 2021");
		Mockito.when(carRepository.save(car)).thenReturn(car);
		Car savedCar = carService.save(car);
		Assert.assertEquals(car, savedCar);
	}
	
	@Test
	public void testSearchCar() {
		Car car = new Car();
		String searchInput = "Avanza";
		car.setModel(searchInput);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.search(searchInput)).thenReturn(searchCar);
		List<Car> search = carService.search(searchInput);
		Assert.assertEquals(searchCar, search);
	}
	
	@Test
	public void testSaveCarBidding() {
		Car car = new Car();
		car.setName("Toyota Avanza");
		User user = new User();
		user.setName("Sandra");
		CarBidding bid = new CarBidding();
		bid.setCar(car);
		bid.setUser(user);
		bid.setBidderPrice(6000);
		
		Mockito.when(bidRepository.save(bid)).thenReturn(bid);
		CarBidding saveBid = carService.saveBid(bid);
		Assert.assertEquals(bid, saveBid);
	}

}
