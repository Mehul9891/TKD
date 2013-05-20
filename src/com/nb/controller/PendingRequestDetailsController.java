package com.nb.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
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
import com.nb.entity.PendingRequest;
import com.nb.form.LoginForm;
import com.nb.form.PendingRequestDetailsForm;
import com.nb.util.SessionFactoryUtil;

public class PendingRequestDetailsController extends SimpleFormController{
	
	
	private PendingRequestDetailsForm pendingRequestDetailsForm =null;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("INside on submit function");
		Session session = null;
		
		PendingRequestDetailsForm pendingRequestDetailsForm = (PendingRequestDetailsForm)command;
		CompletedRequest completedRequest = new CompletedRequest();
		
		completedRequest.setPend_sr_no(pendingRequestDetailsForm.getPendingRequest().getPend_sr_no());
		completedRequest.setCustId(pendingRequestDetailsForm.getPendingRequest().getCustId());
		completedRequest.setVendor_id(pendingRequestDetailsForm.getPendingRequest().getVendor_id());
		completedRequest.setProduct(pendingRequestDetailsForm.getPendingRequest().getProduct());
		completedRequest.setProduct_details(pendingRequestDetailsForm.getPendingRequest().getProduct_details());
		completedRequest.setProduct_company(pendingRequestDetailsForm.getPendingRequest().getProduct_company());
		completedRequest.setProblem(pendingRequestDetailsForm.getPendingRequest().getProblem());
		
		completedRequest.setDate_of_request(pendingRequestDetailsForm.getPendingRequest().getDate_of_request());
		completedRequest.setTime_of_request(pendingRequestDetailsForm.getPendingRequest().getTime_of_request());
		completedRequest.setSource_of_call(pendingRequestDetailsForm.getPendingRequest().getSource_of_call());
		completedRequest.setRemarks(pendingRequestDetailsForm.getPendingRequest().getRemarks());
		completedRequest.setCust_amt_col(pendingRequestDetailsForm.getCust_amt_col());
		completedRequest.setFeedback(pendingRequestDetailsForm.getFeedback());
		completedRequest.setSp_amt_col(pendingRequestDetailsForm.getSp_amt_col());
		completedRequest.setCust_sp_diff(pendingRequestDetailsForm.getCust_sp_diff());
		completedRequest.setOur_share(pendingRequestDetailsForm.getOur_share());
		completedRequest.setPayment_recvd(pendingRequestDetailsForm.getPayment_recvd());
		
		completedRequest.setDate_of_solving(pendingRequestDetailsForm.getDate_of_solving());
		/*SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();*/
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		session.save(completedRequest);
		session.getTransaction().commit();
		System.out.println("Request completed successfully;");
		/*session.close();
		
		factory = new Configuration().configure().buildSessionFactory();
         session = factory.openSession();
		session = SessionFactoryUtil.getSessionInstance();*/
		session.beginTransaction();
         String hql = "DELETE FROM PendingRequest WHERE pend_sr_no = :pend_req_id";
         Query query = session.createQuery(hql);
         query.setInteger("pend_req_id", pendingRequestDetailsForm.getPendingRequest().getPend_sr_no());
         int result = query.executeUpdate();
         if (result == 0) {  
             System.out.println("Doesn't deleted any row!");
             session.getTransaction().rollback();
             session.close();
            /* factory.close();*/
         } else {  
             System.out.println("Deleted Row: " + result);  
             session.getTransaction().commit();
             session.close();
           /*  factory.close();*/
         }  
         System.out.println("Rows affected: " + result);
		
        
 		 System.out.println("Pending Request details deleted successfully.");
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		pendingRequestDetailsForm = new PendingRequestDetailsForm();
		SessionFactory factory; 
		Session session = null;
		List results;
			String reqId = request.getParameter("ComplaintID");
			int reqIdNumber =Integer.parseInt(reqId);
			 System.out.println("Complaint id is :"+reqId);
			try{
		         /*factory = new Configuration().configure().buildSessionFactory();
		         Session session = factory.openSession();*/
		         /*String hql = "SELECT E.firstName FROM Employee E";
		         Query query = session.createQuery(hql);
		         List results = query.list();*/
				session = SessionFactoryUtil.getSessionInstance();
		         Criteria cr = session.createCriteria(PendingRequest.class);
		         cr.setCacheable(true);
		         cr.add(Restrictions.eq("pend_sr_no", reqIdNumber));
		          results = cr.list();
		          
		       session.close();
		        	  
		        	  pendingRequestDetailsForm.setPendingRequest((PendingRequest)results.get(0) );
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         throw new ExceptionInInitializerError(ex); 
		      }
		// TODO Auto-generated method stub
		System.out.println("Inside form backing function.");
		return pendingRequestDetailsForm;
		
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
