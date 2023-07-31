package com.abcCarPortal.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abcCarPortal.model.Car;
import com.abcCarPortal.model.CarBidding;
import com.abcCarPortal.model.User;
import com.abcCarPortal.service.CarService;
import com.abcCarPortal.service.UserService;

@Controller
public class CarController {
	@Autowired
	private CarService carService;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("car_post")
	public String saveCar(@ModelAttribute("car") Car car, RedirectAttributes ra,
			@RequestParam("fileImage") MultipartFile multipartFile, Principal principal) throws IOException {

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

		car.setPhotos(fileName);
		car.setSellStatus("on sale");

		Car savedCar = carService.save(car);

		String uploadDir = "./src/main/resources/static/images/car-photo/" + savedCar.getId();

		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		
		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);

		}
		
		car.setPhotoImagePath("/images/car-photo/" + savedCar.getId() + "/" + savedCar.getPhotos());

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		car.setSellerId(user.getId());

		carService.save(car);

		ra.addFlashAttribute("success_post", "Post has been saved successfully");

		return "redirect:cars";
	}

	
	@GetMapping("car_detail")
	public String viewCarDetail(@RequestParam long cid, Model model) {

		Optional<Car> car_info = carService.getCarInfo(cid);
		System.out.println(car_info);

		Car cardata = car_info.get();

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}

		return "carDetail";
	}
	
	@PostMapping("book")
	public String carBooking(@ModelAttribute("booking") CarBidding book,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		cardata.setSellStatus("Booked");
		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		String date = dateOnly.format(new Date());
		
		book.setUser(user);
		book.setCar(cardata);
		book.setBidderName(user.getName());
		book.setBookDate(date);
		book.setBookStatus("Booked");
		// before saving, check if user has placed a bidding before to add booking date
		List<CarBidding> userBooking = carService.findUserBid(user, cardata);
		System.out.println(userBooking);


		carService.saveBid(book);
		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());
		

		return "carDetail";
	}
	
	@GetMapping("search")
	public ModelAndView searchCars(@RequestParam String keyword, Model model) {
		
		List<Car> searchCar = carService.search(keyword);
		System.out.println(searchCar);
		
		model.addAttribute("keyword", keyword);
		
		return new ModelAndView ("searchResults", "searchCar", searchCar);
	}
	
	@GetMapping("deleteCarByUser")
	public String deletePostCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
    	carService.deleteBidingByCarId(cid);

		return "redirect:profile";
		
	}
	
    @GetMapping("postCar")
    public String showpostCarPage() {
    	
    	return "postCar";
    }
    
    @PostMapping("bid")
	public String carBidding(@ModelAttribute("bidding") CarBidding bid,
			@RequestParam(value = "cid", required = false) long id, Principal principal, Model model,
			@RequestParam("bidderPrice") double price) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findLoginUser(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		bid.setBidderName(user.getName());
		bid.setUser(user);
		bid.setCar(cardata);

		// before saving, check if user has placed a bid before
		List<CarBidding> userBid = carService.findUserBid(user, cardata);
		System.out.println(userBid);

		if (userBid.size() > 0) {

			long bidId = userBid.stream().findAny().get().getId();
			Optional<CarBidding> bid_info = carService.getBidInfo(bidId);
			System.out.println(bid_info);

			CarBidding bidData = bid_info.get();

			bidData.setBidderPrice(price);

			carService.saveBid(bidData);
			
			
		} else {
			carService.saveBid(bid);
			
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBidding> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBidding> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBidderPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBidding> highBid = new HashSet<CarBidding>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());

		return "carDetail";
	}

}
