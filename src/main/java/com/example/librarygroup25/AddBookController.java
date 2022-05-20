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

public class AddBookController {
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
    private TextField Location;

    @FXML
    private Label registerErrorText;

    @FXML
    private Button AddBookButton;

    public boolean checkEmtyFields(String[] inserts) {
        boolean allFilled = true;
        for (int i = 0; i < inserts.length; i++) {
            if (inserts[i].equals("n")) {
                allFilled = false;
                registerErrorText.setText("Please enter all the information for the book");
            }
        }return allFilled;

    }
    @FXML
    protected void onAddBookButton(ActionEvent event)throws Exception {
        String addBook = ("{ CALL spAddBook(?, ?, ?, ?, ?, ?) }");
        String[] UserInfo = getUser();
        if (checkEmtyFields(UserInfo) == true) {
            Query query = new Query();
            String[] actualBookInfo = getUser();
            try {
                query.querySix(addBook, actualBookInfo[0], actualBookInfo[1], actualBookInfo[2], actualBookInfo[3], actualBookInfo[4], actualBookInfo[5]);
                Stage stage = (Stage) AddBookButton.getScene().getWindow();
                stage.close();
                FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("addItem.fxml"));
                Parent root1 = (Parent) fxmlLoader.load();
                stage = new Stage();
                stage.setScene(new Scene(root1));
                stage.show();
            } catch (SQLException e){
                e.printStackTrace();
                e.getCause();
            }

        }
    }
    public String[] getUser() {
        String[] inserts;
        String isbn = ISBNfield.getText();
        String title = TitleField.getText();
        String author = AuthorField.getText();
        String publisher = PublisherField.getText();
        String genre = GenreField.getText();
        String location = Location.getText();

        inserts = new String[]{isbn, title, author, publisher, genre, location};
        return inserts;
    }
}
