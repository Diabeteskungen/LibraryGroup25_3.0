/**
 * @author  Lukas Simoni Olof Röjvall David Hägg
 */
package com.example.librarygroup25;



import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;


import java.sql.*;

public class AddCopyController {
    //@FXML annotations
    @FXML
    private TextField IDField;

    @FXML
    private TextField barcodeField;

    @FXML
    private TextField cTypeField;

    @FXML
    private Label addCopyErrorText;

    //on button press sp check and add copy, query
    public void onAddCopyButton(ActionEvent actionEvent) throws SQLException {
        String addCopy = "{ CALL spAddCopy (?, ?, ?)}";
        String[] testArr = getUser();
        if (checkEmptyFields(testArr) == true) {
            Query query = new Query();
            String[] insertsActual = getUser();
            try {
                query.queryTriple(addCopy, insertsActual[0], insertsActual[1], insertsActual[2]);
            } catch (SQLException e) {
                e.printStackTrace();
                e.getCause();
            }

        }

    }
    //string for adding information of copy
    public String[] getUser() {
        String[] inserts;
        String insertID = IDField.getText();
        String insertBarcode = barcodeField.getText();
        String insertCType = cTypeField.getText();

        inserts = new String[]{insertID, insertBarcode, insertCType,};
        return inserts;
    }

    //Boolean for information entry into the textfields
    public boolean checkEmptyFields(String[] inserts) {
        boolean allFilled = true;
        for (int i = 0; i < inserts.length; i++) {
            if (inserts[i].equals("n")) {
                allFilled = false;
                addCopyErrorText.setText("Please provide all information");
            }

        }
        return allFilled;
    }

}




