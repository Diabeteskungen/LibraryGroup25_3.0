package com.example.librarygroup25;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class MissingItemsController implements Initializable {

    @FXML
    private Button updateButton;

    @FXML
    private TableView<LoanedItems> missingItemsList;

    @FXML
    private TableColumn<Items,String> title;

    @FXML
    private TableColumn<Items,String> loanNr;

    @FXML
    private TableColumn<Items,String> user;

    @FXML
    private TableColumn<Items,String> barcode;

    @FXML
    private TableColumn<Items,String> dateBorrowed;

    @FXML
    private TableColumn<Items,String> dateOfReturn;
    @FXML
    private TableColumn<Items,String> email;

    public static ObservableList<LoanedItems> items = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        items.clear();
        title.setCellValueFactory(new PropertyValueFactory<>("Title"));
        loanNr.setCellValueFactory(new PropertyValueFactory<>("loanNr"));
        user.setCellValueFactory(new PropertyValueFactory<>("User"));
        barcode.setCellValueFactory(new PropertyValueFactory<>("Barcode"));
        dateBorrowed.setCellValueFactory(new PropertyValueFactory<>("dateBorrowed"));
        dateOfReturn.setCellValueFactory(new PropertyValueFactory<>("dateOfReturn"));
        email.setCellValueFactory(new PropertyValueFactory<>("Email"));
        missingItemsList.setItems(items);

    }
    public void onUpdateButton(ActionEvent actionEvent) {
        items.clear();
        ResultSet resultSet;
        String findMissingItems = "{ CALL spfindMissingItems() }";
        Query query = new Query();

        try {
            resultSet = query.queryZero(findMissingItems);

            while (resultSet.next()) {
                items.add(new LoanedItems(resultSet.getString("title"), resultSet.getInt("loanNr"), resultSet.getString("username"), resultSet.getString("barcode"), String.valueOf(resultSet.getString("borrowedDate")), resultSet.getString("lastReturnDate"), resultSet.getString("email")));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
