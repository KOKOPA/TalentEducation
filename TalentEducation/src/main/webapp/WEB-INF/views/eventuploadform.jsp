<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

 function viewClose(){
	 opener.location.reload();		//오프너 새로고침
	 close();						//self.close();
 }
 
 </script>

</head>
<body>
	
	<form action="calendarInsert.do" id="insertForm" method="post">
	<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="calendar_category"></td>
			</tr>
			<tr>
				<th>시작</th>
				<td><input type="date" name="calendar_start" value="editStart"></td>
			</tr>
			<tr>
				<th>끝</th>
				<td><input type="date" name="calendar_end"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="calendar_description"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="등록" onclick="viewClose();">
					<input type="button" value="취소" onclick="viewClose();">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>