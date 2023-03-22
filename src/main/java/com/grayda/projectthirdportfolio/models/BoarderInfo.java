package com.grayda.projectthirdportfolio.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="boarderInfo_tbl")
public class BoarderInfo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="First name must not be empty")
	@Size(min=3, max=120, message="First name must be 3-20 characters")
	private String fName;
	
	@NotEmpty(message="Last name must not be empty")
	@Size(min=3, max=120, message="Last name must be 3-20 characters")
	private String lName;
	
	@NotNull()
	@Min(18)
	private Integer age;	
	
	private String rooms;
	
	private String balance;	
	
	@Column(updatable = false)
	private Date oncreatedAt;
	
//====== FOR GCASH =============//
	@OneToOne(mappedBy = "boarderInfo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Gcash gcash;

//====== FOR USERBOARDER =============//	
	@OneToOne
	@JoinColumn(name = "userBoarder_id")
	private UserBoarder userBoarder;
	
	public BoarderInfo() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getRooms() {
		return rooms;
	}

	public void setRooms(String rooms) {
		this.rooms = rooms;
	}

	public Gcash getGcash() {
		return gcash;
	}

	public void setGcash(Gcash gcash) {
		this.gcash = gcash;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public UserBoarder getUserBoarder() {
		return userBoarder;
	}

	public void setUserBoarder(UserBoarder userBoarder) {
		this.userBoarder = userBoarder;
	}

	public Date getOncreatedAt() {
		return oncreatedAt;
	}

	public void setOncreatedAt(Date oncreatedAt) {
		this.oncreatedAt = oncreatedAt;
	}
	
	@PrePersist
    public void prePersist() {
        this.oncreatedAt = new Date();
    }

    @PreUpdate
    public void preUpdate() {
        this.oncreatedAt = new Date();
    }
}
