<%@page import="DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%
	Connection conn = DBconnect.getConnection();
	String sql = "select teacher_code, teacher_name, class_name, '₩ '||  TO_CHAR(tuition, 'fm999,999,999,999') as class_price,"
			+ " substr(teach_resist_date, 1, 4) || '년 ' || "
			+ " substr(teach_resist_date, 5, 2) || '월 ' || "
			+ " substr(teach_resist_date, 7, 2) || '일' as teach_resist_date "
			+ " from tbl_teacher_202201";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<section class="section">
		<h2>강사조회</h2>
		
			<table class="table1">
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<%while(rs.next()) { %>
				<tr>
					<td><%=rs.getString("teacher_code") %></td>
					<td><%=rs.getString("teacher_name") %></td>
					<td><%=rs.getString("class_name") %></td>
					<td><%=rs.getString("class_price") %></td>
					<td><%=rs.getString("teach_resist_date") %></td>
				</tr>
			<%} %>
		</table>
		
	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>