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
		<h2>수당 정보 조회</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">사원번호</th>
				<th width="100">이름</th>
				<th width="100">가족수당</th>
				<th width="100">직책수당</th>
				<th width="100">근속수당</th>
				<th width="100">기타수당</th>
				<th width="100">수당합계</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				int no = 0;
				String sql = "select a.id,b.name,a.gajok,a.jikchak,a.gunsok,a.gitasudang,(a.gajok+a.jikchak+a.gunsok+a.gitasudang) from sudang0209 a,info0209 b where a.id=b.id";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String id = rs.getString(1);
					String name = rs.getString(2);
					int gajok = rs.getInt(3);
					int jikchak = rs.getInt(4);
					int gunsok = rs.getInt(5);
					int gitasudang = rs.getInt(6);
					int sum = rs.getInt(7);			
					%>
					<tr>
						<td><%=no %></td>
						<td><%=id %></td>
						<td><%=name %></td>
						<td class="r"><%=de.format(gajok) %></td>
						<td class="r"><%=de.format(jikchak) %></td>
						<td class="r"><%=de.format(gunsok) %></td>
						<td class="r"><%=de.format(gitasudang) %></td>
						<td class="r"><%=de.format(sum) %></td>
						<td>
							<a href="/HRD_0209/sudang0209/sudang0209_update.jsp?send_id=<%=id%>">수정</a>
							<span>/</span>
							<a href="/HRD_0209/sudang0209/sudang0209_delete.jsp?send_id=<%=id%>"
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