package com.nb.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.CompletedRequest;
import com.nb.entity.PendingRequest;
import com.nb.entity.Vendor;
import com.nb.form.PaymentsForm;
import com.nb.form.PendingRequestDetailsForm;
import com.nb.util.SessionFactoryUtil;

public class PaymentsController extends SimpleFormController{
	
	private PaymentsForm paymentsForm = null;
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("INside on submit function");
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		paymentsForm  = new PaymentsForm();
		
		SessionFactory factory =null; 
		List results;
		Session session=null; 
			 
			try{
		        /* factory = new Configuration().configure().buildSessionFactory();*/
		          /*session = factory.openSession();*/
				 session = SessionFactoryUtil.getSessionInstance();	
		         session.beginTransaction();
		         Criteria cr = session.createCriteria(CompletedRequest.class);
		          results = cr.list();
		          List completedReqList = new ArrayList();
		          int i =0;
		          for(;i<results.size();i++)
		          {
		        	  completedReqList.add((CompletedRequest)results.get(i)) ;
		        	  
		          }
		          request.setAttribute("size", results.size());
		          paymentsForm.setLstCompletedRequest(completedReqList);
		          session.getTransaction().commit();
		          session.close();
		          /*factory.close();*/
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         session.getTransaction().rollback();
	             session.close();
	           /*  factory.close();*/
		         
		         throw new ExceptionInInitializerError(ex); 
		      }
		
	
		
	return paymentsForm;
		
	}
	

	@Override
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		// TODO Auto-generated method stub
//		 convert java.util.Date
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	dateFormat.setLenient(false);
	binder.registerCustomEditor(Date.class, null,
	new CustomDateEditor(dateFormat, true));
//		 convert java.lang.Long
	NumberFormat nf = NumberFormat.getNumberInstance();
	nf.setGroupingUsed(false);
	binder.registerCustomEditor(Long.class, null,
	new CustomNumberEditor(Long.class, nf, true));
//		convert to Big Decimal
	//NumberFormat nf1 = NumberFormat.getNumberInstance();
	binder.registerCustomEditor(Double.class, null,
	new CustomNumberEditor(Double.class,new DecimalFormat("###,##0"), true));
	binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());



		super.initBinder(request, binder);
	}


}
