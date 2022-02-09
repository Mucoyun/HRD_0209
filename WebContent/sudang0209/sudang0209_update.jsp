<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 24 -</title>
	<style>
		#iu_table td{
			width: 300px !important;
		}#iu_table input[type="text"]{
			width: 200px !important;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 200px !important;
		}
	</style>
	<script>
		function cantry() {
			if(document.iu_form.id.value==""){
				alert("사원번호가 입력되지 않았습니다.");
				document.iu_form.id.focus();
			}else{
				document.iu_form.action = "sudang0209_update_process.jsp";
				document.iu_form.submit();
			}
			
		}
		function retry() {
			location.href = "/HRD_0209/sudang0209/sudangSelect.jsp";
		}
		function idck() {
			document.iu_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		String id = request.getParameter("id");
		String name = "";	
	
		String gajok = request.getParameter("gajok");
		String jikchak = request.getParameter("jikchak");
		String gunsok = request.getParameter("gunsok");
		String gitasudang = request.getParameter("gitasudang");
		
		try{
			String sql = "select * from sudang0209 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				gajok = rs.getString(2);
				jikchak = rs.getString(3);
				gunsok = rs.getString(4);
				gitasudang = rs.getString(5);
			}
			
			sql = "select name from info0209 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				name = rs.getString(1);
			}else if(id==null){
				id="";
				gajok = "0";
				jikchak = "0";
				gunsok = "0";
				gitasudang = "0";
			}else{
				id = "";
				%><script>
					alert("등록되어 있지 않은 사원번호 입니다.");
					idck();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>수당 정보 등록</h2>
		<form name="iu_form" method="post" action="sudang0209_update.jsp">
			<table id="iu_table">
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="id" value="<%=id %>" onchange="idck()" readonly></td>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=name %>" readonly></td>
				</tr>
				<tr>
					<th>가족수당</th>
					<td><input type="number" name="gajok" value="<%=gajok%>"></td>
					<th>직책수당</th>
					<td><input type="number" name="jikchak" value="<%=jikchak%>"></td>
				</tr>
				<tr>
					<th>근속수당</th>
					<td><input type="number" name="gunsok" value="<%=gunsok%>"></td>
				</tr>
				<tr>
					<th>기타수당</th>
					<td colspan="3"><input type="number" name="gitasudang" value="<%=gitasudang%>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="4">
						<button type="button" onclick="retry()">목록</button>
						<button type="button" onclick="cantry()">변경</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>