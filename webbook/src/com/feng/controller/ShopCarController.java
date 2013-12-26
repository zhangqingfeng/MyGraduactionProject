package com.feng.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feng.entity.Book;
import com.feng.entity.CarItem;
import com.feng.service.BookService;

@Controller
@RequestMapping("/shopCar")
public class ShopCarController {

	@Inject
	private BookService bookService;
	/**
	 * 添加商品到购物车
	 * @param id
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/add/{id:\\d+}")
	public String addBook(@PathVariable Integer id,HttpSession session){
		Book b = bookService.findById(id);
		CarItem item = new CarItem();
		item.setBook(b);
		item.setNum(1);
		List<CarItem> list = (List<CarItem>) session.getAttribute("shopcar");
		if(list==null){
			list = new ArrayList<CarItem>(); 
			session.setAttribute("shopcar", list);
			 list.add(item);
		}else{
			boolean flag = false;
			for (CarItem c : list) {
				if(id.equals(c.getBook().getId())){
					c.setNum(c.getNum()+1);
					flag = true;
					break;
				}
			}
			if(!flag){
				list.add(item);
			}
		}
		session.setAttribute("shopcar", list);
		
		return "redirect:/shopCar";
	}
	/**
	 * 显示购物车
	 * @return
	 */
	@RequestMapping()
	public String shopcar(){
		return "shopCar";
	}
	/**
	 * 删除购物车的选定书籍
	 * @param id
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/delete/{id:\\d+}")
	public String delete(@PathVariable Integer id,HttpSession session){
		List<CarItem> list = (List<CarItem>) session.getAttribute("shopcar");
			for (CarItem item : list) {
				if(item.getBook().getId().equals(id)){
					list.remove(item);
					session.setAttribute("shopcar", list);
					return "redirect:/shopCar";
				}
			}
			return "redirect:/shopCar";
	}
	
}
