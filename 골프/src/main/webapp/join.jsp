<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DB.DBconnect"%>
<% 
	Connection conn = DBconnect.getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if(!document.data.resist_month.value) {
			alert("수강월을 입력하세요.");
			data.resist_month.focus();
			return false;
		}else if(!document.data.c_name.value) {
			alert("회원명을 선택하세요.");
			data.c_name.focus();
			return false;
		}else if(!document.data.class_area.value) {
			alert("강의장소를 입력하세요.");
			data.class_area.focus();
			return false;
		}else if(!document.data.class_name.value) {
			alert("강의명을 선택하세요.");
			data.class_name.focus();
			return false;
		}
		return true;

	}
	
	function func_change1() {
		document.data.c_no.value = document.data.c_name.value;
		document.data.tuition.value = "";
		document.data.teacher_code[0].selected = true;
	}
	
	function func_change2() {
		var money = document.data.teacher_code.value * 1000;
		
		if(parseInt(document.data.c_no.value) >= 20000) money *= 0.5;
		
		document.data.tuition.value = money;
	}
</script>
</head>
<body>

	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<section class="section">
		<form name="data" method="post" action="join_p.jsp"
			onsubmit="return check()">
			<h2>수강신청</h2>
			<table class="table">
				<tr>
					<th>수강월</th>
					<td><input type="text" name="resist_month">2022년03월</td>
				</tr>
				<tr>
					<th>회원명</th>

					<td><select name="c_name" onchange="func_change1()">
							<option value="">회원명</option>
							<option value="10001">홍길동</option>
							<option value="10002">장발장</option>
							<option value="10003">임꺽정</option>
							<option value="20001">성춘향</option>
							<option value="20002">이몽룡</option>
					</select></td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="c_no" value=""></td>
				</tr>
				<tr>
					<th>강의장소</th>
					<td><input type="text" name="class_area"></td>
				</tr>
				<tr>
					<th>강의명</th>
					<td><select name="teacher_code" onchange="func_change2()">
							<option value="">강의신청</option>
							<option value="100">초급반</option>
							<option value="200">중급반</option>
							<option value="300">고급반</option>
							<option value="400">심화반</option>
					</select></td>
				</tr>
				<tr>
					<th>수강료</th>
					<td><input type="text" name="tuition">원</td>
				</tr>
				<tr>
					<th colspan="3"><input type="submit" value="수강신청"> <input
						type="button" value="다시쓰기"> <input type="button"
						value="강사조회"></th>
				</tr>
			</table>
		</form>

	</section>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>