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

    public ResultSet queryTriple(String query, String variable1, String variable2, String variable3) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        callableStatement.setString(3, variable3);
        resultSet = callableStatement.executeQuery();

        return resultSet;

    }
    public ResultSet queryFive(String query, String variable1, String variable2, String variable3, String variable4, String variable5) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        callableStatement.setString(3, variable3);
        callableStatement.setString(4, variable4);
        callableStatement.setString(5, variable5);
        resultSet = callableStatement.executeQuery();


        return resultSet;
    }

    public ResultSet querySix(String query, String variable1, String variable2, String variable3, String variable4, String variable5, String variable6) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        callableStatement.setString(3, variable3);
        callableStatement.setString(4, variable4);
        callableStatement.setString(5, variable5);
        callableStatement.setString(6, variable6);
        resultSet = callableStatement.executeQuery();


        return resultSet;
    }


}


