package vn.edu.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.coffee.model.Drink;
import vn.edu.coffee.model.OrderItem;
import vn.edu.coffee.service.DrinkService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private DrinkService drinkService;

    // ===== 1. Hiển thị Menu gọi món =====
    @GetMapping
    public String showMenu(Model model) {
        // Chỉ lấy những món đang ở trạng thái Available (có sẵn)
        List<Drink> availableDrinks = drinkService.findAll().stream()
                .filter(Drink::isAvailable)
                .collect(Collectors.toList());

        model.addAttribute("drinks", availableDrinks);
        model.addAttribute("pageTitle", "Menu Gọi Món");
        return "order/menu";   // → /WEB-INF/views/order/menu.jsp
    }

    // ===== 2. Xử lý tính tiền từ Form submit =====
    @PostMapping("/checkout")
    public String checkout(@RequestParam Map<String, String> allParams, Model model) {
        List<OrderItem> orderItems = new ArrayList<>();
        double totalAmount = 0;

        // Quét toàn bộ tham số gửi lên từ form
        for (Map.Entry<String, String> entry : allParams.entrySet()) {
            String key = entry.getKey();

            // Tìm các field có tên bắt đầu bằng "qty_" (VD: qty_1, qty_2)
            if (key.startsWith("qty_")) {
                try {
                    int quantity = Integer.parseInt(entry.getValue());
                    // Chỉ xử lý nếu số lượng > 0
                    if (quantity > 0) {
                        Long drinkId = Long.parseLong(key.replace("qty_", ""));
                        Drink drink = drinkService.findById(drinkId);

                        OrderItem item = new OrderItem(drink, quantity);
                        orderItems.add(item);
                        totalAmount += item.getSubTotal();
                    }
                } catch (NumberFormatException e) {
                    // Bỏ qua nếu dữ liệu không hợp lệ
                }
            }
        }

        model.addAttribute("orderItems", orderItems);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("pageTitle", "Hóa Đơn Chi Tiết");

        return "order/bill";  // → /WEB-INF/views/order/bill.jsp
    }
}