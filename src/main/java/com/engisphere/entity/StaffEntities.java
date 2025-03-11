package com.engisphere.entity;

public class StaffEntities {
    private int id;
    private String firstName;
    private String lastName;
    private String contact;
    private String address;
    private String email;
    private String password;
    private String joiningDate;
    private String jobProfession;
    private String salary;
    private String work;

    // Constructors
    public StaffEntities(int id, String firstName, String lastName, String contact, String address, String email,
                         String password, String joiningDate, String jobProfession, String salary, String work) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact = contact;
        this.address = address;
        this.email = email;
        this.password = password;
        this.joiningDate = joiningDate;
        this.jobProfession = jobProfession;
        this.salary = salary;
        this.work = work;
    }

    public StaffEntities(String firstName, String lastName, String contact, String address, String email,
                         String password, String joiningDate, String jobProfession, String salary, String work) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact = contact;
        this.address = address;
        this.email = email;
        this.password = password;
        this.joiningDate = joiningDate;
        this.jobProfession = jobProfession;
        this.salary = salary;
        this.work = work;
    }

    public StaffEntities() {
    }

    // Getters and Setters
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

    public String getJobProfession() {
        return jobProfession;
    }

    public void setJobProfession(String jobProfession) {
        this.jobProfession = jobProfession;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    @Override
    public String toString() {
        return "StaffEntities [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", contact=" +
                contact + ", address=" + address + ", email=" + email + ", password=" + password + ", joiningDate=" +
                joiningDate + ", jobProfession=" + jobProfession + ", salary=" + salary + ", work=" + work + "]";
    }
}
