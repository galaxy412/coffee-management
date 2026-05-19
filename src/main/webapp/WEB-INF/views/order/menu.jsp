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
        .table th { background-color: #f1f3f5; color: #495057; font-weight: 600; }
        .qty-input { max-width: 90px; text-align: center; border-radius: 6px; }
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

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-secondary m-0"><i class="fa-solid fa-list-check text-primary me-2"></i>${pageTitle}</h3>
    </div>

    <div class="card p-4">
        <form action="${pageContext.request.contextPath}/order/checkout" method="POST">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th scope="col">Tên Món</th>
                        <th scope="col">Danh Mục</th>
                        <th scope="col" class="text-end">Đơn Giá (VNĐ)</th>
                        <th scope="col" class="text-center" style="width: 150px;">Số Lượng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty drinks}">
                            <tr>
                                <td colspan="4" class="text-center py-4 text-muted">
                                    <i class="fa-solid fa-folder-open fs-3 d-block mb-2"></i> Hiện tại quán chưa có món nào!
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="drink" items="${drinks}">
                                <tr>
                                    <td><span class="fw-semibold text-dark">${drink.name}</span></td>
                                    <td><span class="badge bg-light text-secondary border">${drink.category}</span></td>
                                    <td class="text-end fw-bold text-secondary">
                                        <fmt:formatNumber value="${drink.price}" type="number" minFractionDigits="0"/>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-center">
                                            <input type="number" name="qty_${drink.id}" value="0" min="0" class="form-control form-control-sm qty-input">
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

            <div class="d-flex align-items-center justify-content-between mt-4 border-top pt-3">
                <a href="${pageContext.request.contextPath}/" class="btn btn-light border text-secondary">
                    <i class="fa-solid fa-arrow-left me-1"></i> Về trang chủ
                </a>
                <button type="submit" class="btn btn-primary px-4 py-2 fw-semibold shadow-sm">
                    <i class="fa-solid fa-receipt me-2"></i>Tính Tiền
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>