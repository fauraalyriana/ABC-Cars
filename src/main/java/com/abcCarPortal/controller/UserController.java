package com.abcCarPortal.controller;

import java.security.Principal;
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
import com.abcCarPortal.model.CarBidding;
import com.abcCarPortal.model.User;
import com.abcCarPortal.service.CarService;
import com.abcCarPortal.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CarService carService;
	
	@GetMapping("/")
	public String handleRootRequest(Model model) {
		return "index";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	 @GetMapping("login_error")
	    public String onLoginError(Model model) {
	        String error_msg = "Incorrect username or password. Try Again.";
	        model.addAttribute("error_string", error_msg);
	        return "login";
	    }

	@GetMapping("/register")
	public String signUpForm(@ModelAttribute("user") User user) {
		return "Register";
	}
	
	@PostMapping("registerProcess")
    public String registerNewUser(@ModelAttribute("user") User user, Model model) {
    	
    	String response = userService.save(user);
    	System.out.println(response);
    	
    	String success_register = "Registeration Successful! ";
    	model.addAttribute("success_register", success_register);
    	
    	return "Register";
    }
	
	
	@GetMapping("cars")
	public ModelAndView viewCars(@ModelAttribute("car") Car car) {

		List<Car> cars = carService.getAllCars();
		System.out.println(cars);

		return new ModelAndView("viewCars", "cars", cars);
	}
	

    @GetMapping("profile")
    public String showProfile(Model model, Principal principal) {
    	
    	//Get User name
    	String uname = principal.getName();
    	System.out.println(uname);
    	
    	User userdata = userService.findLoginUser(uname);
    	
    	long uid = userdata.getId();
    	
    	List<User> user = new ArrayList<User>();
    	
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	//Get user bidding or booking or both
    	List<CarBidding> bids = carService.getUserBids(userdata);
    	System.out.println(bids);
    	
    	model.addAttribute("bids", bids);
    	
    	return "profile";
    }
    
    @PostMapping("update")
    public String updateUser(Principal principal, 
    		@ModelAttribute("user") User u) {
    	
    	//Get User name
    	String username = principal.getName();
    	
    	User user = userService.findLoginUser(username);
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setAddress(u.getAddress());
    	
    	userService.update(user);
    	System.out.println("Update User Successful");
    	System.out.println(user);
    	
    	return "redirect:profile";
    }
    
    @GetMapping("buyAcc")
    public String accept(Model model, @RequestParam(value = "cid") long cid,
    							@RequestParam(value = "bid") long bid) {

    	Optional<Car> car_info = carService.getCarInfo(cid);
		System.out.println(cid);

		Car cardata = car_info.get();

		cardata.setSellStatus("sold");
		
		
		carService.save(cardata);
		
		Optional<CarBidding> carBid= carService.getBidInfo(bid);
		CarBidding bidingData = carBid.get();
		bidingData.setBookStatus("Success");
		carService.saveBid(bidingData);

    	return "redirect:profile";
	}
    
    
    
    @GetMapping("buyDenied")
    public String denied(Model model, @RequestParam(value = "cid") long cid,
    							@RequestParam(value = "bid") long bid) {

    	Optional<Car> car_info = carService.getCarInfo(cid);
		System.out.println(cid);

		Car cardata = car_info.get();

		cardata.setSellStatus("on sale");
		
		
		carService.save(cardata);
		
		Optional<CarBidding> carBid= carService.getBidInfo(bid);
		CarBidding bidingData = carBid.get();
		bidingData.setBookStatus("Denied");
		carService.saveBid(bidingData);

    	return "redirect:profile";
	}
    
    @GetMapping("about_us")
    public String showAboutUsPage() {
    	
    	return "aboutUs";
    }
   
    @GetMapping("contact_us")
    public String showContactUsPage() {
    	
    	return "contactUs";
    }
    
}
