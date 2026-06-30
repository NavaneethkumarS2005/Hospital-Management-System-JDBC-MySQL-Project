package com.hms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Read DB settings from environment variables with safe fallbacks.
            String url = System.getenv("DB_URL");
            if (url == null || url.isEmpty()) {
                url = "jdbc:mysql://localhost:3307/hospital_management";
            }
            String user = System.getenv("DB_USER");
            if (user == null || user.isEmpty()) {
                user = "root";
            }
            String pass = System.getenv("DB_PASS");
            if (pass == null) {
                pass = "Hness@cb350"; // update or set DB_PASS in your environment
            }

            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Database Connected to " + url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
