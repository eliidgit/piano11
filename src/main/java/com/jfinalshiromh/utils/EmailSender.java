package com.jfinalshiromh.utils;

import com.jfinalshiromh.common.Constants;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;


public class EmailSender {

    public static final String EMAIL_BODY_HEADER = "";
    
    private String host;
    private String MAIL_SUBJECT = "测试邮件";
    private String sender;
    private String username;
    private String password;
    private String mail_from;
    private String charset = "utf-8";

    private static EmailSender emailSender;

    public static EmailSender getInstance() {
        if (emailSender == null) {
            emailSender = new EmailSender();
        }
        return emailSender;
    }

    public EmailSender() {
        this.host = Constants.getValue("emailSmtp");
        this.username = Constants.getValue("emailUsername");
        this.password = Constants.getValue("emailPassword");
        this.mail_from = username;
        this.sender = Constants.getValue("emailSender");
    }

    
    public void send(String subject, String[] mailTo, String mailBody) throws Exception {
        try {
            Properties props = new Properties(); 
            Authenticator auth = new Email_Autherticator(); 
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(props, auth);
            
            MimeMessage message = new MimeMessage(session);
            
            message.setSubject(subject == null ? MAIL_SUBJECT : subject, charset); 
            message.setText("<html><head><meta charset='utf-8'></head><body>" + mailBody + "</body></html>", charset, "html"); 

            message.setSentDate(new Date()); 
            Address address = new InternetAddress(mail_from, sender);
            message.setFrom(address); 
            Address toAddress = null;
            for (int i = 0; i < mailTo.length; i++) {
                toAddress = new InternetAddress(mailTo[i]); 
                message.addRecipient(Message.RecipientType.TO, toAddress);
            }
            toAddress = null;
            Transport.send(message); 
            System.out.println("send ok!");
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception(ex.getMessage());
        }
    }

    
    public class Email_Autherticator extends Authenticator {
        public Email_Autherticator() {
            super();
        }

        public Email_Autherticator(String user, String pwd) {
            super();
            username = user;
            password = pwd;
        }

        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    }

    public static void sendMail(String title, String[] mailTo, String content) {
        String mailBody = EMAIL_BODY_HEADER + content;
        try {
            EmailSender.getInstance().send(title, mailTo, mailBody);
        } catch (Exception e) {
            System.out.println("email send error:" + mailBody);
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        sendMail(null, new String[]{""}, "测试邮件内容");
    }

}
