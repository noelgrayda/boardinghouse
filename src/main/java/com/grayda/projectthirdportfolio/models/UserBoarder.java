package com.grayda.projectthirdportfolio.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
@Table(name="userBoarder_tbl")
public class UserBoarder {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Username must not be blank")
	@Size(min=5, max=120, message="Username must have 5-50 characters")
	private String username;
	
	@NotEmpty(message="Email Address must not be blank")
	@Email(message="Email must be valid")
	private String email;
	
	@NotEmpty(message="Password must not be blank")
	@Size(min=5, max=120, message="Password must have 5-50 characters")
	private String password;
	
	@Transient
	@NotEmpty(message="Confirm Password must not be blank")
	@Size(min=5, max=120, message="Confirm Password must have 5-50 characters")
	private String confirm;
	
//====== FOR BOARDERINFO =============//
	@OneToOne(mappedBy = "userBoarder", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private BoarderInfo boarderInfo;

	
	public UserBoarder() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public BoarderInfo getBoarderInfo() {
		return boarderInfo;
	}

	public void setBoarderInfo(BoarderInfo boarderInfo) {
		this.boarderInfo = boarderInfo;
	}
}
