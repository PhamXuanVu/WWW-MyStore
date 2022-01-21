<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	<c:forEach items="${sanPham}" var="sp" begin="0" end="4">
								<td><div class="col mb-5">
										<div class="card h-100">
											<!-- Product image-->
											<img class="card-img-top"
												src="/images/banner.jpg"
												alt="image" />
											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">
													<!-- Product name-->
													<h5 class="fw-bolder">
														<c:out value="${sp.tenSanPham}" />
													</h5>
													<!-- Product price-->
													<c:out value="${sp.donGia}" />
												</div>
											</div>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<c:url var="viewUrl" value="/showFormItemProduct">
														<c:param name="sanpham" value="${sp.id}" />
													</c:url>
													
													<a class="btn btn-outline-dark mt-auto" href="${viewUrl}">View
														options</a>
												</div>
											</div>
										</div>
									</div></td>
							</c:forEach>
						</tr>
</body>
</html>