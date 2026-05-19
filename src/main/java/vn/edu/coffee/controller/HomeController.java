package vn.edu.coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * HomeController: xử lý trang chủ
 * Truy cập: http://localhost:8080/coffee/
 */
@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String home() {
        return "home";   // → /WEB-INF/views/home.jsp
    }
}