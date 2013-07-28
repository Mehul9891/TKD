package com.nb.util;


import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;

import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;


import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.nb.constants.Constants;
import com.nb.entity.CompletedRequest;
import com.nb.entity.Customer;



public class InvoiceGenerator {
	

	 private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
		      Font.BOLD);
		  private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
		      Font.NORMAL, BaseColor.RED);
		  private static Font fillFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,
		      Font.BOLD,BaseColor.RED);
		  private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 10,
		      Font.NORMAL);  
		  String invoiceFileName =null;
	public String  createInvoice(CompletedRequest completedRequest ,Customer customer) {
	
			try {
				Rectangle pagesize = new Rectangle(600f, 400f);
				Document document = new Document(pagesize, 30f, 30f, 20f, 20f);
				document.addAuthor("Mehul Gupta");
				 invoiceFileName =completedRequest.getCustId()+"_"+completedRequest.getCompt_sr_no()+"_Invoice.pdf";
				OutputStream file = new FileOutputStream(new File(Constants.CompanyInvoiceFolderLocation+invoiceFileName));
				  
		
				
		
				PdfWriter.getInstance(document, file);
				
				Image image = Image.getInstance(Constants.CompanyInvoiceFolderLocation+"TKD.jpg");
				
				image.scaleAbsolute(60, 60);
				
				document.open();
				PdfPTable table = new PdfPTable(5);
				table.setWidthPercentage(100);
				Paragraph para = new Paragraph();
				PdfPCell cellrow1 = new PdfPCell(image);
				cellrow1.setBorder(Rectangle.NO_BORDER);
				table.addCell(cellrow1);
				
				PdfPCell cellSpaceCommon = new PdfPCell(new Phrase( new Chunk("                      ").setUnderline(BaseColor.BLUE, 0.1f, 0.1f, 0f, 0f, 0)));
				cellSpaceCommon.setBorder(Rectangle.NO_BORDER);
				
				
				cellrow1 = new PdfPCell(new Paragraph("SERVICE INVOICE", catFont));
				cellrow1.setBorder(Rectangle.NO_BORDER);
				cellrow1.setVerticalAlignment(5);
				cellrow1.setHorizontalAlignment(0);
				cellrow1.setNoWrap(true);
				table.addCell(cellrow1);
			
				table.addCell(cellSpaceCommon);
				 para = new Paragraph("InstaCare Repair Solutions LLP", smallBold);
				para.add(new Paragraph("+91 8080 853 853", smallBold));
				para.add(new Chunk("info@theekkardo.com", smallBold).setUnderline(0.1f, -2f));
				para.add( Chunk.NEWLINE );
				para.add(new Chunk("www.theekkardo.com", smallBold).setUnderline(0.1f, -2f));
				
				cellrow1.addElement(para);
				cellrow1.setBorder(Rectangle.NO_BORDER);
				cellrow1.setNoWrap(true);
				table.addCell(cellrow1);
				table.addCell(cellSpaceCommon);
				document.add(table);
		/****************************************cell 2 **************************/
				document.add(new Phrase( new Chunk("                                                                                                                                       ").setUnderline(BaseColor.BLUE, 0.1f, 0.1f, 0f, 0f, 10)));
				document.add(Chunk.NEWLINE);
				
				table = new PdfPTable(6);
				PdfPCell cellrow2 = new PdfPCell(new Paragraph("Invoice #:", smallBold));
				cellrow2.setBorder(Rectangle.NO_BORDER);
				cellrow2.setNoWrap(true);
				table.addCell(cellrow2);
				
				 cellrow2 = new PdfPCell(new Paragraph(""+completedRequest.getCompt_sr_no(), fillFont));
					cellrow2.setBorder(Rectangle.NO_BORDER);
					cellrow2.setHorizontalAlignment(0);
					cellrow2.setNoWrap(true);
					table.addCell(cellrow2);
				
				table.addCell(cellSpaceCommon);
				cellrow2 = new PdfPCell(new Paragraph("Date: ", smallBold));
				cellrow2.setBorder(Rectangle.NO_BORDER);
				cellrow2.setNoWrap(true);
				table.addCell(cellrow2);
				cellrow2 = new PdfPCell(new Paragraph(""+completedRequest.getDate_of_solving(), fillFont));
				cellrow2.setBorder(Rectangle.NO_BORDER);
				cellrow2.setHorizontalAlignment(0);
				cellrow2.setNoWrap(true);
				table.addCell(cellrow2);
				table.addCell(cellSpaceCommon);
				document.add(table);
		/****************************************cell 3 **************************/		
				
				
				table = new PdfPTable(4);
				PdfPCell cellrow3 = new PdfPCell(new Paragraph("Customer Name: ", smallBold));
				cellrow3.setBorder(Rectangle.NO_BORDER);
				cellrow3.setNoWrap(true);
				table.addCell(cellrow3);
				
				cellrow3 = new PdfPCell(new Phrase( new Paragraph(""+customer.getName(),fillFont)));
				cellrow3.setBorder(Rectangle.NO_BORDER);
				cellrow3.setHorizontalAlignment(0);
				cellrow3.setNoWrap(true);
				table.addCell(cellrow3);
				cellrow3 = new PdfPCell(new Paragraph("Customer Number: ", smallBold));
				cellrow3.setBorder(Rectangle.NO_BORDER);
				cellrow3.setNoWrap(true);
				table.addCell(cellrow3);
				
				cellrow3 = new PdfPCell(new Phrase( new Paragraph(""+customer.getMobile_no(),fillFont)));
				cellrow3.setBorder(Rectangle.NO_BORDER);
				cellrow3.setHorizontalAlignment(0);
				cellrow3.setNoWrap(true);
				table.addCell(cellrow3);
				document.add(table);
			
		/****************************************cell 4 **************************/		
				
				
				table = new PdfPTable(4);
				PdfPCell cellrow4 = new PdfPCell(new Paragraph("Customer Address: ", smallBold));
				cellrow4.setBorder(Rectangle.NO_BORDER);
				cellrow4.setColspan(1);
				cellrow4.setNoWrap(true);
				table.addCell(cellrow4);
				cellrow4 = new PdfPCell(new Phrase( new Paragraph(""+customer.getCust_address(),fillFont)));
				cellrow4.setBorder(Rectangle.NO_BORDER);
				cellrow4.setHorizontalAlignment(0);
				cellrow4.setColspan(3);
				cellrow4.setNoWrap(true);
				table.addCell(cellrow4);
				document.add(table);		
				
				
		 /****************************************cell 5 **************************/		
				
				
				table = new PdfPTable(6);
				PdfPCell cellrow5 = new PdfPCell(new Paragraph("Product: ", smallBold));
				cellrow5.setBorder(Rectangle.NO_BORDER);
				cellrow5.setNoWrap(true);
				table.addCell(cellrow5);
				cellrow5 = new PdfPCell(new Phrase( new Paragraph(""+completedRequest.getProduct(),fillFont)));
				cellrow5.setBorder(Rectangle.NO_BORDER);
				cellrow5.setHorizontalAlignment(0);
				cellrow5.setNoWrap(true);
				table.addCell(cellrow5);
				
				cellrow5 = new PdfPCell(new Paragraph("Brand: ", smallBold));
				cellrow5.setBorder(Rectangle.NO_BORDER);
				cellrow5.setNoWrap(true);
				table.addCell(cellrow5);
				cellrow5 = new PdfPCell(new Phrase( new Paragraph(" "+completedRequest.getProduct_company(),fillFont)));
				cellrow5.setBorder(Rectangle.NO_BORDER);
				cellrow5.setHorizontalAlignment(0);
				cellrow5.setNoWrap(true);
				table.addCell(cellrow5);
				
				cellrow5 = new PdfPCell(new Paragraph("SRN#: ", smallBold));
				cellrow5.setBorder(Rectangle.NO_BORDER);
				cellrow5.setNoWrap(true);
				table.addCell(cellrow5);
				table.addCell(cellSpaceCommon);
				
				document.add(table);			
				
			/****************************************cell 6 **************************/		
				
				
				table = new PdfPTable(1);
				PdfPCell cellrow6 = new PdfPCell(new Paragraph("Product Details: " + completedRequest.getProduct_details(), smallBold));
				cellrow6.setNoWrap(false);
				cellrow6.setBorderWidth(1);
				cellrow6.setBorderColor(BaseColor.BLUE);
				cellrow6.setFixedHeight(30);
				table.addCell(cellrow6);
				
				
				document.add(table);		
				
	/****************************************cell 7 **************************/		
				
				
				table = new PdfPTable(5);
				PdfPCell cellrow7 = new PdfPCell(new Paragraph("Issue Diagnosed: "+completedRequest.getProblem(), smallBold));
				
				cellrow7.setPaddingTop(2);
				cellrow7.setColspan(3);
				cellrow7.setBorderWidth(1);
				cellrow7.setRowspan(2);
				cellrow7.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow7);
				cellrow7 = new PdfPCell(new Paragraph("Repair Charges ", smallBold));
				cellrow7.setBorder(Rectangle.NO_BORDER);
				cellrow7.setRowspan(1);
				cellrow7.setNoWrap(true);
				table.addCell(cellrow7);
				cellrow7 = new PdfPCell(new Paragraph("Rs"+completedRequest.getSp_amt_col(), fillFont));
				cellrow7.setFixedHeight(20);
				cellrow7.setBorder(Rectangle.BOX);
				cellrow7.setBorderWidth(1);
				cellrow7.setRowspan(1);
				cellrow7.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow7);
				cellrow7 = new PdfPCell(new Paragraph("TKD Service Fee ", smallBold));
				cellrow7.setBorder(Rectangle.NO_BORDER);
				cellrow7.setRowspan(1);
				cellrow7.setNoWrap(true);
				table.addCell(cellrow7);
				cellrow7 = cellSpaceCommon;
				cellrow7.setFixedHeight(20);
				cellrow7.setBorder(Rectangle.BOX);
				cellrow7.setRowspan(1);
				cellrow7.setBorderWidth(1);
				cellrow7.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow7);
				
				document.add(table);		

		
