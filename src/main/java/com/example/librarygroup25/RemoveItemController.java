package com.example.librarygroup25;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import java.sql.*;

public class RemoveItemController {

    @FXML
    private TextField isbnField;

    @FXML
    private Label removeErrorMessage;

    @FXML
    private Label removeSuccessMessage;

    public void onRemoveButtonPress(ActionEvent actionEvent) {
        Query query = new Query();
        String removeItem = "{ CALL spDeleteItem(?) }";
        try {
            query.querySingle(removeItem, isbnField.getText());
            removeErrorMessage.setText("");
            removeSuccessMessage.setText("Item successfully removed!");

        } catch (SQLException e) {
            e.printStackTrace();
            e.getCause();
            removeErrorMessage.setText("This cannot be removed at this time");
        }

    }

}
