package com.example.librarygroup25;

public class LoanedItems {
    //Class handles LoanedItems object for use in FindMissingItems to be able to display in tableview
    public String title;
    public int loanNr;
    public String user;
    public String barcode;
    public String dateBorrowed;
    public String dateOfReturn;
    public String email;

    public LoanedItems(String title, int loanNr, String user, String barcode, String dateBorrowed, String dateOfReturn, String email) {
        this.title = title;
        this.loanNr = loanNr;
        this.user = user;
        this.barcode = barcode;
        this.dateBorrowed = dateBorrowed;
        this.dateOfReturn = dateOfReturn;
        this.email = email;
    }

    //Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getLoanNr() {
        return loanNr;
    }

    public void setLoanNr(int loanNr) {
        this.loanNr = loanNr;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getDateBorrowed() {
        return dateBorrowed;
    }

    public void setDateBorrowed(String dateBorrowed) {
        this.dateBorrowed = dateBorrowed;
    }

    public String getDateOfReturn() {
        return dateOfReturn;
    }

    public void setDateOfReturn(String dateOfReturn) {
        this.dateOfReturn = dateOfReturn;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
