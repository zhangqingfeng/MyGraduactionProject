package com.feng.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.OrderItemDao;
import com.feng.entity.CarItem;
import com.feng.entity.Order;
import com.feng.entity.OrderItem;
import com.feng.util.DateUtil;

@Named
@Transactional
public class OrderItemService {
	@Inject
	private OrderItemDao orderItemDao;
	
	/**
	 * ±£¥Ê∂©µ•œÍ«È
	 * @param carItem
	 * @param o
	 */
	public void save(List<CarItem> carItem, Order o) {
		for (CarItem item : carItem) {
			OrderItem orderItem = new OrderItem();
			orderItem.setBookname(item.getBook().getBookName());
			orderItem.setNum(item.getNum());
			orderItem.setBookprice(item.getBook().getPrice());
			orderItem.setTotle(orderItem.getBookprice()*orderItem.getNum());
			orderItem.setCreatetime(DateUtil.getNow());
			orderItem.setOrder(o);
			orderItemDao.save(orderItem);
		}
	}
}
