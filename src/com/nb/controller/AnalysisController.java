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
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.CodeMaster;
import com.nb.entity.CompletedRequest;
import com.nb.entity.Customer;
import com.nb.entity.Vendor;
import com.nb.form.AnalysisForm;
import com.nb.form.PaymentDetailsForm;
import com.nb.util.SessionFactoryUtil;

public class AnalysisController extends SimpleFormController{
	
	

	private AnalysisForm analysisForm = null;
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		analysisForm  = new AnalysisForm();
		
		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		Criteria cr = session.createCriteria(CodeMaster.class);
	       
     	 cr.add(Restrictions.eq("codeMasterSyntex", "PRODUCT_LIST"));
     
         List result = cr.list();
         List result1;
         List productMarketShare = new ArrayList();
         if(result != null && result.size()>0)
         {
        	 for(int i=0;i<result.size();i++)
        	 {
        		  cr = session.createCriteria(CompletedRequest.class);
      	       
             	 cr.add(Restrictions.like("product",("%"+((CodeMaster)result.get(i)).getCodeMasterFieldValue()+"%")));
             	 result1 = cr.list();
                 productMarketShare.add(result1.size());
                 
        	 }	 
        	 
        	
        	 if(productMarketShare != null &&  productMarketShare.size()>0)
        	 {
        		 request.setAttribute("productMarketShare", productMarketShare);
        	 }	 
        	 request.setAttribute("lstproduct", result);
        	 request.setAttribute("size", result.size());
         }
         
       
		session.getTransaction().commit();
		
		
		System.out.println("Code Master list successfull set in request.");
		
		
		session.beginTransaction();
		 cr = session.createCriteria(CodeMaster.class);
	       
    	 cr.add(Restrictions.eq("codeMasterSyntex", "LOCATION"));

          result = cr.list();
         
        List zonalMarketShare = new ArrayList();
        if(result != null && result.size()>0)
        {
        	for(int i=0;i<result.size();i++)
       	 {
        		 cr = session.createCriteria(Customer.class);
        	       
             	 cr.add(Restrictions.like("zone",((CodeMaster)result.get(i)).getCodeMasterFieldValue()+"%"));
             	
        		result1 = cr.list();
                zonalMarketShare.add(result1.size());
                
       	 }	 
       	 
       	
       	 if(zonalMarketShare != null &&  zonalMarketShare.size()>0)
       	 {
       		 request.setAttribute("zonalMarketShare", zonalMarketShare);
       	 }	 
       	 request.setAttribute("lstZone", result);
       	 request.setAttribute("size1", result.size());
        }
        
      
		session.getTransaction().commit();
		
		
		System.out.println("Code Master list successfull set in request.");
		session.close();
		
	return analysisForm;
		
	}
	

	@Override
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		// TODO Auto-generated method stub



		super.initBinder(request, binder);
	}




}
