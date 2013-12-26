package com.feng.controller;

import imageUtil.ImageLoader;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.feng.dao.Page;
import com.feng.dao.Where;
import com.feng.entity.Book;
import com.feng.entity.Order;
import com.feng.entity.Type;
import com.feng.entity.User;
import com.feng.service.BookService;
import com.feng.service.OrderService;
import com.feng.service.TypeService;
import com.feng.service.UserService;
import com.feng.util.FileUpLoad;

@Controller
@RequestMapping("/user")
public class UserController {
	@Inject
	private UserService userService;
	@Inject
	private BookService bookService;
	@Inject
	private TypeService typeService;
	@Inject
	private OrderService orderService;
	/**
	 * 登录首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	/**
	 * 注册页面
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/reg",method=RequestMethod.GET)
	private String reg(){
		return "reg";
	}
	/**
	 * 验证邮件
	 * @param email
	 * @return
	 */
	@RequestMapping("/validate/email")
	@ResponseBody
	public String validateEmail(@RequestParam("email") String email){
		User u = userService.findByProperty(email);
		if(u!=null){
			return "false";
		}
		return "true";
	}
	/**
	 * 验证昵称
	 * @param userName
	 * @return
	 */
	
	@RequestMapping("/validate/userName")
	@ResponseBody
	public String validateUsername(@RequestParam("userName") String userName){
		User u = userService.findByProperty(userName);
		if(u!=null){
			return "false";
		}
		return "true";
	}
	/**
	 * 提交注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/reg",method=RequestMethod.POST)
	public String reg(User user){
		userService.save(user);
		return "redirect:/user/info";
	}
	/**
	 * 注册成功提示信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/info")
	public String info(Model model){
		model.addAttribute("mestitle", "注册成功");
		model.addAttribute("mesbody", "你的账户注册成功，请登录你的邮箱激活");
		return "info";
	}
	/**
	 * 激活
	 * @param id
	 * @return
	 */
	@RequestMapping("/active/id")
	public String active(@RequestParam(value="id") Integer id){
		userService.findById(id);
		return "redirect:/user/index";
	}
	/**
	 * 用户登录并且保存到session
	 * @param user
	 * @param redirectAttributes
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,Model model,HttpSession session){
		User u = userService.findByProperty(user.getEmail());
		String encode = "";
		if(u == null || !user.getPassword().equals(u.getPassword())) {
			encode = "1001";
			model.addAttribute("code", encode);
			return "index";
		} else {
			if(!u.isActive()) {
				encode = "1002";
				model.addAttribute("code", encode);
				return "index";
			} else if(!u.isEnable()) {
				encode = "1003";
				model.addAttribute("code", encode);
				return "index";
			} else {
				session.setAttribute("user", u);
				return "redirect:/user/home";
			}
		}
		
	}
	/**
	 * 用户登录首页
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/home")
	public String home(Model model,HttpSession session){
		Page<Book> page = new Page<Book>();
		page.setPageNum(1);
		page = bookService.findPage(new ArrayList<Where>(),page);
		model.addAttribute("page", page);
		
		List<Type> typeLisk = typeService.findAll();
		session.setAttribute("typeList", typeLisk);
		return "home";
	}
	@RequestMapping(value=("/home/{p:\\d+}"))
	public String homelater(@PathVariable Integer p,Model model,HttpSession session){
		Page<Book> page = new Page<Book>();
		page.setPageNum(p);
		page = bookService.findPage(new ArrayList<Where>(),page);
		model.addAttribute("page", page);
		
		List<Type> typeLisk = typeService.findAll();
		session.setAttribute("typeList", typeLisk);
		return "home";
	}
	/**
	 * 根据类型查询书籍
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/type/{id:\\d+}")
	public String typePage(@PathVariable Integer id,Model model){
		Type type = typeService.findById(id);
		Page<Book> page = new Page<Book>();
		page.setOrder("createTime");
		page.setOrderBy("desc");
		page.setPageNum(1);
		ArrayList<Where> list = new ArrayList<Where>();
		list.add(new Where("type",type,"eq"));
		page = bookService.findPage(list,page);
		model.addAttribute("typepage", page);
		model.addAttribute("type", type);
		return "typebook";
	}
	@RequestMapping("/type/{id:\\d+}/{p:\\d+}")
	public String typePagelater(@PathVariable Integer id,@PathVariable Integer p,Model model){
		Type type = typeService.findById(id);
		Page<Book> page = new Page<Book>();
		page.setOrder("createTime");
		page.setOrderBy("desc");
		page.setPageNum(p);
		ArrayList<Where> list = new ArrayList<Where>();
		list.add(new Where("type",type,"eq"));
		page = bookService.findPage(list,page);
		model.addAttribute("typepage", page);
		model.addAttribute("type", type);
		return "typebook";
	}
	/**
	 * 根据书籍名称查找书籍
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String search(HttpServletRequest request,Model model){
		List<Where> list = Where.builderWhereListByRequest(request);
		Page<Book> page = new Page<Book>();
		page.setOrder("createTime");
		page.setOrderBy("desc");
		page.setPageNum(1);
		page = bookService.findPage(list,page);
		model.addAttribute("searchpage", page);
		return "search";
	}
	
	@RequestMapping("/search/{p:\\d+}")
	public String searchlater(@PathVariable Integer p,HttpServletRequest request,Model model){
		List<Where> list = Where.builderWhereListByRequest(request);
		Page<Book> page = new Page<Book>();
		page.setOrder("createTime");
		page.setOrderBy("desc");
		page.setPageNum(p);
		page = bookService.findPage(list,page);
		model.addAttribute("searchpage", page);
		return "search";
	}
	/**
	 * 安全退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:/user/index";
	}
	/**
	 * 进入用户信息页面
	 * @return
	 */
	@RequestMapping("userinfo")
	public String userinfo(){
		return "userinfo";
	}
	/**
	 * 显示未付款的订单
	 */
	@RequestMapping("dealorder")
	public String dealorder(HttpSession session,Model model){
		User u = (User) session.getAttribute("user");
		Page<Order> orderPage = new Page<Order>();
		orderPage.setPageNum(1);
		orderPage.setOrder("createtime");
		orderPage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("user", u, "eq"));
		list.add(new Where("pay", false, "eq"));
		orderPage = orderService.findPage((ArrayList<Where>) list,orderPage);
		model.addAttribute("orderPage", orderPage);
		return "dealorder";
	}
	@RequestMapping("/dealorder/{p:\\d+}")
	public String dealorderlater(@PathVariable Integer p,HttpSession session,Model model){
		User u = (User) session.getAttribute("user");
		Page<Order> orderPage = new Page<Order>();
		orderPage.setPageNum(p);
		orderPage.setOrder("createtime");
		orderPage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("user", u, "eq"));
		list.add(new Where("pay", false, "eq"));
		orderPage = orderService.findPage((ArrayList<Where>) list,orderPage);
		model.addAttribute("orderPage", orderPage);
		return "dealorder";
	}
	/**
	 * 显示成功的订单
	 */
	@RequestMapping("myorder")
	public String myorder(HttpSession session,Model model){
		User u = (User) session.getAttribute("user");
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(1);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("user", u, "eq"));
		list.add(new Where("pay", true, "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "myorder";
	}
	/**
	 * 订单分页
	 * @param p
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/myorder/{p:\\d+}")
	public String myorderlater(@PathVariable Integer p,HttpSession session,Model model){
		User u = (User) session.getAttribute("user");
		Page<Order> mypage = new Page<Order>();
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		mypage.setPageNum(p);
		mypage.setOrder("createtime");
		mypage.setOrderBy("desc");
		List<Where> list = new ArrayList<Where>();
		list.add(new Where("user", u, "eq"));
		list.add(new Where("pay", true, "eq"));
		mypage = orderService.findPage((ArrayList<Where>) list,mypage);
		model.addAttribute("mypage", mypage);
		return "myorder";
	}
	/**
	 * 用户头像
	 * @return
	 */
	@RequestMapping("/img")
	public String userPic(){
		return "userpic";
	}
	/**
	 * 处理头像图片
	 * @return
	 */
	@RequestMapping(value="/portpic",method=RequestMethod.POST)
	@ResponseBody
	public String portpic(HttpSession session,HttpServletRequest request,MultipartFile userfile,Integer x1,Integer x2,Integer y1,Integer y2){
		String path = FileUpLoad.uploadFile(request, userfile);
		try {
			File file = new File("d:/upload",path);
			ImageLoader.fromFile(file).crop(x1,y1,x2,y2).writeToFile(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		User u = (User) session.getAttribute("user");
		u.setPic(path);
		userService.update(u);
		return "suc";
	}
}
