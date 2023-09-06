package com.website.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="USER_TB")

public class User {
	
		public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public User() {
		
	}
	public User(int id, String name, String email, String password, String phone, String pic, String role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.pic = pic;
		this.role = role;
	}
	public User(String address) {
		super();
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", address=" + address + ", email=" + email + ", password="
				+ password + ", phone=" + phone + ", pic=" + pic + ", role=" + role + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(length=10, name="id")
		private int id;
		
		@Column(length=100, name="name")
		private String name;
		
		@Column(length=1500, name="address")
		private String address;
		
		@Column(length=100, name="email")
		private String email;
		
		@Column(length=100, name="password")
		private String password;
		
		@Column(length=10, name="phone")
		private String phone;
		
		@Column(length=1500, name="pic")
		private String pic;
		
		@Column(length=20, name="role")
		private String role;
		

}
