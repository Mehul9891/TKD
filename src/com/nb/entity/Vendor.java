package com.nb.entity;

import java.util.Date;
import java.util.List;

public class Vendor {
	
	private int vendor_id ;
	private String officeName;
	private String companyName;
	private String ownername ;
	private String mobile_no;
	private String address;
	private String catered_products;
	private String no_of_technicians;
	private String pincode;
	private String zone;
	private Date created_date;
	private Date updated_date;
	
	
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCatered_products() {
		return catered_products;
	}
	public void setCatered_products(String catered_products) {
		this.catered_products = catered_products;
	}
	public String getNo_of_technicians() {
		return no_of_technicians;
	}
	public void setNo_of_technicians(String no_of_technicians) {
		this.no_of_technicians = no_of_technicians;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
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
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	


}
