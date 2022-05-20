<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
</head>
<body>
	<c:url var="addSocola" value="/danhmuc/form-add-socola" />
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
				<c:choose>
					<c:when test="${param.addSuccess}">
						<p style="color: red;" class="error">Thêm sản phẩm thành công!</p>
					</c:when>
					<c:when test="${param.updateSuccess}">
						<p style="color: red;" class="error">Cập nhật sản phẩm thành
							công!</p>
					</c:when>
					<c:when test="${param.deleteSuccess}">
						<p style="color: red;" class="error">Xóa sản phẩm thành công!</p>
					</c:when>
				</c:choose>
				<button type="button" class="btn btn-primary">
					<a style="text-decoration: none" class="link-light"
						href="${addSocola}">Thêm sản phẩm</a>
				</button>
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Đơn giá</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Mô tả</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${socola}" var="sp">
							<tr>
								<th>${sp.getId()}</th>
								<c:url var="image" value="${sp.hinhAnh}" />
								<td><img width="60px" height="60px" src="${image}"
									alt="Card image cap"></td>
								<td>${sp.tenSanPham}</td>
								<td>${sp.getGiaFormat()}</td>
								<td>${sp.soLuong}</td>
								<td>${sp.moTa}</td>
								<td>
									<div class="col">
										<button type="button" class="btn btn-outline-warning">
											<a style="text-decoration: none" class="link-warning"
												href="${pageContext.request.contextPath }/danhmuc/update/${sp.id }">Sửa</a>
										</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-outline-danger">
											<a style="text-decoration: none" class="link-danger"
												href="${pageContext.request.contextPath }/danhmuc/deleteSocola/${sp.id }"
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