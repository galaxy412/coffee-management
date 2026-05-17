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
        .btn-submit { padding: 10px 20px; background-color: #007bff; color: white; border: none; cursor: pointer; font-size: 16px; }
        .btn-submit:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <h2>☕ ${pageTitle}</h2>
    
    <form action="${pageContext.request.contextPath}/order/checkout" method="POST">
        <table>
            <thead>
                <tr>
                    <th>Tên Món</th>
                    <th>Danh Mục</th>
                    <th>Đơn Giá (VNĐ)</th>
                    <th>Số Lượng</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty drinks}">
                        <tr><td colspan="4">Hiện tại quán chưa có món nào!</td></tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="drink" items="${drinks}">
                            <tr>
                                <td><strong>${drink.name}</strong></td>
                                <td>${drink.category}</td>
                                <td>${drink.price}</td>
                                <td>
                                    <input type="number" name="qty_${drink.id}" value="0" min="0" style="width: 80px; padding: 5px;">
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        
        <button type="submit" class="btn-submit">🧾 Tính Tiền</button>
        <a href="${pageContext.request.contextPath}/" style="margin-left: 15px;">Về trang chủ</a>
    </form>
</body>
</html>