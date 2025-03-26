package com.engisphere.entity;

public class assignment {
	
	
	private int assignid;
	private String id;
	private String title;
	private String description;
	private String duedate;
	private String status;
	public int getAssignid() {
		return assignid;
	}
	public void setAssignid(int assignid) {
		this.assignid = assignid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getDuedate() {
		return duedate;
	}
	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public assignment(int assignid, String id, String title, String description, String duedate, String status) {
		super();
		this.assignid = assignid;
		this.id = id;
		this.title = title;
		this.description = description;
		this.duedate = duedate;
		this.status = status;
	}
	public assignment(String id, String title, String description, String duedate, String status) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.duedate = duedate;
		this.status = status;
	}
	public assignment(String id, String title, String description, String duedate) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.duedate = duedate;
	}
	@Override
	public String toString() {
		return "assignment [assignid=" + assignid + ", id=" + id + ", title=" + title + ", description=" + description
				+ ", duedate=" + duedate + ", status=" + status + "]";
	}
	public assignment() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	

}
