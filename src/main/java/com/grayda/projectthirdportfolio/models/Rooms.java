package com.grayda.projectthirdportfolio.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
@Table(name="room_tbl")
public class Rooms {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Room name must not be empty")
	@Size(min=5, max=120, message="Room name must be 5-30 characters")
	private String roomName;
	
	@NotEmpty(message="Description must not be empty")
	@Size(min=5, max=120, message="Description must be 5-30 characters")
	private String description;
	
	@NotEmpty(message="Creator must not be empty")
	@Size(min=5, max=120, message="Creator must be 5-30 characters")
	private String creator;
	
	private String status;
	
	private String renter;
	
	@ManyToOne
    @JoinColumn(name="user_id")
    private User user;


	public Rooms() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRenter() {
		return renter;
	}

	public void setRenter(String renter) {
		this.renter = renter;
	}
}
