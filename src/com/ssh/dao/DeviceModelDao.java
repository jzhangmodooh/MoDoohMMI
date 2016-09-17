package com.ssh.dao;

import com.ssh.domain.DeviceModel;

public interface DeviceModelDao {

	public QueryResult getDeviceModelList(int page);

	public void add(DeviceModel deviceModel);

	public DeviceModel getDeviceModelByName(String name);

	public DeviceModel getDeviceModelById(int id);

	public void update(DeviceModel deviceModel);

	public void delete(int id);
}
