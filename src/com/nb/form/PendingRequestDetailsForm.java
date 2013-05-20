package com.nb.form;

import java.util.Date;

import com.nb.entity.PendingRequest;

public class PendingRequestDetailsForm {
	
	private PendingRequest pendingRequest = new PendingRequest();
	private String status;
	private String cust_amt_col;
	
	private String sp_amt_col;
	private String cust_sp_diff;
	private String our_share;
	private String payment_recvd;
	private String feedback;
	private Date date_of_solving;
	
	public PendingRequest getPendingRequest() {
		return pendingRequest;
	}

	public void setPendingRequest(PendingRequest pendingRequest) {
		this.pendingRequest = pendingRequest;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCust_amt_col() {
		return cust_amt_col;
	}

	public void setCust_amt_col(String cust_amt_col) {
		this.cust_amt_col = cust_amt_col;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getSp_amt_col() {
		return sp_amt_col;
	}

	public void setSp_amt_col(String sp_amt_col) {
		this.sp_amt_col = sp_amt_col;
	}

	public String getCust_sp_diff() {
		return cust_sp_diff;
	}

	public void setCust_sp_diff(String cust_sp_diff) {
		this.cust_sp_diff = cust_sp_diff;
	}

	public String getOur_share() {
		return our_share;
	}

	public void setOur_share(String our_share) {
		this.our_share = our_share;
	}

	public String getPayment_recvd() {
		return payment_recvd;
	}

	public void setPayment_recvd(String payment_recvd) {
		this.payment_recvd = payment_recvd;
	}

	public Date getDate_of_solving() {
		return date_of_solving;
	}

	public void setDate_of_solving(Date date_of_solving) {
		this.date_of_solving = date_of_solving;
	}

	

	
	
	
	

}
