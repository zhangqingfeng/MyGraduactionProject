package com.feng.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.TypeDao;
import com.feng.entity.Type;
import com.feng.util.DateUtil;

@Named
@Transactional
public class TypeService {
	@Inject
	private TypeDao typeDao;

	public void save(Type type) {
		type.setCreatetime(DateUtil.getNow());
		typeDao.save(type);
	}

	public List<Type> findAll() {
		return typeDao.findAll();
	}

	public Type findById(Integer id) {
		return typeDao.findById(id);
	}

	public void update(Type type) {
		Type t = typeDao.findById(type.getId());
		t.setTypeName(type.getTypeName());
	}

	public void delete(Type type) {
		typeDao.del(type.getId());
	}
	
}
