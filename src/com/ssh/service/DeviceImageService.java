package com.ssh.service;

import java.util.List;

import com.ssh.domain.DeviceImage;

public interface DeviceImageService {
	@SuppressWarnings("rawtypes")
	public List getByDeviceModelId(int deviceModelId);

	@SuppressWarnings("rawtypes")
	public List getById(int id);

	public void add(DeviceImage deviceImage);

	public void update(DeviceImage deviceImage);

	public void delete(int id);
}
