<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link <%@ page contentType="text/html;charset=UTF-8" language="java"%>
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<jsp:include page="layout/header.jsp" />
		<section>
			<div class="row" >
				<div class="col-lg-12">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img style="width: 100%; height: 250px;" class="d-block w-100" src="/MyStore/images/banner-1.png"
									alt="First slide">
							</div>
							<div  class="carousel-item">
								<img style="width: 100%; height: 250px;" class="d-block w-100" src="/MyStore/images/banner-2.jpg"
									alt="Second slide">
							</div>
							<div  class="carousel-item">
								<img style="width: 100%; height: 250px;" class="d-block w-100" src="/MyStore/images/banner-3.jpg"
									alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							
						</a>
					</div>
				</div>
			</div>
		</section>
		<div class="row">
		<h1 style="text-align: center">Tất cả sản phẩm</h1>
			<c:forEach items="${sanPham}" var="sp">
				<div class="card"
					style="width: 200px; margin-left: 50px; margin-top: 50px; text-align: center;">
					<c:url var="image" value="${sp.hinhAnh}" />
					<img class="rounded" style="heigth: 250px" src="${image}"
						alt="Card image cap">
					<div class="card-body">
						<p class="card-text" style="font-weight: 700;">${sp.tenSanPham}</p>
						<p class="card-text">${sp.getGiaFormat()}</p>
						<div class="button_actions clearfix">

							<button id="btnSubmit"
								class="btn btn_base btn_add_cart btn-cart add_to_cart"
								style="background-color: red">
								<span class="text_1"><a style="text-decoration: none"
									class="link-warning"
									href="${pageContext.request.contextPath }/chiTietSP/${sp.id }">Xem
										chi tiết</a></span>
							</button>

						</div>
					</div>
				</div>

			</c:forEach>
		</div>
		<jsp:include page="layout/footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>