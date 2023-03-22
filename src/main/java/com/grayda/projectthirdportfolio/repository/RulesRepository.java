package com.grayda.projectthirdportfolio.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grayda.projectthirdportfolio.models.Rules;

@Repository
public interface RulesRepository extends CrudRepository<Rules, Long>{
	List<Rules> findAll();
}
