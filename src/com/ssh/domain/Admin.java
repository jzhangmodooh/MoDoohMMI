package com.ssh.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
public class Admin implements Serializable {
	private static final long serialVersionUID = 3582690163778848537L;
	private Integer id;
	private String name;
	private String pass;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(Integer id, String name, String pass) {
		super();
		this.id = id;
		this.name = name;
		this.pass = pass;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", pass=" + pass + "]";
	}
}