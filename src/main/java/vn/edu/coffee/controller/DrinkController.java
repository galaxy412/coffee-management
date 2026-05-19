package vn.edu.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.coffee.model.Drink;
import vn.edu.coffee.service.DrinkService;

/**
 * DrinkController: xử lý các request liên quan đến món uống
 *
 * URL mapping:
 *   GET  /drinks          → Danh sách món
 *   GET  /drinks/new      → Form thêm món mới
 *   POST /drinks/save     → Lưu món mới
 *   GET  /drinks/edit/{id}→ Form sửa món
 *   POST /drinks/update   → Cập nhật món
 *   GET  /drinks/delete/{id} → Xóa món
 */
@Controller
@RequestMapping("/drinks")
public class DrinkController {

    @Autowired
    private DrinkService drinkService;

    // ===== 1. Hiển thị danh sách tất cả món =====
    @GetMapping
    public String list(Model model) {
        model.addAttribute("drinks", drinkService.findAll());
        model.addAttribute("pageTitle", "Danh sách món uống");
        return "drinks/list";   // → /WEB-INF/views/drinks/list.jsp
    }

    // ===== 2. Hiển thị form THÊM món mới =====
    @GetMapping("/new")
    public String showAddForm(Model model) {
        model.addAttribute("drink", new Drink());       // Object rỗng để form binding
        model.addAttribute("pageTitle", "Thêm món mới");
        model.addAttribute("action", "save");            // Để JSP biết đây là thêm mới
        return "drinks/form";
    }

    // ===== 3. Lưu món MỚI (POST từ form thêm) =====
    @PostMapping("/save")
    public String save(@ModelAttribute Drink drink, Model model) {
        try {
            drinkService.save(drink);
            return "redirect:/drinks";   // Redirect về danh sách sau khi lưu
        } catch (IllegalArgumentException ex) {
            model.addAttribute("drink", drink);
            model.addAttribute("pageTitle", "Thêm món mới");
            model.addAttribute("action", "save");
            model.addAttribute("error", ex.getMessage());
            return "drinks/form";
        }
    }

    // ===== 4. Hiển thị form SỬA món =====
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Drink drink = drinkService.findById(id);
        model.addAttribute("drink", drink);
        model.addAttribute("pageTitle", "Sửa món: " + drink.getName());
        model.addAttribute("action", "update");          // Để JSP biết đây là sửa
        return "drinks/form";   // Dùng chung JSP với form thêm
    }

    // ===== 5. Cập nhật món (POST từ form sửa) =====
    @PostMapping("/update")
    public String update(@ModelAttribute Drink drink, Model model) {
        try {
            drinkService.update(drink);
            return "redirect:/drinks";
        } catch (IllegalArgumentException ex) {
            model.addAttribute("drink", drink);
            model.addAttribute("pageTitle", "Sửa món: " + (drink.getName() != null ? drink.getName() : ""));
            model.addAttribute("action", "update");
            model.addAttribute("error", ex.getMessage());
            return "drinks/form";
        }
    }

    // ===== 6. Xóa món =====
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        drinkService.delete(id);
        return "redirect:/drinks";
    }
}