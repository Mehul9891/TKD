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
import com.nb.entity.Customer;
import com.nb.entity.Vendor;
import com.nb.form.PaymentDetailsForm;
import com.nb.form.PaymentsForm;
import com.nb.util.SessionFactoryUtil;

public class PaymentDetailsController extends SimpleFormController {
	

	
	private PaymentDetailsForm paymentDetailsForm = null;
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("INside on submit function");
		Session session = null;
		paymentDetailsForm =(PaymentDetailsForm)command;
		
		CompletedRequest completedRequest = new CompletedRequest();
		try{
		session = SessionFactoryUtil.getSessionInstance();
        session.beginTransaction();
        String hql = "UPDATE CompletedRequest set payment_recvd = :payment_recvd "  + 
                "WHERE compt_sr_no = :compt_sr_no";
        Query query = session.createQuery(hql);
        query.setInteger("compt_sr_no", paymentDetailsForm.getCompletedRequest().getCompt_sr_no());
        query.setString("payment_recvd", paymentDetailsForm.getCompletedRequest().getPayment_recvd());
        int result = query.executeUpdate();
        System.out.println("Rows affected: " + result);
        session.getTransaction().commit();
        session.close();
		}catch(Exception e){
			session.getTransaction().rollback();
	        session.close();
			System.out.println("Print Error Stack :"+e);
		}
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		paymentDetailsForm  = new PaymentDetailsForm();
		
		SessionFactory factory =null; 
		List results;
		Session session=null; 
		CompletedRequest objCompletedRequest = null;
		Vendor objVendor = null;
		Customer objCustomer = null;
		int custIdNumber = 0;
		int vendorIdNumber = 0;
			try{
		        /* factory = new Configuration().configure().buildSessionFactory();*/
		          session =  SessionFactoryUtil.getSessionInstance();
		         session.beginTransaction();
		        String paymentId = request.getParameter("PaymentID");
		        int paymentIdNumber =Integer.parseInt(paymentId);
		        // Complete Request Result.
			         Criteria cr = session.createCriteria(CompletedRequest.class);
			         cr.add(Restrictions.eq("compt_sr_no", paymentIdNumber));
			         cr.setCacheable(true);
			         results = cr.list();
			        
			      if(results != null)
			      {
			    	  objCompletedRequest = (CompletedRequest)results.get(0);
			      }
			       if(objCompletedRequest != null)
			       { custIdNumber = objCompletedRequest.getCustId();
			         vendorIdNumber = objCompletedRequest.getVendor_id();
			       }
			      if(custIdNumber > 0)
			      {
			    	    cr = session.createCriteria(Customer.class);
				         cr.add(Restrictions.eq("custId", custIdNumber));
				         cr.setCacheable(true);
				         results = cr.list();
				         if(results != null)
					      {
				        	 objCustomer = (Customer)results.get(0);
					      } 
			      }
			      if(vendorIdNumber > 0)
			      {
			    	    cr = session.createCriteria(Vendor.class);
				         cr.add(Restrictions.eq("vendor_id", vendorIdNumber));
				         cr.setCacheable(true);
				         results = cr.list();
				         if(results != null)
					      {
				        	 objVendor = (Vendor)results.get(0);
					      } 
			      }
			      paymentDetailsForm.setCompletedRequest(objCompletedRequest);
			      paymentDetailsForm.setCustomer(objCustomer);
			      paymentDetailsForm.setVendor(objVendor);
			         
		          session.getTransaction().commit();
		          session.close();
		         /* factory.close();*/
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         session.getTransaction().rollback();
	             session.close();
	          /*   factory.close();*/
		         
		         throw new ExceptionInInitializerError(ex); 
		      }
		
	
		
	return paymentDetailsForm;
		
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
