package com.engisphere.entity;

public class StudentsEntities {
	private int id;
	private String firstName;
	private String  lastName;
	private String contact;
	private String address;
	private String  email;
	private String password;
	private String joiningDate;
	private String course;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public StudentsEntities(int id, String firstName, String lastName, String contact, String address, String email,
			String password, String joiningDate, String course) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.contact = contact;
		this.address = address;
		this.email = email;
		this.password = password;
		this.joiningDate = joiningDate;
		this.course = course;
	}
	
	public StudentsEntities(String firstName, String lastName, String contact, String address, String email,
			String password, String joiningDate, String course) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.contact = contact;
		this.address = address;
		this.email = email;
		this.password = password;
		this.joiningDate = joiningDate;
		this.course = course;
	}
	public StudentsEntities() {
		super();
	}
	@Override
	public String toString() {
		return "StudentsEntities [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", contact="
				+ contact + ", address=" + address + ", email=" + email + ", password=" + password + ", joiningDate="
				+ joiningDate + ", course=" + course + "]";
	}
	 
	
	
	
	
	
	
	

}
