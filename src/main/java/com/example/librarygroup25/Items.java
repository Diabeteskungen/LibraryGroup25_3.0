package com.example.librarygroup25;

public class Items {
    //Strings
    String id;
    String title;
    String author;
    String genre;

public Items(String id, String title, String author, String genre){
    //attributes for objects
    this.id = id;
    this.title = title;
    this.author = author;
    this.genre = genre;
}
    //getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}

