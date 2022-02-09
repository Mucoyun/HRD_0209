<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<section>
		<h2>인사관리 사원조회 화면</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">사번</th>
				<th width="100">성명</th>
				<th width="100">직급</th>
				<th width="100">직책</th>
				<th width="200">연락처</th>
				<th width="100">소속부서</th>
				<th width="300">주소</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				int no = 0;
				String sql = "select * from info0209 order by id";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String id = rs.getString(1);
					String name = rs.getString(2);
					String dept = rs.getString(3);
					String position = rs.getString(4);
					String duty = rs.getString(5);
					String phone = rs.getString(6);
					String address = rs.getString(7);			
					%>
					<tr>
						<td><%=no %></td>
						<td><a href="/HRD_0209/info0209/info0209_update.jsp?send_id=<%=id%>"><%=id %></a></td>
						<td><%=name %></td>
						<td><%=position %></td>
						<td><%=dept %></td>
						<td><%=phone %></td>
						<td><%=duty %></td>
						<td><%=address %></td>
						<td>
							<a href="/HRD_0209/info0209/info0209_delete.jsp?send_id=<%=id%>"
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