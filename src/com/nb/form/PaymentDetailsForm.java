package com.nb.form;

import com.nb.entity.CompletedRequest;
import com.nb.entity.Customer;
import com.nb.entity.Vendor;

public class PaymentDetailsForm {

	private CompletedRequest  completedRequest = new CompletedRequest();
	
	private Customer customer = new Customer();
	
	private Vendor vendor = new Vendor();

	public CompletedRequest getCompletedRequest() {
		return completedRequest;
	}

	public void setCompletedRequest(CompletedRequest completedRequest) {
		this.completedRequest = completedRequest;
	}

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
	
	
	
	
	
}
