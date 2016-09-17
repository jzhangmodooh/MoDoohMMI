package com.ssh.action.admin;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.opensymphony.xwork2.Action;
import com.ssh.domain.DeviceModel;
import com.ssh.service.DeviceModelService;

public class GetDeviceModelByIdAction implements Action {
	private int id;
	private InputStream inputStream;
	private DeviceModelService deviceModelService;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public DeviceModelService getDeviceModelService() {
		return deviceModelService;
	}

	public InputStream getResult() {
		return this.inputStream;
	}

	public void setDeviceModelService(DeviceModelService deviceModelService) {
		this.deviceModelService = deviceModelService;
	}

	@Override
	public String execute() throws Exception {
		DeviceModel deviceModel = deviceModelService.getDeviceModelById(id);
		if (deviceModel == null)
			inputStream = new ByteArrayInputStream("null".getBytes("UTF-8"));
		else
			inputStream = new ByteArrayInputStream(deviceModel.getModelName().getBytes("UTF-8"));
		return SUCCESS;
	}

}
