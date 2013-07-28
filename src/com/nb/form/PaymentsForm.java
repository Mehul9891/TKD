package com.nb.form;

import java.util.ArrayList;
import java.util.List;

import com.nb.entity.CompletedRequest;
import com.nb.entity.Customer;
import com.nb.entity.Vendor;

public class PaymentsForm {
	
	private List lstCompletedRequest = new  ArrayList();
	private String pendingPayment;

	public List getLstCompletedRequest() {
		return lstCompletedRequest;
	}

	public void setLstCompletedRequest(List lstCompletedRequest) {
		this.lstCompletedRequest = lstCompletedRequest;
	}

	public String getPendingPayment() {
		return pendingPayment;
	}

	public void setPendingPayment(String pendingPayment) {
		this.pendingPayment = pendingPayment;
	}

	

	
	
	
	

}
