package com.website.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT_TB")
public class Product {
	
	public Product() {
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=10, name="productId")
	private int productId;
	
	@Column(name="productName", length=50)
	private String productName;
	
	@Column(name="productImage", length=300)
	private String productImage;
	
	@Column(name="productDesc", length=100)
	private String productDesc;
	
	@Column(name="productPrice",length=20)
	private Integer productPrice;
	
	@Column(name="productQuantity",length=20)
	private Integer productQuantity;
	
	@Column(name="productDiscount",length=20)
	private Integer productDiscount;
	
	
	@ManyToOne
	private Category prodCategory = new Category();

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Integer getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(Integer productDiscount) {
		this.productDiscount = productDiscount;
	}

	public Category getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(Category prodCategory) {
		this.prodCategory = prodCategory;
	}


	public Product(int productId, String productName, String productImage, String productDesc, Integer productPrice,
			Integer productQuantity, Integer productDiscount, Category prodCategory) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.productDesc = productDesc;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productDiscount = productDiscount;
		this.prodCategory = prodCategory;
	}

	/* @Override */
	/*public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productImage=" + productImage
				+ ", productDesc=" + productDesc + ", productPrice=" + productPrice + ", productQuantity="
				+ productQuantity + ", productDiscount=" + productDiscount + ", prodCategory=" + prodCategory + "]";
	};
*/
}
