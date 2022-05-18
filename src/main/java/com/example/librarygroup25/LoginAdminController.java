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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginAdminController {

    @FXML
    private TextField AdminEmailField;

    @FXML
    private TextField AdminPasswordField;

    @FXML
    private Label LoginErrorText;

    @FXML
    private Button buttonLogin;



    @FXML
    protected void onLoginAdminClick(ActionEvent event) throws Exception {
        Query query = new Query();
        String checkPassword = ("{ CALL spCheckEmployeePassword(?, ?) }");
        String email = AdminEmailField.getText();
        String password = AdminPasswordField.getText();
        ResultSet resultSet;
        String pwdFromDB = null;
        LoginErrorText.setText("Wrong email or password");

        try {
            resultSet = query.queryDouble(checkPassword, email, password);

            while (resultSet.next()) {

                resultSet.getString("pwd");
                pwdFromDB = resultSet.getString("pwd");
                if (password.equals(pwdFromDB)) {
                    Stage stage = (Stage) buttonLogin.getScene().getWindow();
                    stage.close();
                    FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpageAdmin.fxml"));
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
