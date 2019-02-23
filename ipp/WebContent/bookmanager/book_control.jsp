<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="book_error.jsp" import="ipp.book.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bo" class="ipp.book.BookDAO"/> 
<jsp:useBean id="book" class="ipp.book.Book"/>
<jsp:setProperty name="book" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터 
	String action = request.getParameter("action");

	

	if(action.equals("list")) {
		ArrayList<Book> booklists = bo.selectDB();
		request.setAttribute("booklists", booklists);
		pageContext.forward("book_list_el.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(bo.insertDB(book)) {
			response.sendRedirect("book_control.jsp?action=list");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		Book bbook = bo.getDB(book.getIsbn());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("b",bbook);
			pageContext.forward("book_edit_form.jsp");
		}
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(bo.updateDB(book)) {
				response.sendRedirect("book_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(bo.deleteDB(book.getIsbn())) {
			response.sendRedirect("book_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>