package com.feng.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.BookDao;
import com.feng.dao.CommentDao;
import com.feng.entity.Book;
import com.feng.entity.Comment;
import com.feng.util.DateUtil;

@Named
@Transactional
public class CommentService {
	@Inject
	private CommentDao commentDao;
	@Inject
	private BookDao bookDao;
	/**
	 *  ÈºÆœÍœ∏–≈œ¢
	 * @param id
	 * @return
	 */
	public Book findById(Integer id) {
		return bookDao.findById(id);
	}
	public void save(Comment comment) {
		comment.setCreateTime(DateUtil.getNow());
		commentDao.save(comment);
	}
	public List<Comment> findByProperty(Book b) {
		return commentDao.findListByProperty("book", b);
	}
	
}
