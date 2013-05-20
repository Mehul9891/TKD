package com.nb.form;

import com.nb.entity.Customer;
import com.nb.entity.Vendor;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class LoginForm {

	
private	Customer customer = new Customer();
private Vendor vendor = new Vendor();

private String product_model;
private String problem;

public Customer getCustomer() {
	return customer;
}

public void setCustomer(Customer customer) {
	this.customer = customer;
}

public Vendor getVendor() {
	return vendor;
}

public void setVendor(Vendor vendor) {
	this.vendor = vendor;
}

public String getProduct_model() {
	return product_model;
}

public void setProduct_model(String product_model) {
	this.product_model = product_model;
}

public String getProblem() {
	return problem;
}

public void setProblem(String problem) {
	this.problem = problem;
}
	
     


}
