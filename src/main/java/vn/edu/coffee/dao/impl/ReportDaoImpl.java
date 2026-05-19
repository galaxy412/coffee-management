package vn.edu.coffee.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import vn.edu.coffee.dao.ReportDao;
import vn.edu.coffee.dto.DailyRevenueDto;
import vn.edu.coffee.dto.TopDrinkDto;

import java.util.List;

/**
 * ReportDaoImpl: thực thi các query SQL thống kê bằng JdbcTemplate.
 *
 * @Repository: báo Spring đây là bean tầng DAO
 */
@Repository
public class ReportDaoImpl implements ReportDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // ===== Doanh thu theo ngày =====
    // GROUP BY order_date, SUM(total_amount) để tính tổng doanh thu mỗi ngày
    @Override
    public List<DailyRevenueDto> getDailyRevenue() {
        String sql = "SELECT DATE(order_date) AS report_date, "
                   + "       SUM(total_amount) AS daily_revenue "
                   + "FROM orders "
                   + "GROUP BY DATE(order_date) "
                   + "ORDER BY report_date DESC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            DailyRevenueDto dto = new DailyRevenueDto();
            dto.setReportDate(rs.getDate("report_date"));
            dto.setDailyRevenue(rs.getDouble("daily_revenue"));
            return dto;
        });
    }

    // ===== Top 5 món bán chạy nhất =====
    // JOIN drinks + order_items, GROUP BY drink_id, SUM(quantity), LIMIT 5
    @Override
    public List<TopDrinkDto> getTop5BestSellers() {
        String sql = "SELECT d.name AS drink_name, "
                   + "       SUM(oi.quantity) AS total_sold "
                   + "FROM order_items oi "
                   + "JOIN drinks d ON oi.drink_id = d.id "
                   + "GROUP BY oi.drink_id, d.name "
                   + "ORDER BY total_sold DESC "
                   + "LIMIT 5";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            TopDrinkDto dto = new TopDrinkDto();
            dto.setDrinkName(rs.getString("drink_name"));
            dto.setTotalSold(rs.getInt("total_sold"));
            return dto;
        });
    }
}
