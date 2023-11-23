<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBconnect" %>
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select substr(tc.resist_month,1, 4) || '년' || substr(tc.resist_month, 5, 2) || '월 ' as resist_month, "
			+ " tm.c_no, tm.c_name, tt.class_name, tc.class_area,TO_CHAR(tc.tuition, 'fm999,999,999,999') as tuition, tm.grade "
			+ " from tbl_member_202201 tm, tbl_class_202201 tc, tbl_teacher_202201 tt "
			+ " where tm.c_no = tc.c_no and tt.teacher_code = tc.teacher_code ";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<section class="section">
		<h2>회원정보조회</h2>
		<table class="table1">
		<tr>
			<th>수강월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		
		<%while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("resist_month") %></td>
				<td><%=rs.getString("c_no") %></td>
				<td><%=rs.getString("c_name") %></td>
				<td><%=rs.getString("class_name") %></td>
				<td><%=rs.getString("class_area") %></td>
				<td>\ <%=rs.getString("tuition") %></td>
				<td><%=rs.getString("grade") %></td>
			</tr>
		<%} %>
	</table>
	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>