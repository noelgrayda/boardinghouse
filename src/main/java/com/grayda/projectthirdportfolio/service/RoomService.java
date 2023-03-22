package com.grayda.projectthirdportfolio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.grayda.projectthirdportfolio.models.Rooms;
import com.grayda.projectthirdportfolio.repository.RoomRepository;

@Service
public class RoomService {
	@Autowired
	RoomRepository roomRepo;
	
	public List<Rooms> s_findAllRooms(){
		return roomRepo.findAll(Sort.by(Sort.Direction.ASC,"roomName"));
	}
	
	public Rooms s_findRoomById(Long id) {
		Optional<Rooms> optionalUser = roomRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;
		}
	}
	
	public Rooms s_addRoom(Rooms room) {
		return roomRepo.save(room);
	}
	
	public void s_deleteRoom(Long id) {
		Optional<Rooms> optionalUser = roomRepo.findById(id);
		if(optionalUser.isPresent()) {
			roomRepo.deleteById(id);
		}
	}
}
