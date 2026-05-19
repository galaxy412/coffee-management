<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar-brand { font-weight: 700; color: #0d6efd; }
        .card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        .table th { background-color: #f1f3f5; color: #495057; }
        .total-row { font-size: 1.15rem; background-color: #fffdf6 !important; }
        @media print {
            .navbar, .actions-bar, .btn-secondary { display: none !important; }
            body { background-color: #fff; margin: 0; padding: 0; }
            .card { box-shadow: none; padding: 0 !important; }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-white bg-white border-bottom mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">☕ Coffee POS</a>
        <div class="navbar-nav ms-auto flex-row gap-3">
            <a class="nav-link" href="${pageContext.request.contextPath}/drinks"><i class="fa-solid fa-mug-hot me-1"></i> Quản lý món</a>
            <a class="nav-link active fw-bold text-primary" href="${pageContext.request.contextPath}/order"><i class="fa-solid fa-cart-shopping me-1"></i> Gọi món</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/reports"><i class="fa-solid fa-chart-bar me-1"></i> Báo cáo</a>
        </div>
    </div>
</nav>

<div class="container" style="max-width: 850px;">
    <div class="card p-4 p-md-5">
        <div class="text-center mb-4">
            <h2 class="fw-bold m-0 text-dark">🧾 HÓA ĐƠN THANH TOÁN</h2>
            <p class="text-muted small mt-1">Hệ thống quản lý gọi món Coffee POS</p>
        </div>

        <c:choose>
            <c:when test="${empty orderItems}">
                <div class="alert alert-danger text-center p-4 my-3" role="alert">
                    <i class="fa-solid fa-triangle-exclamation fs-3 mb-2 d-block"></i>
                    Bạn chưa chọn món nào trong thực đơn!
                </div>
                <div class="text-center actions-bar mt-4">
                    <a href="${pageContext.request.contextPath}/order" class="btn btn-secondary px-4">
                        <i class="fa-solid fa-arrow-left me-2"></i>Quay Lại Menu
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <thead>
                        <tr class="text-center">
                            <th style="width: 60px;">STT</th>
                            <th class="text-start">Tên Món</th>
                            <th style="width: 100px;">Số Lượng</th>
                            <th class="text-end" style="width: 140px;">Đơn Giá</th>
                            <th class="text-end" style="width: 165px;">Thành Tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${orderItems}" varStatus="status">
                            <tr class="text-center">
                                <td>${status.index + 1}</td>
                                <td class="text-start fw-semibold">${item.drink.name}</td>
                                <td>${item.quantity}</td>
                                <td class="text-end text-secondary">
                                    <fmt:formatNumber value="${item.drink.price}" type="number" minFractionDigits="0"/>
                                </td>
                                <td class="text-end fw-semibold text-dark">
                                    <fmt:formatNumber value="${item.subTotal}" type="number" minFractionDigits="0"/>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="total-row fw-bold text-dark">
                            <td colspan="4" class="text-end text-danger fs-5 py-3">Tổng Cộng:</td>
                            <td class="text-end text-danger fs-5 py-3">
                                <fmt:formatNumber value="${totalAmount}" type="number" minFractionDigits="0"/> VNĐ
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4 actions-bar border-top pt-3">
                    <div>
                        <a href="${pageContext.request.contextPath}/order" class="btn btn-outline-secondary px-3 me-2">
                            <i class="fa-solid fa-rotate-left me-2"></i>Tạo Đơn Mới
                        </a>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-primary px-4 fw-semibold shadow-sm" onclick="alert('Thanh toán thành công!')">
                            <i class="fa-solid fa-credit-card me-2"></i>Thanh Toán
                        </button>
                        <button class="btn btn-success px-4 fw-semibold shadow-sm" onclick="window.print()">
                            <i class="fa-solid fa-print me-2"></i>In Hóa Đơn
                        </button>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>