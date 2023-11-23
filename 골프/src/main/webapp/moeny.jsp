<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBconnect" %>
<%
	Connection conn = DBconnect.getConnection();
	String sql = "select tt.teacher_code, tt.class_name, tt.teacher_name, TO_CHAR(sum(tc.tuition), 'fm999,999,999,999') as tuition"
			+ " from tbl_teacher_202201 tt, tbl_class_202201 tc "
			+ " where tt.teacher_code = tc.teacher_code "
			+ " group by tt.teacher_code, tt.class_name, tt.teacher_name "
			+ " order by teacher_code";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
%>
<!DOCTYPE html>
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
		<h2>강사매출현황</h2>
		<table class="table1">
		<tr>
			<th>강사코드</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>총매출</th>
		</tr>
		<%while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("teacher_code") %></td>
				<td><%=rs.getString("class_name") %></td>
				<td style="text-align: right"><%=rs.getString("teacher_name") %></td>
				<td style="text-align: right">\ <%=rs.getString("tuition") %></td>
			</tr>
		<%} %>
	</table>
	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>