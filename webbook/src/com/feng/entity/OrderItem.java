package com.feng.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="t_orderitem")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class OrderItem {

	private Integer id;
	private String bookname;
	private Float bookprice;
	private Integer num;
	private Float totle;
	private String createtime;
	private Order order;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Float getBookprice() {
		return bookprice;
	}
	public void setBookprice(Float bookprice) {
		this.bookprice = bookprice;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Float getTotle() {
		return totle;
	}
	public void setTotle(Float totle) {
		this.totle = totle;
	}
	
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="orderid")
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
