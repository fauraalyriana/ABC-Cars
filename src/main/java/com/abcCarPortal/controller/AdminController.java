package com.abcCarPortal.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcCarPortal.model.Car;
import com.abcCarPortal.model.User;
import com.abcCarPortal.service.CarService;
import com.abcCarPortal.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CarService carService;
	
	@GetMapping("users")
    public ModelAndView showAllUser() {
    	
    	List<User> user = userService.showAllUser();
    	
    	return new ModelAndView ("allUser", "user", user);
    }
	
	@GetMapping("delete")
    public String deleteUser(@RequestParam long uid) {
    	
    	userService.deleteUser(uid);
    	return "redirect:users";
    }
	
	@GetMapping("all_cars")
	public ModelAndView showAllCar(@ModelAttribute("car") Car car) {
		
		List<Car> cars = carService.getAllCars();
		System.out.println(cars);
		
		return new ModelAndView ("allCar", "cars", cars);
	}
	
	@PostMapping("edit_car")
	public String editCar(@ModelAttribute("car") Car car, 
			@RequestParam long cid) {
		
		Optional<Car> car_info = carService.getCarInfo(cid);
    	System.out.println(car_info);
    	
    	Car edit_car = car_info.get();
		
    	edit_car.setMake(car.getMake());
    	edit_car.setModel(car.getModel());
    	edit_car.setName(car.getName());
    	edit_car.setPrice(car.getPrice());
    	edit_car.setRegisteration(car.getRegisteration());
    	edit_car.setSellerId(car.getSellerId());
    	edit_car.setPhotos(car.getPhotos());
    	edit_car.setPhotoImagePath(car.getPhotoImagePath());
    	
    	carService.save(edit_car);
		
		return "redirect:all_cars";
	}
	
	@GetMapping("delete_car")
	public String deletePostCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
    	carService.deleteBidingByCarId(cid);

		return "redirect:all_cars";
		
	}
	
	@GetMapping("view")
    public String userProfile(@RequestParam long uid, Model model) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User userdata = user_info.get();
    	
    	List<User> user = new ArrayList<User>();
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	return "profile";	
    }
	
	 @PostMapping("edit")
	    public String editUser(@RequestParam long uid,
	    		@ModelAttribute("user") User u) {
	    	
	    	Optional<User> user_info = userService.getUserInfo(uid);
	    	System.out.println(user_info);
	    	
	    	User user = user_info.get();
	    	
	    	user.setName(u.getName());
	    	user.setUserName(u.getUserName());
	    	user.setEmail(u.getEmail());
	    	user.setMobile(u.getMobile());
	    	user.setAddress(u.getAddress());
	    	
	    	userService.update(user);
	    	System.out.println("Edit User Successful");
	    	System.out.println(user);
	    	
	    	return "redirect:users";
	    }
}
