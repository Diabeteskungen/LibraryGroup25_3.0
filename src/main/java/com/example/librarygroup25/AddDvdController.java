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

public class AddDvdController {


    @FXML
    private TextField ArtNmrfield;

    @FXML
    private TextField TitleField;

    @FXML
    private TextField DirectorField;

    @FXML
    private TextField GenreField;

    @FXML
    private TextField LocationField;

    @FXML
    private Label addDvdErrorText;


    @FXML
    private Button AddDvdButton;

    public boolean checkEmtyFields(String[] inserts) {
        boolean allFilled = true;
        for (int i = 0; i < inserts.length; i++) {
            if (inserts[i].equals("n")) {
                allFilled = false;
                addDvdErrorText.setText("Please enter all the information for the book");
            }
        }
        return allFilled;

    }

    @FXML
    protected void onAddDvdButton(ActionEvent event) throws Exception {
        String addDvd = ("{ CALL spAddDvd(?, ?, ?, ?, ?, ?) }");
        String[] UserInfo = getUser();
        if (checkEmtyFields(UserInfo) == true) {
            Query query = new Query();
            String[] actualDvdInfo = getUser();
            try {
                query.queryFive(addDvd, actualDvdInfo[0], actualDvdInfo[1], actualDvdInfo[2], actualDvdInfo[3], actualDvdInfo[4]);
                Stage stage = (Stage) AddDvdButton.getScene().getWindow();
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

    public String[] getUser() {
        String[] inserts;
        String artnmr = ArtNmrfield.getText();
        String title = TitleField.getText();
        String director = DirectorField.getText();
        String genre = GenreField.getText();
        String location = LocationField.getText();

        inserts = new String[]{artnmr, title, director, genre, location};
        return inserts;
    }
}
