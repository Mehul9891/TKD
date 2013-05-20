package com.nb.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.Vendor;
import com.nb.form.VendorForm;
import com.nb.util.SessionFactoryUtil;

public class VendorController extends SimpleFormController {
	
	private VendorForm vendorform ;
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		Session session = null;
		// TODO Auto-generated method stub
		/*SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();*/
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		vendorform =(VendorForm)command;
	 	Vendor vendor = new Vendor();
	 	vendor.setName(vendorform.getVendor().getName());
	 	vendor.setMobile_no(vendorform.getVendor().getMobile_no());
	 	vendor.setAddress(vendorform.getVendor().getAddress());
	 	vendor.setCatered_products(vendorform.getVendor().getCatered_products());
	 	vendor.setNo_of_technicians(vendorform.getVendor().getNo_of_technicians());
	 	vendor.setPincode(vendorform.getVendor().getPincode());
	 	vendor.setZone(vendorform.getVendor().getZone());
	 	vendor.setCreated_date(new Date());
	 	
	 	session.save(vendor);
		session.getTransaction().commit();
		System.out.println("vendor registered successfully;");
		session.close();
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		 vendorform = new VendorForm();
		// TODO Auto-generated method stub
		return vendorform;
	}

}
