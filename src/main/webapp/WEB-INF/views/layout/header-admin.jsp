<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<style>
body {
	font-family: sans-serif;
}
</style>
</head>
<body>
	<nav style="background-color: #929fba" class="navbar navbar-expand-sm">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown"><a style="color: white"
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:out value="${nguoiDung.getHoTenDem() }" /> <c:out
									value="${nguoiDung.getTen() }" />
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/perform_logout">Đăng
										xuất</a></li>
							</ul></li>
		</ul>
	</nav>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
    </script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
    </script>
</body>
</html>