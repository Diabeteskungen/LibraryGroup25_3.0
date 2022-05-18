package com.example.librarygroup25;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.sql.*;

public class LoginController {

    @FXML
    private TextField UsernameField;

    @FXML
    private TextField PasswordField;

    @FXML
    private Label LoginErrorText;

    @FXML
    private Button buttonLogin;

    @FXML
    protected void onRegisterClick(ActionEvent event) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("register.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        Stage stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();

    }

    @FXML
    protected void onLoginClick(ActionEvent event) throws Exception {
        Query query = new Query();
        String checkPassword = ("{ CALL spCheckPassword(?, ?) }");
        String username = UsernameField.getText();
        String password = PasswordField.getText();
        ResultSet resultSet;
        String pwdFromDB = null;
        LoginErrorText.setText("Wrong username or password");

        try {
            resultSet = query.queryDouble(checkPassword, username, password);

            while (resultSet.next()) {


                resultSet.getString("pwd");
                pwdFromDB = resultSet.getString("pwd");
                if (password.equals(pwdFromDB)) {
                    Stage stage = (Stage) buttonLogin.getScene().getWindow();
                    stage.close();
                    FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpageUser.fxml"));
                    Parent root1 = (Parent) fxmlLoader.load();
                    stage = new Stage();
                    stage.setScene(new Scene(root1));
                    stage.show();

                }


            }
        }catch(SQLException e){
                e.printStackTrace();
            }

        }





}


