package com.nb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.constants.Constants;
import com.nb.entity.CodeMaster;
import com.nb.entity.CompletedRequest;
import com.nb.entity.Customer;
import com.nb.entity.Vendor;
import com.nb.form.CodeMasterForm;
import com.nb.form.ExportDbForm;
import com.nb.util.SessionFactoryUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExportDataController extends SimpleFormController{
	
	ExportDbForm exportDbForm = null;
	
	
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {

		Session session;
		session = SessionFactoryUtil.getSessionInstance();
		session.beginTransaction();
		 Criteria cr = session.createCriteria(Vendor.class);
         List resultset = cr.list();
         cr = session.createCriteria(Customer.class);
         List resultset1 = cr.list();
         cr = session.createCriteria(CompletedRequest.class);
         List resultset2 = cr.list();
         if(resultset != null && resultset.size()>0 && resultset1 != null && resultset2 != null)
         {

        	Workbook  wb  = new XSSFWorkbook();
 			FileOutputStream fileOut = null;
 			File file = new File(Constants.CompanyExportDBFolderLocation+"ExportedDb_"+new Date().getTime()+".xlsx");
 			file.createNewFile();
 			try{
 				fileOut = new FileOutputStream(file);
				Sheet sheet = wb.createSheet("Vendor");
				Row row[] = new Row[resultset.size()];
				int i=0;
				      while(i<resultset.size())
				      {
				    	  
				    	 Vendor vendor = (Vendor)resultset.get(i);
				    	    row[i] = sheet.createRow((short)i); 
							//HSSFCell cell   = row.createCell((short)0); 
							//cell.setCellValue(resultSet.getString(1)); 
							   row[i].createCell((short)1).setCellValue(vendor.getVendor_id()); 
							   row[i].createCell((short)2).setCellValue(vendor.getOfficeName());
							   row[i].createCell((short)3).setCellValue(vendor.getCompanyName());
							   row[i].createCell((short)4).setCellValue(vendor.getOwnername()); 
							   row[i].createCell((short)5).setCellValue(vendor.getMobile_no());
							   row[i].createCell((short)6).setCellValue(vendor.getAddress());
							   row[i].createCell((short)7).setCellValue(vendor.getCatered_products()); 
							   row[i].createCell((short)8).setCellValue(vendor.getNo_of_technicians());
							   row[i].createCell((short)9).setCellValue(vendor.getPincode());
							   row[i].createCell((short)10).setCellValue(vendor.getZone()); 
							   row[i].createCell((short)11).setCellValue(vendor.getCreated_date());
							   row[i].createCell((short)12).setCellValue(vendor.getUpdated_date());
							i++;
							
				      }

				      Sheet sheet1 = wb.createSheet("Customer Details");
						Row row1[] = new Row[resultset1.size()];
						int i1=0;
						      while(i1<resultset1.size())
						      {
						    	  
						    	 Customer customer = (Customer)resultset1.get(i1);
						    	    row1[i1] = sheet1.createRow((short)i1); 
									//HSSFCell cell   = row.createCell((short)0); 
									//cell.setCellValue(resultSet.getString(1)); 
									   row1[i1].createCell((short)1).setCellValue(customer.getCustId()); 
									   row1[i1].createCell((short)2).setCellValue(customer.getName());
									   row1[i1].createCell((short)3).setCellValue(customer.getEmailId());
									   row1[i1].createCell((short)4).setCellValue(customer.getMobile_no()); 
									   row1[i1].createCell((short)5).setCellValue(customer.getCust_address());
									   row1[i1].createCell((short)6).setCellValue(customer.getProducts_repaired());
									   row1[i1].createCell((short)7).setCellValue(customer.getPincode());
									   row1[i1].createCell((short)8).setCellValue(customer.getZone()); 
									   row1[i1].createCell((short)9).setCellValue(customer.getCreated_date());
									   row1[i1].createCell((short)10).setCellValue(customer.getUpdated_date());
									i1++;
									
						      }

						      Sheet sheet2 = wb.createSheet("Completed Request");
								Row row2[] = new Row[resultset2.size()];
								int i2=0;
								      while(i2<resultset2.size())
								      {
								    	  
								    	  CompletedRequest completedRequest = (CompletedRequest)resultset2.get(i2);
								    	    row2[i2] = sheet2.createRow((short)i2); 
											//HSSFCell cell   = row.createCell((short)0); 
											//cell.setCellValue(resultSet.getString(1)); 
											   row2[i2].createCell((short)1).setCellValue(completedRequest.getCompt_sr_no()); 
											   row2[i2].createCell((short)2).setCellValue(completedRequest.getCustId());
											   row2[i2].createCell((short)3).setCellValue(completedRequest.getVendor_id());
											   row2[i2].createCell((short)4).setCellValue(completedRequest.getProduct()); 
											   row2[i2].createCell((short)5).setCellValue(completedRequest.getProduct_details());
											   row2[i2].createCell((short)6).setCellValue(completedRequest.getProduct_company());
											   row2[i2].createCell((short)7).setCellValue(completedRequest.getProblem());
											   row2[i2].createCell((short)8).setCellValue(completedRequest.getDate_of_request()); 
											   row2[i2].createCell((short)9).setCellValue(completedRequest.getTime_of_request());
											   row2[i2].createCell((short)10).setCellValue(completedRequest.getSource_of_call());
											   
											   row2[i2].createCell((short)11).setCellValue(completedRequest.getRemarks()); 
											   row2[i2].createCell((short)12).setCellValue(completedRequest.getCust_amt_col());
											   row2[i2].createCell((short)13).setCellValue(completedRequest.getFeedback());
											   row2[i2].createCell((short)14).setCellValue(completedRequest.getSp_amt_col()); 
											   row2[i2].createCell((short)15).setCellValue(completedRequest.getCust_sp_diff());
											   row2[i2].createCell((short)16).setCellValue(completedRequest.getOur_share());
											   row2[i2].createCell((short)17).setCellValue(completedRequest.getPayment_recvd());
											   row2[i2].createCell((short)18).setCellValue(completedRequest.getComplaint_id()); 
											   row2[i2].createCell((short)19).setCellValue(completedRequest.getDate_of_solving());
											   row2[i2].createCell((short)20).setCellValue(completedRequest.getTime_of_solving());
											   
											  i2++;
											
								      }


						      wb.write(fileOut);

				      
 			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				try {
					fileOut.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}


         }
		
		session.getTransaction().commit();
		
		System.out.println("Code Master list successfull set in request.");
		session.close();
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		exportDbForm = new ExportDbForm();
			return exportDbForm;
	}

	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		
		
		// TODO Auto-generated method stub
		return super.referenceData(request, command, errors);
	}
	

}
