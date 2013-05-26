package com.nb.form;




import java.util.ArrayList;
import java.util.List;

import com.nb.entity.Vendor;
public class SelectVendorForm {
	
	List lstVendor = new ArrayList();
	private String selectLocation;
	private String selectProduct;

	public List getLstVendor() {
		return lstVendor;
	}

	public void setLstVendor(List lstVendor) {
		this.lstVendor = lstVendor;
	}

	public String getSelectLocation() {
		return selectLocation;
	}

	public void setSelectLocation(String selectLocation) {
		this.selectLocation = selectLocation;
	}

	public String getSelectProduct() {
		return selectProduct;
	}

	public void setSelectProduct(String selectProduct) {
		this.selectProduct = selectProduct;
	}

	
}
