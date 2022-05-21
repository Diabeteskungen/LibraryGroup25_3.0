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

public class RemoveItemController {

    @FXML
    private Button homeButton;

    @FXML
    private TextField isbnField;

    @FXML
    private Label removeErrorMessage;

    @FXML
    private Label removeSuccessMessage;

    public void onHomeButtonPress(ActionEvent event) throws Exception { // When button pressed takes you to new scene
        Stage stage = (Stage) homeButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpageAdmin.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }

    public void onRemoveButtonPress(ActionEvent actionEvent) { // A stored procedure to delete item
        Query query = new Query();
        String removeItem = "{ CALL spDeleteItem(?) }";
        try {
            query.querySingle(removeItem, isbnField.getText()); //takes in only the isbn number to know which object to delete in DB
            removeErrorMessage.setText("");
            removeSuccessMessage.setText("Item successfully removed!");

        } catch(SQLIntegrityConstraintViolationException e){
            removeErrorMessage.setText("This item has active copies");
            } catch(SQLException e){
                e.printStackTrace();
                e.getCause();

            }

        }

    }


