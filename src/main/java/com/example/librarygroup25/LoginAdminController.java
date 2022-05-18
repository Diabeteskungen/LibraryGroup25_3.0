package com.example.librarygroup25;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginAdminController {

    @FXML
    private TextField AdminUsernameField;

    @FXML
    private TextField AdminPasswordField;

    @FXML
    protected void onLoginAdminClick(ActionEvent event) throws Exception {
        Query query = new Query();
        String checkPassword = ("{ CALL spCheckEmployeePassword(?, ?) }");
        String username = AdminUsernameField.getText();
        String password = AdminPasswordField.getText();
        ResultSet resultSet;
        String pwdFromDB = null;

        //CallableStatement checkEmployeePassword = con.prepareCall("{call spCheckEmployeePassword(?, ?)}");

        try {
            resultSet = query.queryDouble(checkPassword, username, password);

            while (resultSet.next()) {

                resultSet.getString("pwd");
                pwdFromDB = resultSet.getString("pwd");
                if (password.equals(pwdFromDB)) {
                    FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpageAdmin.fxml"));
                    Parent root1 = (Parent) fxmlLoader.load();
                    Stage stage = new Stage();
                    stage.setScene(new Scene(root1));
                    stage.show();
                    System.out.println("Login Successful");
                } else {
                    System.out.println("Username or password is wrong");
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

    }
}
