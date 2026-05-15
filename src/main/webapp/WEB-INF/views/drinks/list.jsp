<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title><c:out value="${pageTitle != null ? pageTitle : 'Drinks'}"/></title>
    <style>
        body { font-family: Arial, Helvetica, sans-serif; margin: 24px; }
        .toolbar { margin-bottom: 16px; display: flex; gap: 12px; align-items: center; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 10px; }
        th { background: #f6f6f6; text-align: left; }
        .actions a { margin-right: 10px; }
        .badge { padding: 2px 8px; border-radius: 999px; font-size: 12px; display: inline-block; }
        .badge.ok { background: #e7f7ee; color: #146c2e; border: 1px solid #bfe7cd; }
        .badge.no { background: #fdecec; color: #8a1f11; border: 1px solid #f5c2c7; }
        .muted { color: #666; }
    </style>
</head>
<body>

<h2><c:out value="${pageTitle != null ? pageTitle : 'Danh sách món uống'}"/></h2>

<div class="toolbar">
    <a href="<c:url value='/drinks/new' />">+ Thêm món</a>
    <span class="muted">Tổng: <c:out value="${drinks != null ? drinks.size() : 0}"/></span>
</div>

<c:choose>
    <c:when test="${drinks == null || drinks.isEmpty()}">
        <p>Chưa có món nào.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Loại</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="d" items="${drinks}">
                <tr>
                    <td><c:out value="${d.id}"/></td>
                    <td><c:out value="${d.name}"/></td>
                    <td>
                        <fmt:formatNumber value="${d.price}" type="number" minFractionDigits="0" maxFractionDigits="2"/>
                    </td>
                    <td><c:out value="${d.category}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${d.available}"><span class="badge ok">Còn bán</span></c:when>
                            <c:otherwise><span class="badge no">Ngừng bán</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <a href="<c:url value='/drinks/edit/${d.id}' />">Sửa</a>
                        <a href="<c:url value='/drinks/delete/${d.id}' />"
                           onclick="return confirm('Xóa món: ${d.name}?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>

