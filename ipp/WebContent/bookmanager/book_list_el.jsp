<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="book_error.jsp" import="java.util.*,ipp.book.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html> 
<head>
<link rel="stylesheet" href="book.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(isbn) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="book_control.jsp?action=edit&isbn="+isbn+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 목록:목록화면</title>

</head>

<body>
<div align="center"> 
<H2>도서 목록:목록화면</H2>
<HR>
<form>
<a href="bookmanager_form.jsp">도서목록 등록</a><P>

		<table border="1">
			<tr><th>책 번 호</th><th>책 이 름</th><th>저 자</th><th>출 판 사</th><th>가 격</th><th>출 판 일</th></tr>
			<c:forEach items="${booklists}" var="b">
			  <tr>
			   <td><a href="javascript:check(${b.isbn})">${b.isbn}</a></td>
				<td>${b.title}</td>
				<td>${b.author}</td>
				<td>${b.pub}</td>
				<td>${b.price}</td>
				<td>${b.ddate}</td>
			  </tr>
			</c:forEach>
		</table>
</form>

</div>
</body>
</html>