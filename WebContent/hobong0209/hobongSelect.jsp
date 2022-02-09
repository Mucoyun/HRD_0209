<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 24 -</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% DecimalFormat de = new DecimalFormat("###,###,###"); %>
	<section>
		<h2>호봉 정보 조회</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">등급</th>
				<th width="200">급여</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				int no = 0;
				String sql = "select * from hobong0209 order by dunggub";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String dunggub = rs.getString(1);
					int salary = rs.getInt(2);
					%>
					<tr>
						<td><%=no %></td>
						<td><%=dunggub %>급</td>
						<td align="right"><%=de.format(salary) %></td>
						<td>
							<a href="/HRD_0209/hobong0209/hobong0209_update.jsp?send_dunggub=<%=dunggub%>">수정</a>
							<span>/</span>
							<a href="/HRD_0209/hobong0209/hobong0209_delete.jsp?send_dunggub=<%=dunggub%>"
							onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false;}">삭제</a>
						</td>
					</tr>
					<%
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>