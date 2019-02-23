<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="book_error.jsp" import="ipp.book.*"%>
<!DOCTYPE HTML> 
<html>
<head>
<link rel="stylesheet" href="book.css" type="text/css" media="screen" />

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form3.action.value="delete";
			document.form3.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서목록:수정화면</title>
</head>

<jsp:useBean id="b" scope="request" class="ipp.book.Book" />

<body>
<div align="center">
<H2>도서록:수정화면 </H2>
<HR>
[<a href=book_control.jsp?action=list> 도서록 목록으로</a>] <p>
<form name=form3 method=post action=book_control.jsp>
<input type=hidden name="action" value="update">
<input type=hidden name="isbn" value="<%=b.getIsbn()%>">


<table border="1">

<tr>
    <th>책 번 호</th>
    <td><input type="text" name="isbn1" value="<%=b.getIsbn() %>"></td>
  </tr>


  <tr>
    <th>책 이 름</th>
    <td><input type="text" name="title" value="<%=b.getTitle() %>"></td>
  </tr>
 
  <tr>
    <th>저 자</th>
    <td><input type="text" name="author" value="<%=b.getAuthor() %>"></td>
  </tr>
 
    <tr>
    <th>출 판 사</th>
    <td><input type="text" name="pub" value="<%=b.getPub() %>"></td>
  </tr>
 
      <tr>
    <th>가 격</th>
    <td><input type="text" name="price" value="<%=b.getPrice() %>"></td>
  </tr>
 
  <tr>
    <th>출 판 일</th>
    <td><input type="text" name="ddate" value="<%=b.getDdate()%>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>