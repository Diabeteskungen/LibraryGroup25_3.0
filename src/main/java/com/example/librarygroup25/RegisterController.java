/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.w3c.dom.Text;

import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ResourceBundle;

public class RegisterController implements Initializable {
    @FXML
    private TextField fNameField;

    @FXML
    private TextField lNameField;

    @FXML
    private TextField uNameField;

    @FXML
    private TextField emailField;

    @FXML
    private TextField pwdField;

    @FXML
    private ComboBox uTypeBox;

    @FXML
    private Button registerButton;

    @FXML
    private Button homeButton;

    @FXML
    private Label registerErrorText;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        uTypeBox.getItems().addAll("Student", "Teacher", "Researcher", "Public");
    }


    public boolean checkEmptyFields(String[] inserts) { // for loop to check if all the textfield has been written on if not error text
        boolean allFilled = true;
        for (int i = 0; i < inserts.length; i++) {
            if (inserts[i].equals("n")) {
                allFilled = false;
                registerErrorText.setText("Please provide all your information");
            }

        }
        return allFilled;

    }

    @FXML
    protected void onRegisterButtonClick(ActionEvent event) throws Exception { //calls on stored procedure to start register new user
        String registerUser = ("{ CALL spRegisterUser(?, ?, ?, ?, ? ,?) }");
        String[] UserInfo = getUser();
        ResultSet resultSet;
        if (checkEmptyFields(UserInfo)) {
            Query query = new Query();
            String[] actualUserInfo = getUser();
            try { //A query for six which takes in all the new variables for the new user
                query.querySix(registerUser, actualUserInfo[0], actualUserInfo[1], actualUserInfo[2], actualUserInfo[3], actualUserInfo[4], actualUserInfo[5]);
                Stage stage = (Stage) registerButton.getScene().getWindow();
                stage.close();
                FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("loginUser.fxml"));
                Parent root1 = (Parent) fxmlLoader.load();
                stage = new Stage();
                stage.setScene(new Scene(root1));
                stage.show();
            } catch (SQLIntegrityConstraintViolationException e) {
                registerErrorText.setText("This email is already registered");
            } catch (SQLException e) {
                e.printStackTrace();
                e.getCause();
            }

        }


    }

    public String shortenToFirstLetter(String uType) { //To get first variable in string to match with DB
    String stringToConvert = (String.valueOf(uTypeBox.getValue()));
    char userType = stringToConvert.charAt(0);
    return Character.toString(userType);
    }

    public String[] getUser() { // Array for the new User using the Textfields input
        String[] inserts;
        String firstname = fNameField.getText();
        String lastname = lNameField.getText();
        String email = emailField.getText();
        String username = uNameField.getText();
        String password = pwdField.getText();
        String uType = shortenToFirstLetter(String.valueOf(uTypeBox.getValue()));

        inserts = new String[]{firstname, lastname, email, username, password, uType};
        return inserts;
    }

    public void onHomeButtonPress(ActionEvent actionEvent) throws Exception { //When button pressed takes you to new scene
        Stage stage = (Stage) homeButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpage.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }
}





