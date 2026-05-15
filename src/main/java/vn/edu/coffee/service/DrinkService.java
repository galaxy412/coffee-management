// ===== FILE 1: DrinkService.java (interface) =====
// Đặt tại: vn/edu/coffee/service/DrinkService.java

package vn.edu.coffee.service;

import vn.edu.coffee.model.Drink;
import java.util.List;

public interface DrinkService {
    List<Drink> findAll();
    Drink       findById(Long id);
    void        save(Drink drink);
    void        update(Drink drink);
    void        delete(Long id);
}


