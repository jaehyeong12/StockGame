package com.stock.dao;

import com.stock.dto.UserDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private final String URL = "jdbc:mysql://localhost:3306/stock_game?useSSL=false&serverTimezone=UTC";
    private final String USER = "root";
    private final String PASS = "thsrkfkr123!";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // 회원가입
    public int join(UserDTO user) {
        String sql = "INSERT INTO users (user_id, user_pw, user_name, user_email) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPw());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserEmail());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    // 로그인
    public int login(String userId, String userPw) {
        String sql = "SELECT user_pw FROM users WHERE user_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    if (rs.getString(1).equals(userPw)) {
                        return 1;  // 로그인 성공
                    } else {
                        return 0;  // 비밀번호 불일치
                    }
                }
                return -1; // 아이디 없음
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB 오류
    }
}