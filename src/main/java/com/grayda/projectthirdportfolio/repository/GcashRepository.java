package com.grayda.projectthirdportfolio.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grayda.projectthirdportfolio.models.Gcash;

@Repository
public interface GcashRepository extends CrudRepository<Gcash, Long>{
	List<Gcash> findAll();
}
