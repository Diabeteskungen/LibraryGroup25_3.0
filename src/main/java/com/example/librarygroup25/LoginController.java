package com.example.librarygroup25;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

import java.sql.*;

public class LoginController {

    @FXML
    private TextField UsernameField;

    private void login() throws SQLException {
        Query query = new Query();
        String findUser = "{ CALL spFindUser(?) }";
        String checkPassword = "{ CALL spCheckPassword(?, ?)}";
        String username = UsernameField.getText();
        ResultSet resultSet;
        String result = null;

        try {
            resultSet = query.querySingle(findUser, username);

            while (resultSet.next()) {
                result = resultSet.getString("result");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}

