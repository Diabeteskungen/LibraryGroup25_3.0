package com.example.librarygroup25;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

import java.sql.SQLException;

public class EditDvdController {
    @FXML
    private TextField ArtNmrField;

    @FXML
    private TextField TitleField;

    @FXML
    private TextField DirectorField;


    @FXML
    private TextField GenreField;

    @FXML
    private TextField NewLocationField;

    @FXML
    private TextField PGField;

    @FXML
    private Label editSuccessMessage;

    @FXML
    private Button EditDvdButton;

    @FXML
    protected void onEditDvdButton(ActionEvent event)throws Exception {
        String editBook = ("{ CALL spEditDvd(?, ?, ?, ?, ?, ?) }");
        String[] UserInfo = getUser();
        Query query = new Query();
        String[] actualDvdInfo = getUser();
        try {
            query.querySix(editBook, actualDvdInfo[0], actualDvdInfo[1], actualDvdInfo[2], actualDvdInfo[3], actualDvdInfo[4], actualDvdInfo[5]);
            editSuccessMessage.setText("Book successfully edited!");

        } catch (SQLException e) {
            e.printStackTrace();
            e.getCause();
        }
    }
    public String[] getUser() {
        String[] inserts;
        String artnumber = ArtNmrField.getText();
        String title = TitleField.getText();
        String director = DirectorField.getText();
        String genre = GenreField.getText();
        String newlocation = NewLocationField.getText();
        String PG = PGField.getText();

        inserts = new String[]{artnumber, title, director, genre, newlocation, PG};
        return inserts;
    }
}


