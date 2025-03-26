package com.engisphere.entity;

public class SubmitAssign {

	
	
	private int assignSubmitid;
	private String assignid;
	private String Assignmentlink;
	private String studentid;
	private String status;
	public int getAssignSubmitid() {
		return assignSubmitid;
	}
	public void setAssignSubmitid(int assignSubmitid) {
		this.assignSubmitid = assignSubmitid;
	}
	public String getAssignid() {
		return assignid;
	}
	public void setAssignid(String assignid) {
		this.assignid = assignid;
	}
	public String getAssignmentlink() {
		return Assignmentlink;
	}
	public void setAssignmentlink(String assignmentlink) {
		Assignmentlink = assignmentlink;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public SubmitAssign(int assignSubmitid, String assignid, String assignmentlink, String studentid, String status) {
		super();
		this.assignSubmitid = assignSubmitid;
		this.assignid = assignid;
		Assignmentlink = assignmentlink;
		this.studentid = studentid;
		this.status = status;
	}
	public SubmitAssign(String assignid, String assignmentlink, String studentid, String status) {
		super();
		this.assignid = assignid;
		Assignmentlink = assignmentlink;
		this.studentid = studentid;
		this.status = status;
	}
	public SubmitAssign(String assignid, String assignmentlink) {
		super();
		this.assignid = assignid;
		Assignmentlink = assignmentlink;
	}
	@Override
	public String toString() {
		return "SubmitAssign [assignSubmitid=" + assignSubmitid + ", assignid=" + assignid + ", Assignmentlink="
				+ Assignmentlink + ", studentid=" + studentid + ", status=" + status + "]";
	}
	public SubmitAssign() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
