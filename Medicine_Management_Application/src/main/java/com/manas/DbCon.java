package com.manas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/medical?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String password = "manas";
        return DriverManager.getConnection(url, user, password);
    }
}