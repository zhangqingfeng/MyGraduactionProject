package com.feng.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.feng.dao.BookDao;
import com.feng.dao.Page;
import com.feng.dao.Where;
import com.feng.entity.Book;

@Named
@Transactional
public class BookService {
	@Inject
	private BookDao bookDao;

	public void save(Book book) {
		bookDao.save(book);
	}

	public List<Book> findAll() {
		return bookDao.findAll();
	}

	public Book findById(Integer id) {
		return bookDao.findById(id);
	}

	public void delete(Integer id) {
		bookDao.del(id);
	}


	public Page<Book> findPage(List<Where> list, Page<Book> p) {
		return bookDao.find(list, p);
	}
	
}
