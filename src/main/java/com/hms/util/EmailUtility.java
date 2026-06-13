package com.hms.util;

import java.util.Properties;

import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtility {

    public static void sendEmail(
            String toEmail,
            String subject,
            String messageText) {

        final String fromEmail =
        "navaneethkumar981@gmail.com";

        final String password =
        "evdiabarvsjlkkjx";

        Properties props =
        new Properties();

        props.put(
        "mail.smtp.host",
        "smtp.gmail.com");

        props.put(
        "mail.smtp.port",
        "587");

        props.put(
        "mail.smtp.auth",
        "true");

        props.put(
        "mail.smtp.starttls.enable",
        "true");

        Session session =
        Session.getInstance(
        props,

        new jakarta.mail.Authenticator() {

            protected PasswordAuthentication
            getPasswordAuthentication() {

                return new PasswordAuthentication(
                fromEmail,
                password);
            }
        });

        try {

            Message message =
            new MimeMessage(session);

            message.setFrom(
            new InternetAddress(fromEmail));

            message.setRecipients(
            Message.RecipientType.TO,

            InternetAddress.parse(toEmail));

            message.setSubject(subject);

            message.setText(messageText);

            Transport.send(message);

            System.out.println(
            "Email Sent Successfully!");

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}