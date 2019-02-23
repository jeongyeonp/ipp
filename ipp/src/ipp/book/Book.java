package ipp.book;

public class Book {
	private int isbn;
	private String title;
	private String author;
	private String pub;
	private int price;
	private String ddate;
	
	public Book(int isbn,String title, String author, String pub, int price,String ddate) {
		this.isbn=isbn;
		this.title=title;
		this.author=author;
		this.pub=pub;
		this.price=price;
		this.ddate = ddate;
	}
	
	public Book() {
		// TODO Auto-generated constructor stub
		
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
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

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	
	
}
