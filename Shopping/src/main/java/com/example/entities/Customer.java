package com.example.entities;



import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(length=10)
    private int custId;

    @Column(length=50,name = "password")
    private String custAddress;

    @Column(length=20, name = "firstname")
    private String custEmail;
    @Column(length = 2000)
    private String custMobileNo;
    @Column(length=2000,name = "address")
    private String firstName;
    @Column(length=2000,name = "email",unique = true)
    private String lastName;
    @Column(length = 10,name = "lastname")
    private String custPassword;
    @Column(length=20,name = "cust_type")
    private String custType;

    @Override
    public String toString() {
        return "Customer{" +
                "custId=" + custId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", custMobileNo='" + custMobileNo + '\'' +
                ", custAddress='" + custAddress + '\'' +
                ", custEmail='" + custEmail + '\'' +
                ", custPassword='" + custPassword + '\'' +
                ", custType='" + custType + '\'' +
                '}';
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public Customer(String firstName, String lastName, String custMobileNo, String custAddress, String custEmail, String custPassword,String custType) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.custMobileNo = custMobileNo;
        this.custAddress = custAddress;
        this.custEmail = custEmail;
        this.custPassword = custPassword;
        this.custType = custType;
    }

    public Customer() {
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
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

    public String getCustMobileNo() {
        return custMobileNo;
    }

    public void setCustMobileNo(String custMobileNo) {
        this.custMobileNo = custMobileNo;
    }

    public String getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;

    }

    public String getCustType() {
        return custType;
    }

    public void setCustType(String custType) {
        this.custType = custType;
    }
}


