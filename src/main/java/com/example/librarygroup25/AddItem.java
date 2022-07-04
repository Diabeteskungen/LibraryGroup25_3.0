/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public abstract class AddItem {
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
    private Button AddBookButton;

    @FXML
    private Text registrationError;

    //Boolean for information entry into the textfields
    public boolean checkEmtyFields(String[] inserts) {
        boolean allFilled = true;
        for (int i = 0; i < inserts.length; i++) {
            if (inserts[i].equals("n")) {
                allFilled = false;
                registrationError.setText("Please fill all the fields");
            }
        }
        return allFilled;
    }

    //string for adding information of book
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
