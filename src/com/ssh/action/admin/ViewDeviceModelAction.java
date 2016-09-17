package com.ssh.action.admin;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.dao.QueryResult;
import com.ssh.service.DeviceModelService;

public class ViewDeviceModelAction extends ActionSupport {
	private static final long serialVersionUID = 6413415887315891325L;
	private DeviceModelService deviceModelService;
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public DeviceModelService getDeviceModelService() {
		return deviceModelService;
	}

	public void setDeviceModelService(DeviceModelService deviceModelService) {
		this.deviceModelService = deviceModelService;
	}


	@Override
	public String execute() {
		if (page <= 0) {
//			System.out.println("aaaaaaaaaaaaaa:");
			this.setPage(1); 
		}
		QueryResult result = this.deviceModelService.getDeviceModelList(this.page);
		
		Map request = (Map) ActionContext.getContext().get("request");
		if(result == null){
			request.put("deviceModelList", null);
			request.put("pageCount", 1);
		}else{
			request.put("deviceModelList", result.getResult());
			request.put("pageCount", result.getPageCount());
//			System.out.println("deviceModelView:"+result.getPageCount());
		}
		return SUCCESS;
	}

}
