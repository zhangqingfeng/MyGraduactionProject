package com.feng.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feng.entity.CarItem;
import com.feng.entity.Order;
import com.feng.entity.User;
import com.feng.service.OrderItemService;
import com.feng.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	private OrderService orderService;
	@Inject
	private OrderItemService orderItemService;
	/**
	 * 订单页面
	 * @return
	 */
	@RequestMapping
	public String order(){
		return "order";
	}
	/**
	 * 订单提交
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/submit")
	public String submit(Order order,HttpSession session){
		User u = (User) session.getAttribute("user");
		List<CarItem> carItem = (List<CarItem>) session.getAttribute("shopcar");
		System.out.println(order.getPaytype());
		float totle = 0;
		for (CarItem item : carItem) {
			totle+=item.getBook().getPrice()*item.getNum();
		}
		session.removeAttribute("shopcar");
		Integer id = orderService.save(order,u,totle);
		Order o = orderService.findById(id);
		orderItemService.save(carItem,o);
		return "orderinfo";
	}
	@RequestMapping("/pay/{id:\\d+}")
	public String pay(@PathVariable Integer id){
		orderService.update(id);
		return "redirect:/user/dealorder";
	}
}
