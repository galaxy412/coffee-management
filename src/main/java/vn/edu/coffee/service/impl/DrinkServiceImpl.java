package vn.edu.coffee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.coffee.dao.DrinkDao;
import vn.edu.coffee.model.Drink;
import vn.edu.coffee.service.DrinkService;

import java.util.List;

/**
 * DrinkServiceImpl: tầng Business Logic
 * Đây là nơi đặt validation và quy tắc nghiệp vụ,
 * KHÔNG đặt logic trực tiếp trong Controller.
 *
 * @Service: Spring tự tạo Bean và inject vào Controller
 */
@Service
public class DrinkServiceImpl implements DrinkService {

    @Autowired
    private DrinkDao drinkDao;

    @Override
    public List<Drink> findAll() {
        return drinkDao.findAll();
    }

    @Override
    public Drink findById(Long id) {
        return drinkDao.findById(id);
    }

    @Override
    public void save(Drink drink) {
        // Validation nghiệp vụ
        validateDrink(drink);
        drinkDao.save(drink);
    }

    @Override
    public void update(Drink drink) {
        validateDrink(drink);
        drinkDao.update(drink);
    }

    @Override
    public void delete(Long id) {
        drinkDao.delete(id);
    }

    // ===== Helper: Validation =====
    private void validateDrink(Drink drink) {
        if (drink.getName() == null || drink.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Tên món không được để trống");
        }
        if (drink.getPrice() <= 0) {
            throw new IllegalArgumentException("Giá phải lớn hơn 0");
        }
    }
}