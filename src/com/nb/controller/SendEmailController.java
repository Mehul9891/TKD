package com.nb.controller;

import java.io.File;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import com.nb.constants.Constants;
import com.nb.form.SendEmailForm;


public class SendEmailController extends SimpleFormController{

	SendEmailForm sendEmailForm = new SendEmailForm();
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		MimeMultipart multipart = new MimeMultipart(); 
		BodyPart bodyPart = new MimeBodyPart();  
		sendEmailForm = (SendEmailForm)command;
		String name = "Mehul";
        String msg = sendEmailForm.getMessage() ;
        String subject = sendEmailForm.getSubject();
        String To = sendEmailForm.getEmailId();
        String from = "whackamole9891@gmail.com";
		 Properties properties = System.getProperties();
		  properties.put("mail.smtp.starttls.enable", "true");
		  properties.setProperty("mail.user",Constants.CompanyEmailId);
		  properties.setProperty("mail.password", Constants.CompanyEmailIdPwd);
		     properties.put("mail.smtp.host", "smtp.gmail.com");
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.debug", "true");
	        properties.put("mail.smtp.auth", "true");
	        
	        Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(
	                		Constants.CompanyEmailId, Constants.CompanyEmailIdPwd);// Specify the Username and the PassWord
	                }
	              } );
			  try{
				  MimeMessage message = new MimeMessage(session);
				  message.setFrom(new InternetAddress(from));
				  message.addRecipient(Message.RecipientType.TO,
	                    new InternetAddress(To));
				  message.setSubject(subject);
				/*  message.setText(msg+"\n" +
						  "\n"+
						  "\n"+
				  		  name+" \n"+
				  		 "TheekKardo.com \n");
				*/   
				  String str = "<html><h3>Greetings,</h3><br>" +  
				    			msg+" <br><br><br>"+
				    			 name+" <br>"+
						  		 "TheekKardo.com <br>"+
				    			 Constants.CompanyContactNo+
				            "</html>";  
				  
					// Set the MIME-type to HTML.  
					bodyPart.setContent(str, "text/html");  
					multipart.addBodyPart(bodyPart);  
					bodyPart = new MimeBodyPart();  
				  File file = new File(Constants.CompanyBillFolderLocation+Constants.CompanyLogo);
					 if(file.exists())
					 {
						 DataSource ds = new FileDataSource(file); 
						  bodyPart.setDataHandler(new DataHandler(ds));
						  bodyPart.setFileName(file.getName());  
						  bodyPart.setHeader("Content-ID", "<BarcodeImage>");
						  bodyPart.setDisposition("inline");
						  multipart.addBodyPart(bodyPart);  
						  message.setContent(multipart);  
					 }
					 
				  Transport.send(message);
				  
			         System.out.println("Sent message successfully....");
	 
			      }catch (MessagingException mex) {
			         mex.printStackTrace();
			         }
		// TODO Auto-generated method stub
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		// TODO Auto-generated method stub
		return sendEmailForm;
	}

}
