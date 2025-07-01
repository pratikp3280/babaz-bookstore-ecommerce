package model;

import java.io.Serializable;

public class Book implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String title;
    private String author;
    private String category;
    private double price;
    private int stock;
    private byte[] image;
    
    //Default Constructor : Required for frameworks like JDBC, JSP, or when setting values using setters one by one.
    public Book() {}

    // Parameterized Constructor : to create a Book object quickly without setting each field manualy
    public Book(String title, String author, String category, double price, int stock ) {
        this.title = title;
        this.author = author;
        this.category = category;
        this.price = price;
        this.stock = stock;
        
    }
    
    
 // Getters and setters for all fields

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public byte[] getImage() {
	    return image;
	}

	public void setImage(byte[] image) {
	    this.image = image;
	}
    
    
    
}