/****************************************cell 8 **************************/		
				
				
				table = new PdfPTable(5);
				PdfPCell cellrow8 = new PdfPCell(new Paragraph("Resolution: "+completedRequest.getProduct()+" is repaired now.", smallBold));
				cellrow8.setNoWrap(false);
				cellrow8.setPaddingTop(2);
				cellrow8.setColspan(3);
				cellrow8.setBorderWidth(1);
				cellrow8.setRowspan(2);
				cellrow8.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow8);
				cellrow8 = new PdfPCell(new Paragraph("Total Bill Amount ", smallBold));
				cellrow8.setBorder(Rectangle.NO_BORDER);
				cellrow8.setRowspan(1);
				cellrow8.setNoWrap(true);
				table.addCell(cellrow8);
				cellrow8 = new PdfPCell(new Paragraph("Rs"+completedRequest.getSp_amt_col(), fillFont));;
				cellrow8.setFixedHeight(20);
				cellrow8.setBorder(Rectangle.BOX);
				cellrow8.setBorderWidth(1);
				cellrow8.setRowspan(1);
				cellrow8.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow8);
					
				cellrow8 = cellSpaceCommon;
				cellrow8.setFixedHeight(20);
				cellrow8.setBorder(Rectangle.NO_BORDER);
				cellrow8.setRowspan(1);
				table.addCell(cellrow8);

				table.addCell(cellrow8);
				
				document.add(table);		
