package com.feng.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.feng.dao.Page;
import com.feng.dao.Where;
import com.feng.entity.Book;
import com.feng.entity.Publish;
import com.feng.entity.Type;
import com.feng.service.BookService;
import com.feng.service.PublishService;
import com.feng.service.TypeService;
import com.feng.util.DateUtil;
import com.feng.util.FileUpLoad;
@Controller
@RequestMapping("/admin/book")
public class BookController {
	@Inject
	private BookService bookService;
	@Inject
	private PublishService publishService;
	@Inject
	private TypeService typeService;
	
	@RequestMapping
	public String book(Model model){
		Page<Book> page = new Page<Book>();
		page.setPageNum(1);
		page = bookService.findPage(new ArrayList<Where>(),page);
		model.addAttribute("page", page);
		return "/admin/book";
	}
	@RequestMapping("/p/{id:\\d+}")
	public String book(@PathVariable Integer id,Model model){
		Page<Book> page = new Page<Book>();
		page.setPageNum(id);
		page = bookService.findPage(new ArrayList<Where>(),page);
		model.addAttribute("page", page);
		return "/admin/book";
	}
	@RequestMapping(value="/new",method=RequestMethod.GET)
	public String newbook(Model model){
		List<Type> typeLisk = typeService.findAll();
		List<Publish> publishList = publishService.findAll();
		model.addAttribute("typeLisk", typeLisk);
		model.addAttribute("publishList", publishList);
		return "/admin/newbook";
	}
	@RequestMapping(value="/new",method=RequestMethod.POST)
	public String newbook(Book book,Integer typeid,Integer publishid,MultipartFile file,HttpServletRequest request){
		Type t = typeService.findById(typeid);
		Publish p = publishService.findById(publishid);
		String fileName = FileUpLoad.uploadFile(request, file);
		book.setCreateTime(DateUtil.getNow());
		book.setPic(fileName);
		book.setDangerNum(5);
		book.setStatu("дкЪл");
		book.setType(t);
		book.setPublish(p);
		bookService.save(book);
		return "redirect:/admin/book";
	}
	@RequestMapping(value="/edit/{id:\\d+}",method=RequestMethod.GET)
	public String editbook(@PathVariable Integer id,Model model){
		List<Type> typeLisk = typeService.findAll();
		List<Publish> publishList = publishService.findAll();
		model.addAttribute("typeLisk", typeLisk);
		model.addAttribute("publishList", publishList);
		Book b = bookService.findById(id);
		model.addAttribute("book", b);
		return "/admin/editbook";
	}
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String editbook(Book book,Integer typeid,Integer publishid){
		Book b = bookService.findById(book.getId());
		if(!b.getType().getId().equals(typeid)){
			Type t = typeService.findById(typeid);
			b.setType(t);
		}
		if(!b.getPublish().getId().equals(publishid)){
			Publish p = publishService.findById(publishid);
			b.setPublish(p);
		}
		b.setAuthorContent(book.getAuthorContent());
		b.setBookAuthor(book.getBookAuthor());
		b.setBookName(book.getBookName());
		b.setBookNum(book.getBookNum());
		b.setContent(book.getContent());
		b.setDangerNum(book.getDangerNum());
		b.setPageNum(book.getPageNum());
		b.setPerface(book.getPerface());
		b.setPrice(book.getPrice());
		b.setSalePrice(book.getSalePrice());
		bookService.save(b);
		return "redirect:/admin/book/";
	}
	@RequestMapping("/delete")
	public String delete(Integer id){
		bookService.delete(id);
		return "redirect:/admin/book/";
	}
	@RequestMapping("/showImage/{pic}")
	public String showPic(@PathVariable String pic,HttpServletResponse response) throws IOException{
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new File("D:/upload",pic.concat(".jpg"))));
		OutputStream out = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		int len = -1;
		while((len = bis.read(buffer)) != -1) {
			out.write(buffer, 0, len);
		}
		
		out.flush();
		out.close();
		return null;
	}
}
