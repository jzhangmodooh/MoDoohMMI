package com.ssh.action.admin;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.service.DeviceImageService;

@SuppressWarnings("serial")
public class ViewDeviceImageAction extends ActionSupport {
	private int deviceModelId;
	private DeviceImageService deviceImageService;

	public int getDeviceModelId() {
		return deviceModelId;
	}

	public void setDeviceModelId(int deviceModelId) {
		this.deviceModelId = deviceModelId;
	}

	public DeviceImageService getDeviceImageService() {
		return deviceImageService;
	}

	public void setDeviceImageService(DeviceImageService deviceImageService) {
		this.deviceImageService = deviceImageService;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String execute() {
		List deviceImageList = this.deviceImageService.getByDeviceModelId(deviceModelId);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("deviceImageList", deviceImageList);
		return SUCCESS;
	}
}
