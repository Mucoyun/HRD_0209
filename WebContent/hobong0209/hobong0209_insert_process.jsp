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
		String dunggub = request.getParameter("dunggub");
		String salary = request.getParameter("salary");
		
		try{
			String sql="insert into hobong0209 values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dunggub);
			pstmt.setString(2, salary);
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.href = "/HRD_0209/hobong0209/hobongSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>