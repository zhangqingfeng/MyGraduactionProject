package com.feng.service;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.UserDao;
import com.feng.entity.User;
import com.feng.util.DateUtil;

@Named
@Transactional
public class UserService {

	@Inject
	private UserDao userDao;
	@Inject
	private JavaMailSenderImpl mailSend;
	
	public void save(final User user) {
		user.setCreatetime(DateUtil.getNow());
		user.setActive(false);
		user.setEnable(true);
		user.setPassword(DigestUtils.shaHex(user.getPassword()));
		userDao.save(user);
			Thread th = new Thread(new Runnable() {
			
			public void run() {
				SimpleMailMessage mes = new SimpleMailMessage();
				mes.setFrom("757166468@qq.com");
				mes.setSubject("ÕËºÅ¼¤»î");
				mes.setText("Çëµã»÷¼¤»î£ºhttp://www.feng.com/user/active/id?id="+user.getId());
				mes.setTo(user.getEmail());
				mailSend.send(mes);
			}
		});
		th.start();
	}

	public void findById(Integer id) {
		User u = userDao.findById(id);
		u.setActive(true);
		
	}

	public User findByProperty(String email) {
		return userDao.findByProperty("email", email);
	}

	public void update(User u) {
		User user = userDao.findById(u.getId());
		user.setPic(u.getPic());
	}
	
}
