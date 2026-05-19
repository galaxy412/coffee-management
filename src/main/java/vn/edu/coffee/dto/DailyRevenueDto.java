package vn.edu.coffee.dto;

import java.sql.Date;

/**
 * DTO chứa dữ liệu doanh thu theo ngày.
 * Dùng cho báo cáo thống kê (Module V4).
 */
public class DailyRevenueDto {

    private Date reportDate;
    private double dailyRevenue;

    // ===== Constructors =====
    public DailyRevenueDto() {
    }

    public DailyRevenueDto(Date reportDate, double dailyRevenue) {
        this.reportDate = reportDate;
        this.dailyRevenue = dailyRevenue;
    }

    // ===== Getters & Setters =====
    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public double getDailyRevenue() {
        return dailyRevenue;
    }

    public void setDailyRevenue(double dailyRevenue) {
        this.dailyRevenue = dailyRevenue;
    }
}
