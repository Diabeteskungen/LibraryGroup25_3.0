package com.example.librarygroup25;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;



public class StartpageAdminController implements Initializable {



    @FXML
    private Button searchbutton;

    @FXML
    private Button addItemButton;

    @FXML
    private Button removeItemButton;

    @FXML
    private Button backButton;

    @FXML
    private Button logoutButton;

    @FXML
    private Button editItemButton;

    @FXML
    private TextField searchInput;

    @FXML
    private TableView<Items> searchResult;

    @FXML
    private TableColumn<Items,String> title;

    @FXML
    private TableColumn<Items,String> author;

    @FXML
    private TableColumn<Items,String> genre;

    @FXML
    private TableColumn<Items,String> id;

    public static ObservableList<Items> itemsinDB = FXCollections.observableArrayList();

    public StartpageAdminController() {
    }


    protected void search () throws Exception {

        Query query = new Query();
        itemsinDB.clear();
        String checkBookExist = ("{ CALL spFindBook (?) }");
        String checkDvdExist = ("{ CALL spFindDvd (?) }");
        String searchInputText = searchInput.getText();
        ResultSet resultSet;
        String outputFromDB = null;

        try {
            resultSet = query.querySingle(checkBookExist, searchInputText);

            while (resultSet.next()) {
                itemsinDB.add(new Items(resultSet.getString("isbn"), resultSet.getString("bTitle"),resultSet.getString("author"),resultSet.getString("tags")));

            }
            resultSet = query.querySingle(checkDvdExist, searchInputText);

            while (resultSet.next()) {
                itemsinDB.add(new Items(resultSet.getString("artNr"), resultSet.getString("dTitle"),resultSet.getString("director"),resultSet.getString("tags")));

            }
            searchResult.setVisible(true);
        } catch (SQLException e) {
            e.printStackTrace();
            e.getCause();
        }
    }

    public void openaddItem (ActionEvent event) throws IOException {
        Stage stage = (Stage) addItemButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("addItem.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }

    public void openRemoveItem (ActionEvent event) throws IOException {
        Stage stage = (Stage) removeItemButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("removeItem.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }

    public void onEditItemButton (ActionEvent event) throws IOException {
        Stage stage = (Stage) editItemButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("editItem.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        title.setCellValueFactory(new PropertyValueFactory<>("title"));
        author.setCellValueFactory(new PropertyValueFactory<>("author"));
        genre.setCellValueFactory(new PropertyValueFactory<>("genre"));
        id.setCellValueFactory(new PropertyValueFactory<>("id"));

        searchResult.setItems(itemsinDB);

    }

    public void searchbuttonaction(ActionEvent actionEvent) throws Exception {
        search();
        searchbutton.setVisible(false);
        removeItemButton.setVisible(false);
        addItemButton.setVisible(false);
        backButton.setVisible(true);

    }

    public void onBackButtonPress(ActionEvent actionEvent) throws Exception {
        backButton.setVisible(false);
        searchResult.setVisible(false);
        searchbutton.setVisible(true);
        removeItemButton.setVisible(true);
        addItemButton.setVisible(true);
    }
    public void onLogoutButtonPress(ActionEvent actionEvent) throws Exception {
        Stage stage = (Stage) logoutButton.getScene().getWindow();
        stage.close();
        FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("startpage.fxml"));
        Parent root1 = (Parent) fxmlLoader.load();
        stage = new Stage();
        stage.setScene(new Scene(root1));
        stage.show();
    }
}




