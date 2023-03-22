package com.grayda.projectthirdportfolio.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="gcash_tbl")
public class Gcash {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Pattern(regexp="\\d{10}", message="Mobile number must be a 10-digit number")
	@NotNull(message="Must enter gcash number")
	private String gcash;
	
	@OneToOne
	@JoinColumn(name = "boarderInfo_id")
	private BoarderInfo boarderInfo;
	
	public Gcash() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getGcash() {
		return gcash;
	}

	public void setGcash(String gcash) {
		this.gcash = gcash;
	}

	public BoarderInfo getBoarderInfo() {
		return boarderInfo;
	}

	public void setBoarderInfo(BoarderInfo boarderInfo) {
		this.boarderInfo = boarderInfo;
	}

}