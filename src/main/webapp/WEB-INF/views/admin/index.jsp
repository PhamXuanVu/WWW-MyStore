<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>

<style type="text/css">
body {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header-admin.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>
			<div class="col-8">
				
			</div>
		</div>
			<div class="col-12">
				<jsp:include page="../layout/footer-admin.jsp" />
			</div>
		</div>
</body>
</html>