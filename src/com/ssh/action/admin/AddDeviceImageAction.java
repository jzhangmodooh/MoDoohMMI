package com.ssh.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.domain.DeviceImage;
import com.ssh.service.DeviceImageService;
//@Component
public class AddDeviceImageAction extends ActionSupport {
	private static final long serialVersionUID = -8825572473566455701L;
	private DeviceImageService deviceImageService;
	private List<File> uploadFile;
	private List<String> uploadFileFileName;
	private List<String> uploadFileContentType;

	public List<String> getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(List<String> uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public List<String> getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(List<String> uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	private int deviceModelId;

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

	public List<File> getUploadFile() {
		return this.uploadFile;
	}

	public void setUploadFile(List<File> uploadFile) {
		this.uploadFile = uploadFile;
	}
	

	public String upload() throws IOException {
		String realpath = ServletActionContext.getServletContext().getRealPath("/assets/upload");
//		System.out.println("mmmmmmmmm"+realpath);
		if (uploadFile != null) {
			File savepath = new File(realpath);
			if (!savepath.exists())
				savepath.mkdirs();
			for (int i = 0; i < uploadFile.size(); i++) {
				File savefile = new File(realpath, uploadFileFileName.get(i));
				DeviceImage deviceImage = new DeviceImage(this.deviceModelId, "/assets/upload/" + uploadFileFileName.get(i));
				this.deviceImageService.add(deviceImage);
				FileUtils.copyFile(uploadFile.get(i), savefile);
			}
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("message", "Upload Succeed!");
			return SUCCESS;
		}
		return ERROR;
	}
}
