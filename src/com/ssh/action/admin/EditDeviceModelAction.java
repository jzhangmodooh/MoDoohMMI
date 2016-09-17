package com.ssh.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.domain.DeviceModel;
import com.ssh.service.DeviceModelService;

public class EditDeviceModelAction extends ActionSupport {
	private static final long serialVersionUID = 1162546203892287479L;
	private DeviceModelService deviceModelService;
	private DeviceModel deviceModel;

	public DeviceModelService getDeviceModelService() {
		return deviceModelService;
	}

	public void setDeviceModelService(DeviceModelService deviceModelService) {
		this.deviceModelService = deviceModelService;
	}

	public DeviceModel getDeviceModel() {
		return deviceModel;
	}

	public void setDeviceModel(DeviceModel deviceModel) {
		this.deviceModel = deviceModel;
	}

	@Override
	public String execute() {
		this.deviceModelService.update(deviceModel);
		return SUCCESS;
	}
}
