package com.example.librarygroup25;
import java.sql.*;

public class ConnectionMYDB {
    private static String url = "jdbc:mysql://localhost:3306/library?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";

    private static String username = "libraryuser";
    private static String password = "abcd1234";
    private static Connection con;
    private static Statement stmt;



    public static Connection getConnection() {

        try {
            con = DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            ex.getCause();//förklarar exakt varför
            ex.printStackTrace();//röd error
            //i varje catch
            System.out.println("Failed to login user, contact system admin");
        }

        return con;
    }
    //ConnectionMYDB connection = new ConnectionMYDB();
//Connection con = ConnectionMYDB.getConnection();
    //används bara i metod som kräver att hämta data från databasen



}
//try {
//            callableStatement = con.prepareCall(findUser);
//            callableStatement.setString(1, usernameInput);
//            rs = callableStatement.executeQuery();
//
//            while (rs.next()) {
//                userFromDB = rs.getString("username");
//            }
//            if (usernameInput.equals(userFromDB)) {
//                System.out.println("User found");
//            } else {
//                System.out.println("User not found");
//            } //end while
//        } //end try
//        catch (SQLException sqlException){
//            sqlException.printStackTrace();
//          ex.getCause
//        } //end catch
