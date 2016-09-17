package com.ssh.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ssh.domain.DeviceModel;

public class DeviceModelDaoImpl implements DeviceModelDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(DeviceModel deviceModel) {
		Session session = sessionFactory.openSession();
		System.out.println(deviceModel.getModelName());
		session.save(deviceModel);
		session.flush();
		session.close();

	}

	@SuppressWarnings("rawtypes")
	@Override
	public DeviceModel getDeviceModelByName(String name) {
		Session session = sessionFactory.openSession();
		String hql = "from DeviceModel device_model where device_model.modelName  = '" + name + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			return (DeviceModel) list.get(0);
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public DeviceModel getDeviceModelById(int id) {
		Session session = sessionFactory.openSession();
		String hql = "from DeviceModel device_model where device_model.id = '" + id + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			return (DeviceModel) list.get(0);
		}
	}

	@Override
	public void update(DeviceModel deviceModel) {
		Session session = sessionFactory.openSession();
		session.update(deviceModel);
		session.flush();
		session.close();
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.openSession();
		String hql = "delete from DeviceModel device_model where device_model.id = " + id;
//		System.out.println("HQL+++++++++++++"+hql);
		Query query = session.createQuery(hql);
		query.executeUpdate();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResult getDeviceModelList(int page) {
		Session session = sessionFactory.openSession();
		QueryResult queryResult = new QueryResult();
		int pageSize = queryResult.getPageSize();
		int left = ((page - 1) * pageSize) > 0 ? (page - 1) * pageSize : 0;
		// int right = page * pageSize > 0 ? page * pageSize : 0;
		String hql = "from DeviceModel device_model order by device_model.id DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult(left);
		query.setMaxResults(pageSize);
		ArrayList<Object> deviceModelList = (ArrayList<Object>) query.list();
		String hql2 = "select count(*) from DeviceModel";
		Query query2 = session.createQuery(hql2);
		int count = ((Long) query2.uniqueResult()).intValue();
		queryResult.setResult(deviceModelList);
		queryResult.setPageCount(count);
		session.close();
		if (deviceModelList.isEmpty()) {
			return null;
		} else {
			return queryResult;
		}
	}

}
