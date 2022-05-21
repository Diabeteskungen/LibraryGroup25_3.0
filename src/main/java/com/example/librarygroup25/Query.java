/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;
import java.sql.*;

public class Query {
    Connection conn;
    CallableStatement callableStatement;
    ResultSet resultSet;

    //
    public Query() { //establishes connection with the database
        final String DATABASE_URL = "jdbc:mysql://localhost:3306/library?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
        conn = null;
        try {
            conn = DriverManager.getConnection(DATABASE_URL, "libraryuser", "abcd1234");
        } catch (SQLException sqlException) {
            System.out.println("Database user does not exist, contact system admin");
        }
    }

    // This is our function to start a query with 1 variable
    public ResultSet querySingle(String query, String variable) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable);
        resultSet = callableStatement.executeQuery();

        return resultSet;
    }

    //This is our function to start a query with 2 variables
    public ResultSet queryDouble(String query, String variable1, String variable2) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        resultSet = callableStatement.executeQuery();

        return resultSet;
    }

    //This is our function to start a query with 3 variables
    public ResultSet queryTriple(String query, String variable1, String variable2, String variable3) throws SQLException {
        callableStatement = conn.prepareCall(query);
        callableStatement.setString(1, variable1);
        callableStatement.setString(2, variable2);
        callableStatement.setString(3, variable3);
        resultSet = callableStatement.executeQuery();

        return resultSet;
    }

    //This is our function to start a query with 5 variables
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

    //This is our function to start a query with 6 variables
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
//This is our function to start a query with no variables and to only start the stored procedure
    public ResultSet queryZero(String query) throws SQLException {
        callableStatement = conn.prepareCall(query);
        resultSet = callableStatement.executeQuery();

        return resultSet;
    }

}


