package com.hms.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.hms.db.DBConnection;
import com.hms.model.User;
public class UserDAO {
    Connection con = null;
    public User login(String email, String password) {
        User user = null;
        try {
            con = DBConnection.getConnection();
            String query =
            "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps =
            con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}