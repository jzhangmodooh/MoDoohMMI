package com.ssh.service;

import java.util.List;

import com.ssh.dao.DeviceImageDao;
import com.ssh.domain.DeviceImage;

public class DeviceImageServiceImpl implements DeviceImageService {
	private DeviceImageDao deviceImageDao;

	public DeviceImageDao getDeviceImageDao() {
		return deviceImageDao;
	}

	public void setDeviceImageDao(DeviceImageDao deviceImageDao) {
		this.deviceImageDao = deviceImageDao;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getByDeviceModelId(int deviceModelId) {
		return this.deviceImageDao.getByDeviceModelId(deviceModelId);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getById(int id) {

		return this.deviceImageDao.getById(id);
	}

	@Override
	public void add(DeviceImage deviceImage) {
		this.deviceImageDao.add(deviceImage);

	}

	@Override
	public void update(DeviceImage deviceImage) {
		this.deviceImageDao.update(deviceImage);

	}

	@Override
	public void delete(int id) {
		this.deviceImageDao.delete(id);

	}

}
