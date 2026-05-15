<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title><c:out value="${pageTitle != null ? pageTitle : 'Drink form'}"/></title>
    <style>
        body { font-family: Arial, Helvetica, sans-serif; margin: 24px; }
        .row { margin-bottom: 12px; }
        label { display: inline-block; width: 120px; }
        input[type='text'], input[type='number'] { width: 320px; padding: 8px; }
        .actions { margin-top: 16px; display: flex; gap: 12px; align-items: center; }
        .hint { color: #666; font-size: 12px; }
        .error { color: #b00020; }
    </style>
</head>
<body>

<h2><c:out value="${pageTitle != null ? pageTitle : 'Form'}"/></h2>

<c:set var="postUrl" value="/drinks/${action != null ? action : 'save'}"/>

<form method="post" action="<c:url value='${postUrl}'/>">

    <c:if test="${drink != null && drink.id != null}">
        <input type="hidden" name="id" value="${drink.id}"/>
    </c:if>

    <div class="row">
        <label for="name">Tên</label>
        <input id="name" name="name" type="text" value="${drink != null ? drink.name : ''}" required />
    </div>

    <div class="row">
        <label for="price">Giá</label>
        <input id="price" name="price" type="number" step="0.01" min="0" value="${drink != null ? drink.price : 0}" required />
        <div class="hint">Ví dụ: 25000 hoặc 25.5</div>
    </div>

    <div class="row">
        <label for="category">Loại</label>
        <input id="category" name="category" type="text" value="${drink != null ? drink.category : ''}" />
    </div>

    <div class="row">
        <label for="available">Còn bán</label>
        <input id="available" name="available" type="checkbox" value="true" <c:if test="${drink != null && drink.available}">checked</c:if> />
        <div class="hint">Bỏ chọn nếu ngừng bán</div>
    </div>

    <div class="actions">
        <button type="submit">Lưu</button>
        <a href="<c:url value='/drinks' />">Quay lại danh sách</a>
    </div>

</form>

</body>
</html>

