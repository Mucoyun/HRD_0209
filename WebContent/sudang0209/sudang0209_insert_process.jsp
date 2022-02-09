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
	<%
		String id = request.getParameter("id");
		String gajok = request.getParameter("gajok");
		String jikchak = request.getParameter("jikchak");
		String gunsok = request.getParameter("gunsok");
		String gitasudang = request.getParameter("gitasudang");
		
		try{
			String sql="insert into sudang0209 values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gajok);
			pstmt.setString(3, jikchak);
			pstmt.setString(4, gunsok);
			pstmt.setString(5, gitasudang);
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.href = "/HRD_0209/sudang0209/sudangSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>