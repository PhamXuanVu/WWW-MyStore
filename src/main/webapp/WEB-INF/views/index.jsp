<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	<%@ page contentType="text/html;charset=UTF-8" language="java"%>
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	<div class="row">
		<c:forEach items="${sanPham}" var="sp">
			<div class="card" style="width: 200px; margin-left: 50px; margin-top: 50px; text-align: center;">
				<c:url var="image" value="${sp.hinhAnh}" />
				<img class="rounded" style="heigth: 250px"
					src="${image}" alt="Card image cap">
				<div class="card-body">
					<p class="card-text" style="font-weight: 700;">${sp.tenSanPham}</p>
					<p class="card-text">${sp.getGiaFormat()}</p>
					<div class="button_actions clearfix">

						<button id="btnSubmit"
							class="btn btn_base btn_add_cart btn-cart add_to_cart"
							style="background-color: red">
							<span class="text_1">Xem chi tiết</span>
						</button>

					</div>
				</div>
			</div>

		</c:forEach>
	</div>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>