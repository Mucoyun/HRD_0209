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
	<section>
		<h2>인사관리 호봉등록 화면</h2>
		<form name="iu_form" method="post" action="hobong0209_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>직급</th>
					<td>
						<select name="dunggub">
							<option value="1" selected>1급</option>
							<option value="2">2급</option>
							<option value="3">3급</option>
							<option value="4">4급</option>
							<option value="5">5급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>급여</th>
					<td><input type="text" name="salary"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="cantry()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>