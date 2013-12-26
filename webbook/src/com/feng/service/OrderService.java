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
	 * 保存订单
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
		order.setStatu("待付款");
		return orderDao.saveForId(order);
	}

	public Order findById(Integer id) {
		return orderDao.findById(id);
	}
	/**
	 * 返回未付款的订单
	 * @param list
	 * @param orderPage
	 * @return
	 */
	public Page<Order> findPage(ArrayList<Where> list,
			Page<Order> orderPage) {
		
		return orderDao.find(list, orderPage);
	}
	/**
	 * 订单成功支付
	 * @param id
	 */
	public void update(Integer id) {
		Order o = orderDao.findById(id);
		o.setPay(true);
		o.setStatu("付款成功");
	}
	public void updateOrder(Integer id) {
		Order o = orderDao.findById(id);
		o.setStatu("成功");
	}

	public int findByProperty() {
		List<Order> list = orderDao.findListByProperty("statu", "付款成功");
		return list.size();
	}
}
