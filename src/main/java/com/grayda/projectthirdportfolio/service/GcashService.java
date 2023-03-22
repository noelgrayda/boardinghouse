package com.grayda.projectthirdportfolio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grayda.projectthirdportfolio.models.Gcash;
import com.grayda.projectthirdportfolio.repository.GcashRepository;

@Service
public class GcashService {
	@Autowired
	GcashRepository gcashRepo;
	
	public List<Gcash> s_findAllGcash(){
		return gcashRepo.findAll();
	}
	
	public Gcash s_findGcashById(Long id) {
		Optional<Gcash> optionalUser = gcashRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;			
		}
	}
	
	public Gcash s_addGcash(Gcash gcash) {
		return gcashRepo.save(gcash);
	}
	
	public void s_deleteGcash(Long id) {
		Optional<Gcash> optionalUser = gcashRepo.findById(id);
		if(optionalUser.isPresent()) {
			gcashRepo.deleteById(id);
		}
	}
}