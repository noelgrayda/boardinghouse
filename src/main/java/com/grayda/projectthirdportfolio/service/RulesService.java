package com.grayda.projectthirdportfolio.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grayda.projectthirdportfolio.models.Rules;
import com.grayda.projectthirdportfolio.repository.RulesRepository;

@Service
@Transactional
public class RulesService {
	@Autowired
	RulesRepository rulesRepo;
	
	public List<Rules> s_findAllRules(){
		return rulesRepo.findAll();
	}
	
	public Rules s_findRulesById(Long id) {
		Optional<Rules> optionalUser = rulesRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;			
		}
	}
	
	public Rules s_addRules(Rules rules) {
		return rulesRepo.save(rules);
	}
	
	public void s_deleteRules(Long id) {
		Optional<Rules> optionalUser = rulesRepo.findById(id);
		if(optionalUser.isPresent()) {
			rulesRepo.deleteById(id);
		}
	}

}
