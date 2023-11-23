# 골프연습장 회원관리 
## 홈 화면
![image](https://github.com/hwan06/golfUserManageSite/assets/114748934/5c82b7e8-fff5-48e5-bb76-d5e68ee90406)

## 강사조회 화면
![image](https://github.com/hwan06/golfUserManageSite/assets/114748934/cc89c7ad-de10-4674-8e3c-64f61a4081f3)
### DB 코드
```sql
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
```
## 수강신청 화면
![image](https://github.com/hwan06/golfUserManageSite/assets/114748934/c3171691-bbbf-4275-8ea4-ace6b32d7606)
### 회원명을 선택하면 그 회원의 회원번호를 자동으로 삽입해주는 함수와 회원번호가 20000대라면 50%할인을 적용해주는 함수 생성
```sql
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
```

## 회원정보조회 화면
![image](https://github.com/hwan06/golfUserManageSite/assets/114748934/f7f4db51-f31a-44c2-85a2-3c52147e63be)
### DB 코드
```
<%
	Connection conn = DBconnect.getConnection();
	String sql = "select substr(tc.resist_month,1, 4) || '년' || substr(tc.resist_month, 5, 2) || '월 ' as resist_month, "
			+ " tm.c_no, tm.c_name, tt.class_name, tc.class_area,TO_CHAR(tc.tuition, 'fm999,999,999,999') as tuition, tm.grade "
			+ " from tbl_member_202201 tm, tbl_class_202201 tc, tbl_teacher_202201 tt "
			+ " where tm.c_no = tc.c_no and tt.teacher_code = tc.teacher_code ";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
%>
```

## 강사매출현황 화면
![image](https://github.com/hwan06/golfUserManageSite/assets/114748934/21668bad-c9a0-4107-8823-62dacb464f00)
### 그룹바이를 이용하여 각 강사의 매출 조회
```sql
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
```
