<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Coffee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .main-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            background: #ffffff;
            max-width: 600px;
            width: 100%;
            overflow: hidden;
        }
        .welcome-header {
            background-color: #0d6efd;
            padding: 35px 20px;
            color: white;
            text-align: center;
        }
        .nav-block {
            display: flex;
            flex-direction: column;
            gap: 12px;
            padding: 30px;
        }
        .menu-btn {
            display: flex;
            align-items: center;
            padding: 16px 20px;
            border: 1px solid #dee2e6;
            border-radius: 12px;
            text-decoration: none;
            color: #495057;
            font-weight: 600;
            transition: all 0.2s ease-in-out;
        }
        .menu-btn:hover {
            background-color: #f8f9fa;
            border-color: #0d6efd;
            color: #0d6efd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(13,110,253,0.1);
        }
        .menu-btn i {
            font-size: 1.25rem;
            width: 35px;
            color: #6c757d;
            transition: color 0.2s;
        }
        .menu-btn:hover i {
            color: #0d6efd;
        }
    </style>
</head>
<body>

<div class="container p-3 d-flex justify-content-center">
    <div class="main-card">
        <div class="welcome-header">
            <h2 class="m-0 fw-bold"><i class="fa-solid fa-mug-hot me-2"></i>Coffee Management</h2>
            <p class="m-0 opacity-75 mt-2 small">Hệ thống điều hành và quản lý quầy Bar chuyên nghiệp</p>
        </div>

        <div class="nav-block">
            <div class="text-muted small mb-2 text-uppercase fw-bold tracking-wider">Vui lòng chọn chức năng:</div>

            <a href="<c:url value='/drinks' />" class="menu-btn">
                <i class="fa-solid fa-bars-progress"></i>
                <div>
                    <div>Quản lý món uống</div>
                    <small class="text-muted fw-normal d-block">Thêm, sửa, xóa cấu hình danh sách menu</small>
                </div>
                <i class="fa-solid fa-chevron-right ms-auto fs-6 opacity-50"></i>
            </a>

            <a href="<c:url value='/order' />" class="menu-btn">
                <i class="fa-solid fa-basket-shopping"></i>
                <div>
                    <div>Gọi món &amp; Bán hàng</div>
                    <small class="text-muted fw-normal d-block">Giao diện gọi món nhanh và xuất hóa đơn</small>
                </div>
                <i class="fa-solid fa-chevron-right ms-auto fs-6 opacity-50"></i>
            </a>

            <a href="<c:url value='/reports' />" class="menu-btn">
                <i class="fa-solid fa-chart-pie"></i>
                <div>
                    <div>Báo cáo doanh thu</div>
                    <small class="text-muted fw-normal d-block">Thống kê dữ liệu kinh doanh tổng hợp</small>
                </div>
                <i class="fa-solid fa-chevron-right ms-auto fs-6 opacity-50"></i>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>