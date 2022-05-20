package com.example.librarygroup25;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

import java.io.IOException;

public class EditItemController {
    @FXML
    private Button EditBookButton;

    @FXML
    private Button EditDvdButton;

    @FXML
    private Button EditCopyButton;


    public void openEditBook (ActionEvent event) throws IOException {
        Stage stage = (Stage) EditBookButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("editBook.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }


    }

