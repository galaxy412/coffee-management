<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${pageTitle != null ? pageTitle : 'Drinks'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar-brand { font-weight: 700; color: #0d6efd; }
        .card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        .table th { background-color: #f1f3f5; color: #495057; font-weight: 600; }
        .badge-ok { background-color: #d1e7dd; color: #0f5132; }
        .badge-no { background-color: #f8d7da; color: #842029; }
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
    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-center gap-3 mb-4">
        <div>
            <h3 class="fw-bold text-secondary m-0"><i class="fa-solid fa-mug-saucer text-primary me-2"></i><c:out value="${pageTitle != null ? pageTitle : 'Danh sách món uống'}"/></h3>
            <small class="text-muted">Tổng số lượng món: <span class="fw-bold text-dark"><c:out value="${drinks != null ? drinks.size() : 0}"/></span></small>
        </div>
        <a href="<c:url value='/drinks/new' />" class="btn btn-primary px-3 shadow-sm fw-semibold">
            <i class="fa-solid fa-plus me-1"></i> Thêm món mới
        </a>
    </div>

    <div class="card p-4">
        <c:choose>
            <c:when test="${drinks == null || drinks.isEmpty()}">
                <div class="text-center py-5 text-muted">
                    <i class="fa-solid fa-box-open fs-2 d-block mb-2"></i> Chưa có món nào trong thực đơn.
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                        <tr>
                            <th style="width: 80px;">ID</th>
                            <th>Tên món uống</th>
                            <th class="text-end" style="width: 150px;">Đơn giá (VNĐ)</th>
                            <th>Loại</th>
                            <th style="width: 140px;" class="text-center">Trạng thái</th>
                            <th style="width: 150px;" class="text-center">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="d" items="${drinks}">
                            <tr>
                                <td class="text-muted fw-mono">#<c:out value="${d.id}"/></td>
                                <td><strong class="text-dark"><c:out value="${d.name}"/></strong></td>
                                <td class="text-end fw-bold text-secondary">
                                    <fmt:formatNumber value="${d.price}" type="number" minFractionDigits="0"/>
                                </td>
                                <td><span class="badge bg-light text-secondary border"><c:out value="${d.category}"/></span></td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${d.available}">
                                            <span class="badge badge-ok px-2 py-1"><i class="fa-solid fa-circle-check me-1"></i>Còn bán</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-no px-2 py-1"><i class="fa-solid fa-circle-minus me-1"></i>Ngừng bán</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <div class="btn-group btn-group-sm">
                                        <a href="<c:url value='/drinks/edit/${d.id}' />" class="btn btn-outline-primary" title="Sửa">
                                            <i class="fa-solid fa-pen"></i> Sửa
                                        </a>
                                        <a href="<c:url value='/drinks/delete/${d.id}' />"
                                           class="btn btn-outline-danger"
                                           onclick="return confirm('Xóa món: ${d.name}?');" title="Xóa">
                                            <i class="fa-solid fa-trash"></i> Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>