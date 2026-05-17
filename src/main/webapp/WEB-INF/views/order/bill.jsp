<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${pageTitle}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; max-width: 800px; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .total-row { font-weight: bold; font-size: 18px; color: #d9534f; background-color: #fdfaf9; }
        .actions { margin-top: 20px; }
        .btn { padding: 10px 15px; text-decoration: none; color: white; background-color: #28a745; border-radius: 4px; }
        .btn-secondary { background-color: #6c757d; }
    </style>
</head>
<body>
    <h2>🧾 ${pageTitle}</h2>

    <c:if test="${empty orderItems}">
        <p style="color: red;">Bạn chưa chọn món nào!</p>
        <div class="actions">
            <a href="${pageContext.request.contextPath}/order" class="btn btn-secondary">Quay Lại Menu</a>
        </div>
    </c:if>

    <c:if test="${not empty orderItems}">
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên Món</th>
                    <th>Số Lượng</th>
                    <th>Đơn Giá</th>
                    <th>Thành Tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${orderItems}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${item.drink.name}</td>
                        <td>${item.quantity}</td>
                        <td>${item.drink.price}</td>
                        <td>${item.subTotal}</td>
                    </tr>
                </c:forEach>
                <tr class="total-row">
                    <td colspan="4" style="text-align: right;">Tổng Cộng:</td>
                    <td>${totalAmount} VNĐ</td>
                </tr>
            </tbody>
        </table>

        <div class="actions">
            <button class="btn" onclick="window.print()">🖨 In Hóa Đơn</button>
            <a href="${pageContext.request.contextPath}/order" class="btn btn-secondary">Tạo Đơn Mới</a>
        </div>
    </c:if>
</body>
</html>