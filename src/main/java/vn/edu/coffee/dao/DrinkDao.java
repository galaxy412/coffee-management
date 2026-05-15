// ===== FILE 1: DrinkDao.java (interface) =====
// Đặt tại: vn/edu/coffee/dao/DrinkDao.java

package vn.edu.coffee.dao;

import vn.edu.coffee.model.Drink;
import java.util.List;

/**
 * Interface định nghĩa các thao tác với bảng drinks.
 * Tách interface + implementation để dễ test và thay đổi về sau.
 */
public interface DrinkDao {
    List<Drink> findAll();
    Drink       findById(Long id);
    void        save(Drink drink);      // Thêm mới
    void        update(Drink drink);    // Cập nhật
    void        delete(Long id);        // Xóa
}