package com.example.librarygroup25;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoanController {

    @FXML
    private TextField BarcodeField;

    @FXML
    private TextField UsernameField;

    @FXML
    private Button CheckLoan;

    @FXML
    private Text RecieptText;

    @FXML
    private VBox RecieptFrame;

    @FXML
    private Button closeReceiptButton;

    @FXML
    private Label loanBookErrorText;

    public void onCLoseReceiptButton(ActionEvent event) throws Exception {
        RecieptText.setText("");
        RecieptFrame.setVisible(false);
        closeReceiptButton.setVisible(false);
    }

    @FXML
    private void onButtonCheckLoan(ActionEvent event) throws SQLException { //Primary function that calls SP:s from database and checks that the book that is trying to be returned fills requirements
        String checkloan = "{ CALL spRegisterloan (?, ?) }";
        String checkreturned = "{CALL spCheckReturned (?) }";
        Query query = new Query();
        String barcode = BarcodeField.getText();
        String username = UsernameField.getText();


        ResultSet resultSet;
        String emailrecipt = null;
        String titlerecipt = null;
        String barcoderecipt = null;
        String borrowedDaterecipt = null;
        String lastReturnDaterecipt = null;
        String isreturned = null;


        try {
            resultSet = query.querySingle(checkreturned, barcode);
            while (resultSet.next()) {
                isreturned = resultSet.getString("returned");

            }

            if (isreturned.equals("True")) {


                resultSet = query.queryDouble(checkloan, barcode, username);
                while (resultSet.next()) {


                    titlerecipt = resultSet.getString("title");
                    barcoderecipt = resultSet.getString("barcode");
                    borrowedDaterecipt = resultSet.getString("borrowedDate");
                    lastReturnDaterecipt = resultSet.getString("lastReturnDate");
                    emailrecipt = resultSet.getString("email");


                    {
                        RecieptText.setText("A recipt has been sent to " + emailrecipt + " containing the following information:\n\nTitle: " +
                                titlerecipt + "\nBarcode: " + barcoderecipt + "\nBorrowed Date: " + borrowedDaterecipt + "\nLast Return Date: " + lastReturnDaterecipt);
                        RecieptFrame.setVisible(true);
                        closeReceiptButton.setVisible(true);

                    }


                }

            }
            } catch(SQLException e){
            e.printStackTrace();
            e.getCause();
        }


    }

    }







