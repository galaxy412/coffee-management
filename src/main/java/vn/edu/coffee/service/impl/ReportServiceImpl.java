package vn.edu.coffee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.coffee.dao.ReportDao;
import vn.edu.coffee.dto.DailyRevenueDto;
import vn.edu.coffee.dto.TopDrinkDto;
import vn.edu.coffee.service.ReportService;

import java.util.List;

/**
 * ReportServiceImpl: tầng Business Logic cho module báo cáo.
 *
 * @Service: Spring tự tạo Bean và inject vào Controller
 */
@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportDao reportDao;

    @Override
    public List<DailyRevenueDto> getDailyRevenue() {
        return reportDao.getDailyRevenue();
    }

    @Override
    public List<TopDrinkDto> getTop5BestSellers() {
        return reportDao.getTop5BestSellers();
    }
}
