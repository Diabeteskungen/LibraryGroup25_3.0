/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableView;
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
    private Button buttonRegister;

    @FXML
    private Button homeButton;

    @FXML
    private TableView<Items> missingItemsList;

    @FXML
    protected void onRegisterClick(ActionEvent event) throws Exception { //staring a new window when button pressed
        Stage stage = (Stage) buttonRegister.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("register.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();


    }

    public void onHomeButtonPress(ActionEvent actionEvent) throws Exception { //staring a new window when button pressed
        Stage stage = (Stage) homeButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpage.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }

    @FXML
    protected void onLoginClick(ActionEvent event) throws Exception { // Same query as in login admin but for user
        Query query = new Query();
        String checkPassword = ("{ CALL spCheckPassword(?, ?) }");
        String username = UsernameField.getText();
        String password = PasswordField.getText();
        ResultSet resultSet;
        String pwdFromDB = null;
        LoginErrorText.setText("Wrong username or password");

        try {
            resultSet = query.queryDouble(checkPassword, username, password);

            while (resultSet.next()) { //comparing input password with DB


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
            e.getCause();
            }

        }





}


