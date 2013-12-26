package com.feng.entity;

public class CarItem {

	private Book book;
	private int num;
	
	public float getTotle() {
		return num*book.getPrice();
	}
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
