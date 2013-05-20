package com.nb.entity;

import java.util.Date;

public class PendingRequest {
	
	private int pend_sr_no;
	private int custId ;
	private int vendor_id;
	private String product;
	private String product_details;
	private String product_company;
	private String problem ;
	private Date date_of_request;
	private Date time_of_request;
	private String source_of_call;
	private String remarks;
	private Date created_date;
	private Date updated_date;
	private String rowstate;
	public int getPend_sr_no() {
		return pend_sr_no;
	}
	public void setPend_sr_no(int pend_sr_no) {
		this.pend_sr_no = pend_sr_no;
	}
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getProduct_details() {
		return product_details;
	}
	public void setProduct_details(String product_details) {
		this.product_details = product_details;
	}
	public String getProduct_company() {
		return product_company;
	}
	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public Date getDate_of_request() {
		return date_of_request;
	}
	public void setDate_of_request(Date date_of_request) {
		this.date_of_request = date_of_request;
	}
	public Date getTime_of_request() {
		return time_of_request;
	}
	public void setTime_of_request(Date time_of_request) {
		this.time_of_request = time_of_request;
	}
	public String getSource_of_call() {
		return source_of_call;
	}
	public void setSource_of_call(String source_of_call) {
		this.source_of_call = source_of_call;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getRowstate() {
		return rowstate;
	}
	public void setRowstate(String rowstate) {
		this.rowstate = rowstate;
	}
	

		
}
