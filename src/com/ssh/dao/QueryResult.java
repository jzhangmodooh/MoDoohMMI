package com.ssh.dao;

import java.util.ArrayList;

//封装了分页查询的返回结果
public class QueryResult {
	private ArrayList<Object> result;
	private int pageSize = 12;
	private int pageCount;

	public ArrayList<Object> getResult() {
		return result;
	}

	public void setResult(ArrayList<Object> result) {
		this.result = result;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int count) {
		if (count % pageSize > 0)
			this.pageCount = count / pageSize + 1;
		else
			this.pageCount = count / pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
