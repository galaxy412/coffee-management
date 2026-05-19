package vn.edu.coffee.dao;

import vn.edu.coffee.dto.DailyRevenueDto;
import vn.edu.coffee.dto.TopDrinkDto;

import java.util.List;

/**
 * Interface định nghĩa các thao tác truy vấn báo cáo thống kê.
 * Tách interface + implementation theo chuẩn Spring.
 */
public interface ReportDao {

    /**
     * Lấy danh sách doanh thu theo từng ngày.
     * Query: GROUP BY order_date, SUM(total_amount)
     */
    List<DailyRevenueDto> getDailyRevenue();

    /**
     * Lấy Top 5 món bán chạy nhất.
     * Query: JOIN drinks + order_items, GROUP BY drink_id, SUM(quantity), LIMIT 5
     */
    List<TopDrinkDto> getTop5BestSellers();
}
