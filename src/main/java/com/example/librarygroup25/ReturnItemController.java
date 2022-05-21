/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReturnItemController{

    @FXML
    private Button logoutButton;

    @FXML
    private Label returnErrorText;

    @FXML
    private Label textDisplay;

    @FXML
    private TextField BarcodeField;

    public void onLogoutButtonPress(ActionEvent actionEvent) throws Exception { // When button pressed takes you to knew scene
        Stage stage = (Stage) logoutButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpage.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }
    @FXML
    private void onButtonReturnItem(ActionEvent actionEvent) throws SQLException { // Two stored procedures to be able to return item
        String checkIfMissing = "{ CALL spCheckMissing(?) }"; // SP to check if item is missing
        String ReturnItem = "{ CALL spReturnItem(?) }"; // SP to return the item
        Query query = new Query();
        String barcode = BarcodeField.getText();

        try { //First checking if the item is missing with values if the first SP gives output 1 it starts the new SP
            ResultSet resultSet = query.querySingle(checkIfMissing, barcode);
            int check = 0;

            while (resultSet.next()) {
                check = resultSet.getInt("result");
            }
            if (check == 1) { //Starting the return item SP if item is missing
                resultSet = query.querySingle(ReturnItem, barcode);
                while (resultSet.next()) {
                    String title = resultSet.getString("title");
                    textDisplay.setText(title + " has been returned.");
                }
            } else {
                returnErrorText.setText("This item is not missing or the input was wrong. Please try again");
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            e.getCause();
        }
    }
}
