package com.grayda.projectthirdportfolio.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.grayda.projectthirdportfolio.models.UserBoarder;

@Repository
public interface UserBoarderRepository extends CrudRepository<UserBoarder, Long>{
	List<UserBoarder> findAll();
	Optional<UserBoarder> findByEmail(String email);
}
