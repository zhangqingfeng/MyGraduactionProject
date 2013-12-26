package com.feng.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.PublishDao;
import com.feng.entity.Publish;
import com.feng.util.DateUtil;

@Named
@Transactional
public class PublishService {
	@Inject
	private PublishDao publishDao;

	public List<Publish> findAll() {
		return publishDao.findAll();
	}

	public void save(Publish publish) {
		publish.setCreatetime(DateUtil.getNow());
		publishDao.save(publish);
	}

	public Publish findById(Integer id) {
		return publishDao.findById(id);
	}

	public void update(Publish publish) {
		Publish p = publishDao.findById(publish.getId());
		p.setPubname(publish.getPubname());
	}

	public void delete(Publish publish) {
		publishDao.del(publish.getId());
	}
	
}
