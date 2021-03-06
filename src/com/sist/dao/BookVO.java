package com.sist.dao;
import java.util.*;

public class BookVO implements Comparable<BookVO>{
	private int no;
	private String description;
	private String title;
	private String author;
	private String publisher;
	private Date pubdate;
	private String image;
	private double commentpoint;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getCommentpoint() {
		return commentpoint;
	}
	public void setCommentpoint(double commentpoint) {
		this.commentpoint = commentpoint;
	}
	@Override
	public int compareTo(BookVO o) {
		// TODO Auto-generated method stub
		return (commentpoint < o.commentpoint) ? 1 : ((commentpoint == o.commentpoint) ? 0 : -1);
	}
	
	
	
}
