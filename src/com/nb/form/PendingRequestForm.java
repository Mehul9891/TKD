package com.nb.form;

import java.util.ArrayList;
import java.util.List;

import com.nb.entity.PendingRequest;

public class PendingRequestForm {
	
	private List lstPendingRequest = new ArrayList();
	private int selectedReqId;
	
	
	public List getLstPendingRequest() {
		return lstPendingRequest;
	}

	public void setLstPendingRequest(List lstPendingRequest) {
		this.lstPendingRequest = lstPendingRequest;
	}

	public int getSelectedReqId() {
		return selectedReqId;
	}

	public void setSelectedReqId(int selectedReqId) {
		this.selectedReqId = selectedReqId;
	}

	

	
}
