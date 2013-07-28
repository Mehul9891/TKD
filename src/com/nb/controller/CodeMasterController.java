package com.nb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.CodeMaster;
import com.nb.entity.Vendor;
import com.nb.form.CodeMasterForm;
import com.nb.form.SelectVendorForm;
import com.nb.util.SessionFactoryUtil;

public class CodeMasterController extends SimpleFormController{
	
	CodeMasterForm codeMasterForm = null;
	
	
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Session session = null;
		// TODO Auto-generated method stub
		codeMasterForm =(CodeMasterForm)command;
		
		CodeMaster codeMaster = new CodeMaster();
		codeMaster.setCodeMasterSyntex(codeMasterForm.getCodeMasterSyntex());
		codeMaster.setCodeMasterFieldName(codeMasterForm.getNewCodeMasterName());
		codeMaster.setCodeMasterFieldValue(codeMasterForm.getNewCodeMasterValue());
		
		
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		session.save(codeMaster);
		session.getTransaction().commit();
		
		System.out.println("Code Master Entry successfull");
		session.close();
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		codeMasterForm = new CodeMasterForm();
			return codeMasterForm;
	}

	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		
		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		Criteria cr = session.createCriteria(CodeMaster.class);
	       
      	 cr.add(Restrictions.eq("codeMasterSyntex", "CODE_MASTER"));
   
		List result = cr.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstCodeMaster", result);
         }
		
		session.getTransaction().commit();
		
		System.out.println("Code Master list successfull set in request.");
		session.close();
		
		// TODO Auto-generated method stub
		return super.referenceData(request, command, errors);
	}
	
	

}
