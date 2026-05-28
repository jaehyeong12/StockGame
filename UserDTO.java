package com.stock.dto;

import java.sql.Timestamp;

public class UserDTO {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private long userCash;
    private Timestamp regDate;

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getUserPw() { return userPw; }
    public void setUserPw(String userPw) { this.userPw = userPw; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public long getUserCash() { return userCash; }
    public void setUserCash(long userCash) { this.userCash = userCash; }

    public Timestamp getRegDate() { return regDate; }
    public void setRegDate(Timestamp regDate) { this.regDate = regDate; }
}