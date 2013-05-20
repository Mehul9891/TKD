package com.nb.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindException;
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
		LoginForm loginform = (LoginForm)command;
		Customer customer = new Customer();
	    PendingRequest pendingRequest = new PendingRequest();
	    Session session = null;
		System.out.println("Inside onsubmit function.");
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
		pendingRequest.setVendor_id(loginform.getVendor().getVendor_id());
		pendingRequest.setDate_of_request(new Date());
		pendingRequest.setProduct(loginform.getCustomer().getProducts_repaired());
		pendingRequest.setProduct_details(loginform.getProduct_model());
		pendingRequest.setProblem(loginform.getProblem());
		session.save(customer);
		
		session.getTransaction().commit();

		
		/*session.close();
		 *  factory = new Configuration().configure().buildSessionFactory();
		   session = factory.openSession(); */
		
		session.beginTransaction();
		
		session.save(pendingRequest);
		
		session.getTransaction().commit();

		session.close();
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		loginForm = new LoginForm();
		// TODO Auto-generated method stub
		System.out.println("Inside form backing function.");
		return loginForm;
	}
	

	@Override
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		// TODO Auto-generated method stub
		super.initBinder(request, binder);
	}

	public LoginForm getLoginForm() {
		return loginForm;
	}

	public void setLoginForm(LoginForm loginForm) {
		this.loginForm = loginForm;
	}
	
}
