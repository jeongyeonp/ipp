package ipp.book;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
	/* Oracle 연결정보 */
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	
	Connection connn;
	PreparedStatement pst;
	ResultSet r;

	public boolean insertDB(Book book) {
		connectDB();
		String sql = "insert into book values(?,?,?,?,?,?)";
		try {
			pst = connn.prepareStatement(sql);
			pst.setInt(1, book.getIsbn());
			pst.setString(2, book.getTitle());
			pst.setString(3, book.getAuthor());
			pst.setString(4, book.getPub());
			pst.setInt(5, book.getPrice());
			pst.setString(6, book.getDdate());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			closeDB();
		}
		return true;
	}
	public boolean deleteDB(int isbn) {
		connectDB();
		
		String sql ="delete from book where isbn=?";
		
		try {
			pst = connn.prepareStatement(sql);
			pst.setInt(1,isbn);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			closeDB();
		}
		return true;
		
	}
 
	public Book getDB(int isbn) {
		connectDB();
		String sql = "select * from book where isbn=?"; 
		Book book = new Book();

		try {
			pst = connn.prepareStatement(sql);
			pst.setInt(1, isbn);
			r = pst.executeQuery();
			r.next();
			
				book.setIsbn(r.getInt("isbn"));
				book.setTitle(r.getString("title"));
				book.setAuthor(r.getString("author"));
				book.setPub(r.getString("pub"));
				book.setPrice(r.getInt("price"));
				book.setDdate(r.getString("ddate"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			closeDB();
		}
		return book;
	}
	public boolean updateDB(Book book) {
		connectDB();
		String sql = "update book set isbn=?, title=?, author=?,pub=?, price=?, ddate=? where isbn=?";
		try {
			pst = connn.prepareStatement(sql);
			pst.setInt(1, book.getIsbn());
			pst.setString(2, book.getTitle());
			pst.setString(3, book.getAuthor());
			pst.setString(4, book.getPub());
			pst.setInt(5, book.getPrice());
			pst.setString(6, book.getDdate());
			pst.setInt(7, book.getIsbn());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			closeDB();
		}	
		return true;
	}
	public ArrayList<Book> selectDB() {
		ArrayList<Book> booklist = new ArrayList<Book>();
		connectDB();
		String sql = "select * from book";
		try {
			pst = connn.prepareStatement(sql);
			r = pst.executeQuery();
			while(r.next()) {
				Book book = new Book();
				book.setIsbn(r.getInt("isbn"));
				book.setTitle(r.getString("title"));
				book.setAuthor(r.getString("author"));
				book.setPub(r.getString("pub"));
				book.setPrice(r.getInt("price"));
				book.setDdate(r.getString("ddate"));
				booklist.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			closeDB();
		}
		return booklist;
	}
	  
	// DB연결 메서드
	public void connectDB() {
		try {
			// 1단계: JDBC드라이버 로드
			Class.forName(jdbc_driver);
			
			// 2단계: 데이터베이스 연결
			connn = DriverManager.getConnection(jdbc_url,"system","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB 연결 종료 메서드
	public void closeDB() {
		try {
			// 6단계: 연결 해제
			pst.close();
			//rs.close();
			connn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
