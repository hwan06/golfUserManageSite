<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBconnect" %>
<%

	request.setCharacterEncoding("UTF-8");
	Connection conn = DBconnect.getConnection();
	String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("resist_month"));
	ps.setString(2, request.getParameter("c_no"));
	ps.setString(3, request.getParameter("class_area"));
	ps.setInt(4, Integer.valueOf(request.getParameter("tuition")));
	ps.setString(5, request.getParameter("teacher_code"));
	ps.executeUpdate();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>