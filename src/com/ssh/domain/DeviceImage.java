package com.ssh.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "device_image")
public class DeviceImage implements Serializable {
	private static final long serialVersionUID = 8939778162583957656L;
	private int id;
	private int deviceModelId;
	private String imgUrl;

	public DeviceImage() {

	}

	public DeviceImage(int deviceModelId, String imgUrl) {
		this.deviceModelId = deviceModelId;
		this.imgUrl = imgUrl;
	}

	public int getDeviceModelId() {
		return deviceModelId;
	}

	public void setDeviceModelId(int deviceModelId) {
		this.deviceModelId = deviceModelId;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
