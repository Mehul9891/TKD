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
import org.hibernate.criterion.Restrictions;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.CodeMaster;
import com.nb.entity.CompletedRequest;
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
	 	vendor.setCompanyName(vendorform.getVendor().getCompanyName());
	 	vendor.setOfficeName(vendorform.getVendor().getOfficeName());
	 	vendor.setOwnername(vendorform.getVendor().getOwnername());
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

	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		
		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		 Criteria cr = session.createCriteria(CodeMaster.class);
		 cr.add(Restrictions.eq("codeMasterSyntex", "LOCATION"));
		
         List result = cr.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstLocation", result);
         }
		
		
          cr = session.createCriteria(CodeMaster.class);
		 cr.add(Restrictions.eq("codeMasterSyntex", "PRODUCT_LIST"));
		  
          result = cr.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstproduct", result);
         }
         
         
		
		session.getTransaction().commit();
		
		System.out.println("Code Master list successfull set in request.");
		
		session.close();
		
		// TODO Auto-generated method stub
		return super.referenceData(request, command, errors);
	}
	
}
