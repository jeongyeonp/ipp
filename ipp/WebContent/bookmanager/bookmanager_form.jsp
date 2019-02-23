<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="book_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 목록</title>
<link rel="stylesheet" href="book.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>도서목록:작성화면 </H2>
<HR>
[<a href=book_control.jsp?action=list>도서 관리 목록으로</a>] <P>
<form name=form2 method=post action=book_control.jsp>
<input type=hidden name="action" value="insert">

<table border="1">
  <tr>
    <th>책 번 호</th>	
    <td><input type="text" name="isbn" maxlength="11"></td>
  </tr>
  <tr>
    <th>책 이 름</th>
    <td><input type="text" name="title" maxlength="15"></td>
  </tr>
  <tr>
    <th>저 자</th>
    <td><input type="text" name="author"></td>
  </tr>
  <tr>
    <th>출 판 사</th>
    <td><input type="text" name="pub" maxlength="20"></td>
  </tr>
  <tr>
    <th>가 격</th>
    <td><input type="text" name="price"></td>
  </tr>  
  <tr>
    <th>출 판 일</th>
    <td><input type="text" name="ddate" maxlength="15"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</div>
</body>
</html>