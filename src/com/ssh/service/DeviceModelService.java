package com.ssh.service;

import org.hibernate.HibernateException;

import com.ssh.dao.QueryResult;
import com.ssh.domain.DeviceModel;

public interface DeviceModelService {
	public QueryResult getDeviceModelList(int page);

	public void add(DeviceModel carModel) throws HibernateException;

	public DeviceModel getDeviceModelByName(String name) throws HibernateException;

	public DeviceModel getDeviceModelById(int id) throws HibernateException;

	public void update(DeviceModel carModel) throws HibernateException;

	public void delete(int id) throws HibernateException;
}
