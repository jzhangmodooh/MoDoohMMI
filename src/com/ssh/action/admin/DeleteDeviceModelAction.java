package com.ssh.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.service.DeviceModelService;

public class DeleteDeviceModelAction extends ActionSupport {
	private static final long serialVersionUID = 8643100745849114901L;
	private DeviceModelService deviceModelService;
	private int id;

	public DeviceModelService getDeviceModelService() {
		return deviceModelService;
	}

	public void setDeviceModelService(DeviceModelService deviceModelService) {
		this.deviceModelService = deviceModelService;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String execute() {
		System.out.println("DeleteDeviceModelAction------------"+id);
		this.deviceModelService.delete(id);
		return SUCCESS;
	}
}
