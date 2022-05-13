package com.example.librarygroup25;
import java.sql.*;

public class Query {
    Connection conn;
    CallableStatement callableStatement;
    ResultSet resultSet;

    public Query() {
        final String DATABASE_URL = "jdbc:mysql://localhost:3306/library?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
        conn = null;
        try {
            conn = DriverManager.getConnection(DATABASE_URL, "libraryuser", "abcd1234");
        } catch (SQLException sqlException) {
            System.out.println("Database user does not exist, contact system admin");
        }

    }


    public ResultSet querySingle(String query, String variable) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable);
        resultSet = callableStatement.executeQuery();

        return resultSet;

    }

    public ResultSet queryDouble(String query, String variable1, String variable2) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        resultSet = callableStatement.executeQuery();

        return resultSet;

    }


}


