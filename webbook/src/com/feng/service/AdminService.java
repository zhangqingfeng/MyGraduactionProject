package com.feng.service;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.AdminDao;
import com.feng.entity.Admin;

@Named
@Transactional
public class AdminService {
	@Inject
	private AdminDao adminDao;


	public Admin findByName(String username) {
		return adminDao.findByProperty("username", username);
	}


	
}
