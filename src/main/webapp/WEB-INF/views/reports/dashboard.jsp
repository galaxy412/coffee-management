<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo cáo thống kê - Coffee Management</title>
    <style>
        /* ===== Reset & Base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            padding: 30px;
        }

        /* ===== Header ===== */
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 28px;
        }

        /* ===== Card Container ===== */
        .card-container {
            display: flex;
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
            flex-wrap: wrap;
        }

        /* ===== Card ===== */
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 25px;
            flex: 1;
            min-width: 400px;
        }

        .card h2 {
            color: #34495e;
            margin-bottom: 15px;
            font-size: 20px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }

        /* ===== Table ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        thead {
            background-color: #3498db;
            color: #ffffff;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f7fb;
        }

        tbody tr:hover {
            background-color: #e8f0fe;
            transition: background-color 0.2s ease;
        }

        td {
            font-size: 14px;
            color: #555;
        }

        /* ===== Rank badge cho Top 5 ===== */
        .rank {
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            border-radius: 50%;
            background-color: #3498db;
            color: #fff;
            font-weight: bold;
            font-size: 13px;
        }

        .rank-1 { background-color: #f1c40f; color: #333; }
        .rank-2 { background-color: #95a5a6; color: #fff; }
        .rank-3 { background-color: #cd7f32; color: #fff; }

        /* ===== Empty message ===== */
        .empty-msg {
            text-align: center;
            color: #999;
            padding: 20px;
            font-style: italic;
        }

        /* ===== Back link ===== */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-size: 15px;
        }

        .back-link a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
            color: #2980b9;
        }

        /* ===== Responsive ===== */
        @media (max-width: 900px) {
            .card-container {
                flex-direction: column;
            }
            .card {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>

    <h1>📊 Báo cáo thống kê</h1>

    <div class="card-container">

        <%-- ===== CARD 1: Doanh thu theo ngày ===== --%>
        <div class="card">
            <h2>💰 Doanh thu theo ngày</h2>
            <c:choose>
                <c:when test="${not empty revenueList}">
                    <table>
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Ngày</th>
                                <th>Doanh thu (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rev" items="${revenueList}" varStatus="stt">
                                <tr>
                                    <td>${stt.index + 1}</td>
                                    <td>
                                        <fmt:formatDate value="${rev.reportDate}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${rev.dailyRevenue}"
                                                          type="number"
                                                          groupingUsed="true"
                                                          maxFractionDigits="0"/> ₫
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="empty-msg">Chưa có dữ liệu doanh thu.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- ===== CARD 2: Top 5 món bán chạy ===== --%>
        <div class="card">
            <h2>🏆 Top 5 món bán chạy nhất</h2>
            <c:choose>
                <c:when test="${not empty topDrinks}">
                    <table>
                        <thead>
                            <tr>
                                <th>Hạng</th>
                                <th>Tên món</th>
                                <th>Số lượng đã bán</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="drink" items="${topDrinks}" varStatus="stt">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${stt.index + 1 <= 3}">
                                                <span class="rank rank-${stt.index + 1}">
                                                    ${stt.index + 1}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="rank">${stt.index + 1}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${drink.drinkName}</td>
                                    <td>
                                        <fmt:formatNumber value="${drink.totalSold}"
                                                          type="number"
                                                          groupingUsed="true"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="empty-msg">Chưa có dữ liệu bán hàng.</p>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

    <div class="back-link">
        <a href="${pageContext.request.contextPath}/">← Quay lại trang chủ</a>
    </div>

</body>
</html>
