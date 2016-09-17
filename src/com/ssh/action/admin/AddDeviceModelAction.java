package com.ssh.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.domain.DeviceModel;
import com.ssh.service.DeviceModelService;

public class AddDeviceModelAction extends ActionSupport {
	private static final long serialVersionUID = 2L;
	private DeviceModelService deviceModelService;
	private DeviceModel deviceModel;

	public DeviceModel getDeviceModel() {
		return this.deviceModel;
	}

	public void setDeviceModel(DeviceModel deviceModel) {
		this.deviceModel = deviceModel;
	}

	public void setDeviceModelService(DeviceModelService deviceModelService) {
		this.deviceModelService = deviceModelService;
	}

	public DeviceModelService getDeviceModelService() {
		return this.deviceModelService;
	}

	@Override
	public String execute() throws Exception {
//		System.out.println("AddDeviceModelAction++++++++++++++"+deviceModel.getModelName());
		this.deviceModelService.add(deviceModel);
		return SUCCESS;
	}
}
