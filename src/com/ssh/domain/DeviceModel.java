package com.ssh.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "device_model")
public class DeviceModel implements Serializable {
	private static final long serialVersionUID = 54268139287962912L;
	private int id;
	private String modelName;
	private String doorCount;
	private String seatCount;
	private int price;
	private int engineSpeed;
	private String color;
	private int storage;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "modelName")
	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getDoorCount() {
		return doorCount;
	}

	public void setDoorCount(String doorCount) {
		this.doorCount = doorCount;
	}

	public String getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(String seatCount) {
		this.seatCount = seatCount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getEngineSpeed() {
		return engineSpeed;
	}

	public void setEngineSpeed(int engineSpeed) {
		this.engineSpeed = engineSpeed;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getStorage() {
		return storage;
	}

	public void setStorage(int storage) {
		this.storage = storage;
	}

}
