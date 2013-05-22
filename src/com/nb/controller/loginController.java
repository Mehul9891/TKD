package com.nb.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.Customer;
import com.nb.entity.PendingRequest;
import com.nb.form.LoginForm;
import com.nb.util.SessionFactoryUtil;

public class loginController extends SimpleFormController {
	
	private LoginForm loginForm = null;
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		
			loginForm = (LoginForm)command;
			String operationFlag = request.getParameter("operationFlag");
			if("SearchCustomer".equals(operationFlag))
			{
	
				Session session = SessionFactoryUtil.getSessionInstance();
				session.beginTransaction();
				session.beginTransaction();
				String hql = "FROM Customer WHERE mobile_no = :mobile_no";
		         Query query = session.createQuery(hql);
		         query.setString("mobile_no", loginForm.getCustomer().getMobile_no());
		         List result = query.list();
		        if(result != null && result.size() > 0)
		        {	
		        	Customer objCustomer = (Customer)result.get(0);
		        	loginForm.getCustomer().setCustId(objCustomer.getCustId());
		        	loginForm.getCustomer().setName(objCustomer.getName());
		        	loginForm.getCustomer().setMobile_no(objCustomer.getMobile_no());
		        	loginForm.getCustomer().setEmailId(objCustomer.getEmailId());
		        	loginForm.getCustomer().setCust_address(objCustomer.getCust_address());
		        	loginForm.getCustomer().setPincode(objCustomer.getPincode());
		        	loginForm.getCustomer().setZone(objCustomer.getZone());
					
		        }
				session.getTransaction().commit();
				session.close();
				return this.showForm(request, response, errors);
			}	
		else
			{	
				LoginForm loginform = (LoginForm)command;
					Customer customer = new Customer();
				    PendingRequest pendingRequest = new PendingRequest();
				    Session session = null;
					System.out.println("Inside login Controller onsubmit function.");
					/*SessionFactory factory = new Configuration().configure().buildSessionFactory();
					Session session = factory.openSession();*/
					session = SessionFactoryUtil.getSessionInstance();
					session.beginTransaction();
					
					customer.setName(loginform.getCustomer().getName());
					customer.setMobile_no(loginform.getCustomer().getMobile_no());
					customer.setEmailId(loginform.getCustomer().getEmailId());
					customer.setCust_address(loginform.getCustomer().getCust_address());
					customer.setProducts_repaired(loginform.getCustomer().getProducts_repaired());
					customer.setPincode(loginform.getCustomer().getPincode());
					customer.setZone(loginform.getCustomer().getZone());
					customer.setCreated_date(new Date());
					session.save(customer);
					session.getTransaction().commit();
					session.close();
					
					
					session = SessionFactoryUtil.getSessionInstance();
					session.beginTransaction();
					String hql = "FROM Customer WHERE mobile_no = :mobile_no";
			         Query query = session.createQuery(hql);
			         query.setString("mobile_no", loginform.getCustomer().getMobile_no());
			         List result = query.list();
			        if(result != null)
			        {	
			         int CustIdInt = ((Customer)result.get(0)).getCustId();
					
			        pendingRequest.setCustId(CustIdInt);
					pendingRequest.setVendor_id(loginform.getVendor().getVendor_id());
					pendingRequest.setDate_of_request(new Date());
					pendingRequest.setProduct(loginform.getCustomer().getProducts_repaired());
					pendingRequest.setProduct_details(loginform.getProduct_model());
					pendingRequest.setProblem(loginform.getProblem());
			       	session.save(pendingRequest);
					session.getTransaction().commit();
					session.close();
			        }
			      return super.onSubmit(request, response, command, errors);
			}    
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		loginForm = new LoginForm();
		// TODO Auto-generated method stub
		System.out.println("Inside loginController form backing function.");
		return loginForm;
	}
	

	@Override
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		// TODO Auto-generated method stub
		super.initBinder(request, binder);
	}
	
	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		
		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		 String hql = " FROM CodeMaster WHERE codeMasterSyntex = :codeMasterSyntex";
         Query query = session.createQuery(hql);
         query.setString("codeMasterSyntex", "PRODUCT_LIST");
         List result = query.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstproduct", result);
         }
         
          hql = " FROM CodeMaster WHERE codeMasterSyntex = :codeMasterSyntex";
         query = session.createQuery(hql);
         query.setString("codeMasterSyntex", "LOCATION");
         result = query.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstLocation", result);
         }
		
		session.getTransaction().commit();
		
		System.out.println("Code Master list successfull set in request.");
		session.close();
		
		// TODO Auto-generated method stub
		return super.referenceData(request, command, errors);
	}
	
	

	public LoginForm getLoginForm() {
		return loginForm;
	}

	public void setLoginForm(LoginForm loginForm) {
		this.loginForm = loginForm;
	}
	
}
