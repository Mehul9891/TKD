package com.nb.controller;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.mail.*;
import javax.mail.internet.*;
import com.nb.form.SendEmailForm;


public class SendEmailController extends SimpleFormController{

	SendEmailForm sendEmailForm = new SendEmailForm();
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		sendEmailForm = (SendEmailForm)command;
		String name = "Mehul";
        String msg = sendEmailForm.getMessage() ;
        String subject = sendEmailForm.getSubject();
        String To = sendEmailForm.getEmailId();
        String from = "whackamole9891@gmail.com";
		 Properties properties = System.getProperties();
		  properties.put("mail.smtp.starttls.enable", "true");
		  properties.setProperty("mail.user", "whackamole9891@gmail.com");
		  properties.setProperty("mail.password", "whackamole");
		     properties.put("mail.smtp.host", "smtp.gmail.com");
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.debug", "true");
	        properties.put("mail.smtp.auth", "true");
	        
	        Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(
	                        "whackamole9891@gmail.com", "whackamole");// Specify the Username and the PassWord
	                }
	              } );
			  try{
				  MimeMessage message = new MimeMessage(session);
				  message.setFrom(new InternetAddress(from));
				  message.addRecipient(Message.RecipientType.TO,
	                    new InternetAddress(To));
				  message.setSubject(subject);
				  message.setText(msg+"\n" +
						  "\n"+
						  "\n"+
				  		  name+" \n"+
				  		 "Theek Kar do.com \n");
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
