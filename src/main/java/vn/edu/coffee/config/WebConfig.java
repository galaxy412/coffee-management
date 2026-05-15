package vn.edu.coffee.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * WebConfig: cấu hình Spring MVC
 * - ViewResolver: ánh xạ tên view → file JSP
 * - ResourceHandler: phục vụ CSS/JS tĩnh
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "vn.edu.coffee.controller")
public class WebConfig implements WebMvcConfigurer {

    /**
     * ViewResolver: khi Controller return "drinks/list"
     * → tự động tìm file /WEB-INF/views/drinks/list.jsp
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");   // Thư mục chứa JSP
        resolver.setSuffix(".jsp");               // Đuôi file
        return resolver;
    }

    /**
     * Cho phép truy cập file tĩnh: CSS, JS, hình ảnh
     * URL /assets/** → thư mục /assets/ trong webapp
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("/assets/");
    }
}