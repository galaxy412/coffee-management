<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${pageTitle != null ? pageTitle : 'Drink form'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar-brand { font-weight: 700; color: #0d6efd; }
        .card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); max-width: 600px; margin: 0 auto; }
        .form-label { font-weight: 600; color: #495057; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom mb-4">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/' />">☕ Coffee POS</a>
        <div class="navbar-nav ms-auto flex-row gap-3">
            <a class="nav-link active fw-bold text-primary" href="<c:url value='/drinks' />"><i class="fa-solid fa-mug-hot me-1"></i> Quản lý món</a>
            <a class="nav-link" href="<c:url value='/order' />"><i class="fa-solid fa-cart-shopping me-1"></i> Gọi món</a>
            <a class="nav-link" href="<c:url value='/reports' />"><i class="fa-solid fa-chart-bar me-1"></i> Báo cáo</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card p-4 p-md-5">
        <h3 class="fw-bold text-secondary mb-4 text-center">
            <i class="fa-solid fa-pen-to-square text-primary me-2"></i><c:out value="${pageTitle != null ? pageTitle : 'Thông tin món uống'}"/>
        </h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fa-solid fa-triangle-exclamation me-2"></i>
                <div><c:out value="${error}"/></div>
            </div>
        </c:if>

        <c:set var="postUrl" value="/drinks/${action != null ? action : 'save'}"/>

        <form method="post" action="<c:url value='${postUrl}'/>">
            <c:if test="${drink != null && drink.id != null}">
                <input type="hidden" name="id" value="${drink.id}"/>
            </c:if>

            <div class="mb-3">
                <label for="name" class="form-label">Tên món uống</label>
                <input id="name" name="name" type="text" class="form-control" value="${drink != null ? drink.name : ''}" placeholder="Nhập tên món ví dụ: Cà phê sữa đá" required />
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Đơn giá</label>
                <div class="input-group">
                    <input id="price" name="price" type="number" step="0.01" min="0" class="form-control" value="${drink != null ? drink.price : 0}" placeholder="25000" required />
                    <span class="input-group-text">VNĐ</span>
                </div>
                <div class="form-text text-muted">Hỗ trợ số nguyên (25000) hoặc số thập phân (25.5).</div>
            </div>

            <div class="mb-3">
                <label for="category" class="form-label">Loại / Danh mục</label>
                <input id="category" name="category" type="text" class="form-control" value="${drink != null ? drink.category : ''}" placeholder="Cà phê, Trà trái cây, Sinh tố..." />
            </div>

            <div class="mb-4 p-3 bg-light rounded border">
                <div class="form-check form-switch m-0">
                    <input class="form-check-input" type="checkbox" id="available" name="available" value="true" <c:if test="${drink != null && drink.available}">checked</c:if> />
                    <label class="form-check-label fw-semibold" for="available">Kích hoạt mở bán món này</label>
                </div>
                <small class="text-muted d-block mt-1 ms-4">Tắt tuỳ chọn này nếu quán tạm hết nguyên liệu hoặc ngừng bán món.</small>
            </div>

            <div class="d-flex gap-3 justify-content-end">
                <a href="<c:url value='/drinks' />" class="btn btn-light border text-secondary px-4">Hủy bỏ</a>
                <button type="submit" class="btn btn-primary px-4 fw-semibold shadow-sm">Lưu lại</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>