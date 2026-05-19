package vn.edu.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.edu.coffee.dto.DailyRevenueDto;
import vn.edu.coffee.dto.TopDrinkDto;
import vn.edu.coffee.service.ReportService;

import java.util.List;

/**
 * ReportController: xử lý các request liên quan đến báo cáo thống kê.
 * Truy cập: http://localhost:8080/coffee/reports
 */
@Controller
@RequestMapping("/reports")
public class ReportController {

    @Autowired
    private ReportService reportService;

    /**
     * Hiển thị dashboard báo cáo: doanh thu theo ngày + top 5 món bán chạy.
     */
    @GetMapping
    public String dashboard(Model model) {
        List<DailyRevenueDto> revenueList = reportService.getDailyRevenue();
        List<TopDrinkDto> topDrinks = reportService.getTop5BestSellers();

        model.addAttribute("revenueList", revenueList);
        model.addAttribute("topDrinks", topDrinks);

        return "reports/dashboard";   // → /WEB-INF/views/reports/dashboard.jsp
    }
}
