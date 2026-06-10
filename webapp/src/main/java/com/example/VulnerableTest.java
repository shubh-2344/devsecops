package com.example;

import java.security.MessageDigest;

public class VulnerableTest {
    public static void main(String[] args) throws Exception {
        String password = "Admin@123"; // Hardcoded credential

        MessageDigest md = MessageDigest.getInstance("MD5"); // Weak hash algorithm

        System.out.println(password);
    }
}