/****************************************cell 9 **************************/		
				
				
				table = new PdfPTable(5);
				PdfPCell cellrow9 = new PdfPCell(new Paragraph("Comments: "+completedRequest.getFeedback(), smallBold));
				cellrow9.setNoWrap(false);
				cellrow9.setPaddingTop(2);
				cellrow9.setColspan(3);
				cellrow9.setRowspan(2);
				cellrow9.setBorderWidth(1);
				cellrow9.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow9);
				cellrow9 = new PdfPCell(new Paragraph("Customer Signature: ", smallBold));
				cellrow9.setBorder(Rectangle.NO_BORDER);
				cellrow9.setRowspan(1);
				cellrow9.setNoWrap(true);
				table.addCell(cellrow9);
				cellrow9 = cellSpaceCommon;
				cellrow9.setFixedHeight(20);
				cellrow9.setBorder(Rectangle.BOX);
				cellrow9.setRowspan(1);
				cellrow9.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow9);
				cellrow9 = new PdfPCell(new Paragraph("Service Personnel Signature: ", smallBold));
				cellrow9.setBorder(Rectangle.NO_BORDER);
				cellrow9.setRowspan(1);
				cellrow9.setNoWrap(false);
				table.addCell(cellrow9);
				cellrow9 = cellSpaceCommon;
				cellrow9.setFixedHeight(20);
				cellrow9.setBorder(Rectangle.BOX);
				cellrow9.setRowspan(1);
				cellrow9.setBorderColor(BaseColor.BLUE);
				table.addCell(cellrow9);
				
				document.add(table);		

/****************************************cell 10 **************************/		
				table = new PdfPTable(1);
				PdfPCell cellrow10 = new PdfPCell(new Paragraph("\"Three Month Warranty from the date of Invoice.\"", catFont));
				cellrow10.setNoWrap(true);
				cellrow10.setBorder(Rectangle.NO_BORDER);
				table.addCell(cellrow10);				
				document.add(table);	
				table = new PdfPTable(1);
				PdfPCell cellrow11 = new PdfPCell(new Paragraph("Communication Address: A/52, Om Heera Panna Mall, Oshiwara, Mumbai, 400 053", smallBold));
				cellrow11.setNoWrap(true);
				cellrow11.setBorder(Rectangle.NO_BORDER);
				table.addCell(cellrow11);				
				document.add(table);
				
				document.close();
				file.close();
				System.out.println("File Created Successfully");
				return invoiceFileName;
			
			} catch (Exception e) {
		
				System.out.println("Invoice File Not Created");
				e.printStackTrace();
				return null;
			}
     }

}
