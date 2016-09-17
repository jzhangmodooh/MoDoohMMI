package com.ssh.service;

import org.hibernate.HibernateException;

import com.ssh.dao.DeviceModelDao;
import com.ssh.dao.QueryResult;
import com.ssh.domain.DeviceModel;

public class DeviceModelServiceImpl implements DeviceModelService {
	private DeviceModelDao deviceModelDao;

	public void setDeviceModelDao(DeviceModelDao dao) {
		this.deviceModelDao = dao;
	}

	@Override
	public void add(DeviceModel deviceModel) throws HibernateException {
		this.deviceModelDao.add(deviceModel);

	}

	@Override
	public DeviceModel getDeviceModelByName(String name) throws HibernateException {
		return this.deviceModelDao.getDeviceModelByName(name);
	}

	@Override
	public DeviceModel getDeviceModelById(int id) throws HibernateException {
		return this.deviceModelDao.getDeviceModelById(id);
	}

	@Override
	public void update(DeviceModel deviceModel) throws HibernateException {
		this.deviceModelDao.update(deviceModel);
	}

	@Override
	public void delete(int id) throws HibernateException {
		this.deviceModelDao.delete(id);
	}

	@Override
	public QueryResult getDeviceModelList(int page) {
		return this.deviceModelDao.getDeviceModelList(page);

	}

}
