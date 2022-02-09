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
		String send_dunggub = request.getParameter("send_dunggub");
		
		try{
			String sql="delete from hobong0209 where dunggub=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dunggub);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href = "/HRD_0209/hobong0209/hobongSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>