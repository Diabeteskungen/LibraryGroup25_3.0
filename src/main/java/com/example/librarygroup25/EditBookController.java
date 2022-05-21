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

import java.sql.SQLException;

public class EditBookController {
    //@FXML annotations
    @FXML
    private TextField ISBNfield;

    @FXML
    private TextField TitleField;

    @FXML
    private TextField AuthorField;

    @FXML
    private TextField PublisherField;

    @FXML
    private TextField GenreField;

    @FXML
    private TextField LocationField;

    @FXML
    private Label editSuccessMessage;

    @FXML
    private Button EditBookButton;

    //check AddDvd
    @FXML
    protected void onEditBookButton(ActionEvent event)throws Exception {
        String editBook = ("{ CALL spEditBook(?, ?, ?, ?, ?, ?) }");
        String[] UserInfo = getUser();
        Query query = new Query();
        String[] actualBookInfo = getUser();
        try {
            query.querySix(editBook, actualBookInfo[0], actualBookInfo[1], actualBookInfo[2], actualBookInfo[3], actualBookInfo[4], actualBookInfo[5]);
            editSuccessMessage.setText("Book successfully edited!");

        } catch (SQLException e) {
            e.printStackTrace();
            e.getCause();
        }
    }
    //check AddDvd
    public String[] getUser() {
        String[] inserts;
        String isbn = ISBNfield.getText();
        String title = TitleField.getText();
        String author = AuthorField.getText();
        String publisher = PublisherField.getText();
        String genre = GenreField.getText();
        String location = LocationField.getText();

        inserts = new String[]{isbn, title, author, publisher, genre, location};
        return inserts;
    }
}
