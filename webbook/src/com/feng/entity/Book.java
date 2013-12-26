package com.feng.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="t_book")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Book {

	private Integer id;
	private String bookName;
	private String bookAuthor;
	private String publishDate;
	private Integer pageNum;
	private Float price;
	private Float salePrice;
	private String content;
	private String authorContent;
	private String perface;
	private String pic;
	private Integer bookNum;
	private Integer dangerNum;
	private String statu;
	private String createTime;
	private Type type;
	private Publish publish;
	private List<Comment> comments;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthorContent() {
		return authorContent;
	}
	public void setAuthorContent(String authorContent) {
		this.authorContent = authorContent;
	}
	public String getPerface() {
		return perface;
	}
	public void setPerface(String perface) {
		this.perface = perface;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getBookNum() {
		return bookNum;
	}
	public void setBookNum(Integer bookNum) {
		this.bookNum = bookNum;
	}
	public Integer getDangerNum() {
		return dangerNum;
	}
	public void setDangerNum(Integer dangerNum) {
		this.dangerNum = dangerNum;
	}
	public String getStatu() {
		return statu;
	}
	public void setStatu(String statu) {
		this.statu = statu;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	@ManyToOne
	@JoinColumn(name="booktypeid")
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	@ManyToOne
	@JoinColumn(name="publishid")
	public Publish getPublish() {
		return publish;
	}
	public void setPublish(Publish publish) {
		this.publish = publish;
	}
	@OneToMany(mappedBy="book",fetch=FetchType.LAZY)
	@Cascade(CascadeType.REMOVE)
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}
