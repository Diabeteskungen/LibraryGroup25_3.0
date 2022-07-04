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
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.sql.SQLException;

public class AddBookController extends AddItem {
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
    private Label registrationError;

    @FXML
    private Button AddBookButton;


    //on button press sp check and add book, querysix
    @FXML
    protected void onAddBookButton(ActionEvent event) throws Exception {
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
            } catch (SQLException e) {
                e.printStackTrace();
                e.getCause();
            }

        }
    }

}


