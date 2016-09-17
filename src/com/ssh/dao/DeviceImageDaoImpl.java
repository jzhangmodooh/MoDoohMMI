package com.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ssh.domain.DeviceImage;

public class DeviceImageDaoImpl implements DeviceImageDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getByDeviceModelId(int deviceModelId) {
		Session session = sessionFactory.openSession();
		String hql = "from DeviceImage device_image where device_image.deviceModelId='" + deviceModelId + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getById(int id) {
		Session session = sessionFactory.openSession();
		String hql = "from DeviceImage device_image where device_image.id='" + id + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			{
				return list;
			}
		}
	}

	@Override
	public void add(DeviceImage deviceImage) {
		Session session = sessionFactory.openSession();
		session.save(deviceImage);
		session.flush();
		session.close();
	}

	@Override
	public void update(DeviceImage deviceImage) {
		Session session = sessionFactory.openSession();
		session.update(deviceImage);
		session.flush();
		session.close();

	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.openSession();
		String hql = "delete from DeviceImage device_image where device_image.id='" + id + "'";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		session.close();
	}
}
