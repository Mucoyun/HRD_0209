<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 24 -</title>
	<script>
		function cantry() {
			if(document.iu_form.salary.value==""){
				alert("급여가 입력되지 않았습니다.");
				document.iu_form.salary.focus();
			}else{
				document.iu_form.submit();
			}
			
		}
		function retry() {
			location.href = "/HRD_0209/index.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_dunggub = request.getParameter("send_dunggub");
		String dunggub = "";
		String salary = "";
		
		try{
			String sql = "select * from hobong0209 where dunggub=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dunggub);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dunggub = rs.getString(1);
				salary = rs.getString(2);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>인사관리 호봉변경 화면</h2>
		<form name="iu_form" method="post" action="hobong0209_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>직급</th>
					<td><input type="text" name="dunggub" value="<%=dunggub%>" readonly></td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="text" name="salary" value="<%=salary%>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="cantry()">변경</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>