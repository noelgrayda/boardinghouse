package com.grayda.projectthirdportfolio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grayda.projectthirdportfolio.models.BoarderInfo;

@Repository
public interface BoarderInfoRepository extends JpaRepository<BoarderInfo, Long>{
	List<BoarderInfo> findAll();
}
