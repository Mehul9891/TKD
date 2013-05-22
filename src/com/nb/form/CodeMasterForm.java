package com.nb.form;

import java.util.ArrayList;
import java.util.List;

public class CodeMasterForm {
	
	private List lstCodeMaster = new ArrayList();
	private String codeMasterSyntex;
	private String newCodeMasterName;
	private String newCodeMasterValue;
	
	public List getLstCodeMaster() {
		return lstCodeMaster;
	}

	public void setLstCodeMaster(List lstCodeMaster) {
		this.lstCodeMaster = lstCodeMaster;
	}

	public String getCodeMasterSyntex() {
		return codeMasterSyntex;
	}

	public void setCodeMasterSyntex(String codeMasterSyntex) {
		this.codeMasterSyntex = codeMasterSyntex;
	}

	public String getNewCodeMasterName() {
		return newCodeMasterName;
	}

	public void setNewCodeMasterName(String newCodeMasterName) {
		this.newCodeMasterName = newCodeMasterName;
	}

	public String getNewCodeMasterValue() {
		return newCodeMasterValue;
	}

	public void setNewCodeMasterValue(String newCodeMasterValue) {
		this.newCodeMasterValue = newCodeMasterValue;
	}
	
	

}
