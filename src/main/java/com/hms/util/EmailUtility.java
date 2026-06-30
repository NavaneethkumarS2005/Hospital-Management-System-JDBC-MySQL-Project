package com.hms.util;

public class EmailUtility {

    public static void sendEmail(
            String toEmail,
            String subject,
            String messageText) {

        System.out.println("Email notification skipped.");
        System.out.println("To: " + toEmail);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + messageText);
    }
}
