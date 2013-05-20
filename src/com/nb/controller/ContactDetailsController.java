package com.nb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.Vendor;
import com.nb.form.ContactDetailsForm;
import com.nb.form.SelectVendorForm;

public class ContactDetailsController extends SimpleFormController {
	


	private ContactDetailsForm contactDetailsForm =  new ContactDetailsForm();
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		
		
		// TODO Auto-generated method stub
		return contactDetailsForm;
	}


}
