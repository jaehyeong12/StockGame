package com.stock.util;

import java.security.MessageDigest;

public class SHA256 {
    public static String getEncrypt(String pwd) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(pwd.getBytes());
            byte[] pwdSalt = md.digest();
            StringBuffer sb = new StringBuffer();
            for (byte b : pwdSalt) {
                sb.append(String.format("%02x", b));
            }
            result = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}