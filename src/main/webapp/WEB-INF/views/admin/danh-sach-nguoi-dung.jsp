<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
</head>
<body>
	<c:url var="addSP" value="/danhmuc/form-add-san-pham" />
	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header-admin.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>

			<div class="col-10">
				<c:choose>
					<c:when test="${param.addSuccess}">
						<p style="color: red;" class="error">Thêm người dùng thành công!</p>
					</c:when>
					<c:when test="${param.updateSuccess}">
						<p style="color: red;" class="error">Cập nhật người dùng thành công!</p>
					</c:when>
					<c:when test="${param.deleteSuccess}">
						<p style="color: red;" class="error">Xóa người dùng thành công!</p>
					</c:when>
				</c:choose>
				<button type="button" class="btn btn-primary">
					<a style="text-decoration: none" class="link-light"
						href="${pageContext.request.contextPath}/user/form-add-nguoi-dung">Thêm
						người dùng</a>
				</button>
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Họ tên đệm</th>
							<th scope="col">Tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nguoiDungAdmin}" var="nguoiDung">
							<tr>
								<th>${nguoiDung.id}</th>
								<td>${nguoiDung.hoTenDem}</td>
								<td>${nguoiDung.ten}</td>
								<td>${nguoiDung.soDienThoai}</td>
								<td>${nguoiDung.diaChi}</td>
								<td>
									<div class="col">
										<button type="button" class="btn btn-outline-warning">
											<a style="text-decoration: none" class="link-warning"
												href="${pageContext.request.contextPath}/user/form-update-nguoi-dung/${nguoiDung.id}">Sửa</a>
										</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-outline-danger">
											<a style="text-decoration: none" class="link-danger"
												href="${pageContext.request.contextPath }/user/deleteNguoiDung/${nguoiDung.id}"
												onclick="return confirm('Bạn có muốn xóa?')">Xóa</a>
										</button>
									</div>
								</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="../layout/footer-admin.jsp"></jsp:include>
	</div>
</body>
</html>