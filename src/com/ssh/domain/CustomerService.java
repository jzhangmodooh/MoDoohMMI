package com.ssh.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "customer_service")
public class CustomerService implements Serializable {
	private static final long serialVersionUID = 5942971011244949870L;
	private int id;
	private int userId;
	private int carModelId;
	private int time;
	private String reason;

	public CustomerService() {
	}

	public CustomerService(int id, int userId, int carModelId, int time, String reason) {
		this.id = id;
		this.userId = userId;
		this.carModelId = carModelId;
		this.time = time;
		this.reason = reason;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCarModelId() {
		return carModelId;
	}

	public void setCarModelId(int carModelId) {
		this.carModelId = carModelId;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
