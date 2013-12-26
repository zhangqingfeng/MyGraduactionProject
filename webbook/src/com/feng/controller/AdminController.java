package com.feng.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.feng.dao.Page;
import com.feng.dao.Where;
import com.feng.entity.Admin;
import com.feng.entity.Order;
import com.feng.service.AdminService;
import com.feng.service.OrderService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private AdminService adminService;
	@Inject
	private OrderService orderService;
	
	//安全退出
	@RequestMapping("/exit")
	public String exit(){
		return "redirect:/admin";
	}
	
	//登录成功的页面
	@RequestMapping(value="/home",method=RequestMethod.POST)
	public String home(Admin admin,HttpSession session){
		Admin a = adminService.findByName(admin.getUsername());
		if(a!=null){
			if(a.getPassword().equals(admin.getPassword())){
				session.setAttribute("admin", a);
				return "redirect:/admin/home";
			}
		}
		
		return "redirect:/admin";
	}
	
	@RequestMapping("/home")
	public String home(Model model){
		int size = orderService.findByProperty();
		model.addAttribute("size", size);
		return "admin/home";
	}
	//管理员登录页面
	@RequestMapping()
	public String index(){
		return "admin/login";
	}
	/**
	 * 成功订单
	 * @param model
	 * @return
	 */
	@RequestMapping("/oldorder")
	public String oldorder(Model model){
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(1);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("statu", "成功", "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "admin/oldorder";
	}
	@RequestMapping("/oldorder/{p:\\d+}")
	public String oldorderlater(@PathVariable Integer p,Model model){
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(p);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("statu", "成功", "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "admin/oldorder";
	}
	/**
	 * 新订单
	 * @param model
	 * @return
	 */
	@RequestMapping("/neworder")
	public String neworder(Model model){
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(1);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("statu", "付款成功", "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "admin/neworder";
	}
	@RequestMapping("/neworder/{p:\\d+}")
	public String neworderlater(@PathVariable Integer p,Model model){
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(p);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("statu", "付款成功", "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "admin/neworder";
	}
	/**
	 * 订单发送
	 * @return
	 */
	@RequestMapping("/shipments/{id:\\d+}")
	public String shipments(@PathVariable Integer id){
		orderService.updateOrder(id);
		return "redirect:/admin/neworder";
	}
}
