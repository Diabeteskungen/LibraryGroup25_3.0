package com.example.librarygroup25;

import javafx.event.EventHandler;
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
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class StartpageController implements Initializable {


    @FXML
    private Label stage;


    @FXML
    private Button buttonLogin;

    @FXML
    private Button buttonAdmin;

    @FXML
    private Button searchbutton;

    @FXML
    private Button backButton;

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


    protected void search () throws Exception { // Exactly the same function as for admin controller but for user check LoginaAdminController for full information

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



                public void onLoginButtonClick (ActionEvent event) throws Exception {
                Stage stage = (Stage) buttonLogin.getScene().getWindow();
                stage.close();
                FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("loginUser.fxml"));
                Parent root1 = (Parent) fxmlLoader.load();
                stage = new Stage();
                stage.setScene(new Scene(root1));
                stage.show();

            }

            public void onAdminButtonClick (ActionEvent event) throws IOException {
                Stage stage = (Stage) buttonAdmin.getScene().getWindow();
                stage.close();
                FXMLLoader fxmlLoader = new FXMLLoader(Application.class.getResource("loginAdmin.fxml"));
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
        backButton.setVisible(true);

    }

    public void onBackButtonPress(ActionEvent actionEvent) throws Exception {
        backButton.setVisible(false);
        searchResult.setVisible(false);
        searchbutton.setVisible(true);
    }
}


