package com.abcCarPortal.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcCarPortal.model.Car;
import com.abcCarPortal.model.CarBidding;
import com.abcCarPortal.model.User;


@Repository
public interface BidRepository extends JpaRepository<CarBidding, Long>{
	
	List<CarBidding> findByUserAndCar(User user, Car car);
	
	List<CarBidding> findByUser(User user);
	@Modifying
    @Query(value = "DELETE FROM car_bidding WHERE car_id = :carId", nativeQuery = true)
    void deleteByCarId(@Param("carId") long carId);
	}
