package com.feng.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.feng.entity.Book;
import com.feng.entity.Comment;
import com.feng.entity.User;
import com.feng.service.BookService;
import com.feng.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Inject
	private CommentService commentService;
	@Inject
	private BookService bookService;
	/**
	 * 书籍详细信息以及评论
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id:\\d+}")
	public String show(@PathVariable Integer id,Model model){
		Book b = commentService.findById(id);
		List<Comment> list = commentService.findByProperty(b);
		model.addAttribute("book", b);
		model.addAttribute("commentList",list);
		return "show";
	}
	/**
	 * 添加评论
	 * @param comment
	 * @param bookid
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/add")
	public String addComment(Comment comment,Integer bookid,Model model,HttpSession session){
		User u = (User) session.getAttribute("user");
		Book b = bookService.findById(bookid);
		comment.setBook(b);
		comment.setUser(u);
		commentService.save(comment);
		return "redirect:/comment/"+bookid;
	}
}
