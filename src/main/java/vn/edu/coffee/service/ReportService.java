package vn.edu.coffee.service;

import vn.edu.coffee.dto.DailyRevenueDto;
import vn.edu.coffee.dto.TopDrinkDto;

import java.util.List;

/**
 * Interface tầng Service cho module báo cáo thống kê.
 */
public interface ReportService {

    /**
     * Lấy danh sách doanh thu theo từng ngày.
     */
    List<DailyRevenueDto> getDailyRevenue();

    /**
     * Lấy Top 5 món bán chạy nhất.
     */
    List<TopDrinkDto> getTop5BestSellers();
}
