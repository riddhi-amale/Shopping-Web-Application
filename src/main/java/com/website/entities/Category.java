package com.website.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="CATEGORY_TB")

public class Category {
	public Category() {
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=10, name="id")
	private int id;
	
	@Column(length=100, name="title")
	private String title;
	
	@Column(length=1500, name="description")
	private String description;
	
	@OneToMany(mappedBy = "prodCategory")
	private List<Product> productList = new ArrayList<Product>();


	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public Category(List<Product> productList) {
		super();
		this.productList = productList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category(String title, String description) {
		super();
		this.title = title;
		this.description = description;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", title=" + title + ", description=" + description + ", productList="
				+ productList + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category(int id) {
		super();
		this.id = id;
	}
	
	
	
	
	

}
