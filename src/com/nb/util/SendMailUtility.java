package com.nb.util;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.nb.constants.Constants;
import com.nb.form.SendEmailForm;

public class SendMailUtility {
	
	
	public void sendMail(String emailId , String invoiceFileName)
	{

		MimeMultipart multipart = new MimeMultipart(); 
		BodyPart bodyPart = new MimeBodyPart();  
		String name = "Mehul";
        String msg = "Thank you for using our services. Your Invoice is generated./n"+ 
		   "Your product is under warranty period for next 3 month./n"+
        	"In case of any inconvinience please contact to office number or email id./n"	;
        String subject = "TKD - Invoice";
        String To = emailId;
        String from = Constants.CompanyEmailId;
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
				  File imageFile = new File(Constants.CompanyBillFolderLocation+Constants.CompanyLogo);
					 if(imageFile.exists())
					 {
						 DataSource ds = new FileDataSource(imageFile); 
						  bodyPart.setDataHandler(new DataHandler(ds));
						  bodyPart.setFileName(imageFile.getName());  
						  bodyPart.setHeader("Content-ID", "<BarcodeImage>");
						  bodyPart.setDisposition("inline");
						  multipart.addBodyPart(bodyPart);  
						  message.setContent(multipart);  
					 }
					 bodyPart = new MimeBodyPart();  
				File invoiceFile = new File(Constants.CompanyInvoiceFolderLocation+invoiceFileName);
				if(invoiceFile.exists())
					 {
						 DataSource ds = new FileDataSource(invoiceFile); 
						  bodyPart.setDataHandler(new DataHandler(ds));
						  bodyPart.setFileName(invoiceFile.getName());  
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
		
	
		
		
		
	}

}
