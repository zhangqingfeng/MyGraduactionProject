package com.feng.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.OrderDao;
import com.feng.dao.Page;
import com.feng.dao.Where;
import com.feng.entity.Order;
import com.feng.entity.User;
import com.feng.util.DateUtil;

@Named
@Transactional
public class OrderService {
	@Inject
	private OrderDao orderDao;
	/**
	 * ���涩��
	 * @param order
	 * @param u
	 * @param totle
	 * @return
	 */
	public Integer save(Order order, User u, float totle) {
		order.setPay(false);
		order.setCreatetime(DateUtil.getNow());
		order.setUser(u);
		order.setTotle(totle);
		order.setStatu("������");
		return orderDao.saveForId(order);
	}

	public Order findById(Integer id) {
		return orderDao.findById(id);
	}
	/**
	 * ����δ����Ķ���
	 * @param list
	 * @param orderPage
	 * @return
	 */
	public Page<Order> findPage(ArrayList<Where> list,
			Page<Order> orderPage) {
		
		return orderDao.find(list, orderPage);
	}
	/**
	 * �����ɹ�֧��
	 * @param id
	 */
	public void update(Integer id) {
		Order o = orderDao.findById(id);
		o.setPay(true);
		o.setStatu("����ɹ�");
	}
	public void updateOrder(Integer id) {
		Order o = orderDao.findById(id);
		o.setStatu("�ɹ�");
	}

	public int findByProperty() {
		List<Order> list = orderDao.findListByProperty("statu", "����ɹ�");
		return list.size();
	}
}
