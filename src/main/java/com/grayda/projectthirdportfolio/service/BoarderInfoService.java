package com.grayda.projectthirdportfolio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.grayda.projectthirdportfolio.models.BoarderInfo;
import com.grayda.projectthirdportfolio.repository.BoarderInfoRepository;

@Service
public class BoarderInfoService {
	
	@Autowired
	BoarderInfoRepository boarderInfoRepo;
	
	public List<BoarderInfo> s_findAllBoarderInfo(){
		return boarderInfoRepo.findAll(Sort.by(Sort.Direction.ASC,"lName"));
	}
	
	public BoarderInfo s_findBoarderInfoById(Long id) {
		Optional<BoarderInfo> optionalUser = boarderInfoRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;
		}
	}
	
	public BoarderInfo s_addBoarderInfo(BoarderInfo boarderInfo) {
		return boarderInfoRepo.save(boarderInfo);
	}
	
	public void s_deleteBoarderInfo(Long id) {
		Optional<BoarderInfo> optionalUser = boarderInfoRepo.findById(id);
		if(optionalUser.isPresent()) {
			boarderInfoRepo.deleteById(id);
		}
	}
}
