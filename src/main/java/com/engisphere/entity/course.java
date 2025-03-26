package com.engisphere.entity;

public class course {
	private int Id;
	private String courseCode;
	private String courseName;
	private String syllabus;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public course(int id, String courseCode, String courseName, String syllabus) {
		super();
		Id = id;
		this.courseCode = courseCode;
		this.courseName = courseName;
		this.syllabus = syllabus;
	}
	public course(String courseCode, String courseName, String syllabus) {
		super();
		this.courseCode = courseCode;
		this.courseName = courseName;
		this.syllabus = syllabus;
	}
	@Override
	public String toString() {
		return "course [Id=" + Id + ", courseCode=" + courseCode + ", courseName=" + courseName + ", syllabus="
				+ syllabus + "]";
	}
	public course() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
