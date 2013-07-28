package com.nb.controller;

import java.util.ArrayList;
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
import com.nb.entity.Vendor;
import com.nb.form.SelectVendorForm;
import com.nb.form.VendorForm;
import com.nb.util.SessionFactoryUtil;

public class SelectVendorController extends SimpleFormController {

	private SelectVendorForm selectvendorform =  new SelectVendorForm();
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		selectvendorform = (SelectVendorForm)command;
		String selectedLocation = selectvendorform.getSelectLocation();
		String selectedProduct = selectvendorform.getSelectProduct();
		List results;
		 
		 Session session= null;
			try{
		        /* factory = new Configuration().configure().buildSessionFactory();
		          session = factory.openSession();*/
				session = SessionFactoryUtil.getSessionInstance();
		         session.beginTransaction();
		         Criteria cr = session.createCriteria(Vendor.class);
			       
		     	      
		        
		         if(selectedLocation != null && !"".equals(selectedLocation) )
		         {
		        	 if(selectedProduct == null || "".equals(selectedProduct) )
			         {
		        	 cr.add(Restrictions.like("zone",("%"+selectedLocation+"%")));	
			         }
		         }
		         if(selectedProduct != null && !"".equals(selectedProduct) )
		         {
		        	 if(selectedLocation != null && !"".equals(selectedLocation) )
			         {
		        		
		        		 cr.add(Restrictions.or(Restrictions.like("zone",("%"+selectedLocation+"%")),Restrictions.like("catered_products",("%"+selectedProduct+"%"))));		 
			         }
		        	 else
		        		 cr.add(Restrictions.like("catered_products",("%"+selectedProduct+"%")));	
		        	
		         }
		         
		         
		          results = cr.list();	 
		         
		          List vendorList = new ArrayList();
		          int i =0;
		          for(;i<results.size();i++)
		          {
		        	 vendorList.add((Vendor)results.get(i)) ;
		        	  
		          }
		          request.setAttribute("size", results.size());
		          selectvendorform.setLstVendor(vendorList);
		          session.getTransaction().commit();
		             session.close();
		             /*factory.close();*/
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         session.getTransaction().rollback();
	             session.close();
	            /* factory.close();*/
		         throw new ExceptionInInitializerError(ex); 
		      }
			
		
		
		return this.showForm(request, response, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		/*SessionFactory factory = null; */
		List results;
			 
		 Session session= null;
			try{
		        /* factory = new Configuration().configure().buildSessionFactory();
		          session = factory.openSession();*/
				session = SessionFactoryUtil.getSessionInstance();
		         session.beginTransaction();
		         Criteria cr = session.createCriteria(Vendor.class);
		          results = cr.list();
		          List vendorList = new ArrayList();
		          int i =0;
		          for(;i<results.size();i++)
		          {
		        	 vendorList.add((Vendor)results.get(i)) ;
		        	  
		          }
		          request.setAttribute("size", results.size());
		          selectvendorform.setLstVendor(vendorList);
		          session.getTransaction().commit();
		             session.close();
		             /*factory.close();*/
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         session.getTransaction().rollback();
	             session.close();
	            /* factory.close();*/
		         throw new ExceptionInInitializerError(ex); 
		      }
		
		// TODO Auto-generated method stub
		return selectvendorform;
	}
	
	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		
		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		Criteria cr = session.createCriteria(CodeMaster.class);
	       
      	 cr.add(Restrictions.eq("codeMasterSyntex", "PRODUCT_LIST"));
       
		List result = cr.list();
         if(result != null && result.size()>0)
         {
        	 request.setAttribute("lstproduct", result);
         }
         
         cr = session.createCriteria(CodeMaster.class);
         
       	 cr.add(Restrictions.eq("codeMasterSyntex", "LOCATION"));
         result = cr.list();
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
	
}
