package vn.edu.coffee.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * WebAppInitializer: thay thế web.xml hoàn toàn
 *
 * Khi Tomcat 10.1 khởi động, nó tự động phát hiện class này
 * (vì implements WebApplicationInitializer thông qua Abstract class)
 * và đăng ký DispatcherServlet.
 *
 * QUAN TRỌNG: Class này dùng jakarta.* (không phải javax.*)
 * vì AbstractAnnotationConfigDispatcherServletInitializer
 * trong Spring MVC 6 đã dùng Jakarta.
 */
public class WebAppInitializer
        extends AbstractAnnotationConfigDispatcherServletInitializer {

    /**
     * Config gốc của ứng dụng (DataSource, Service, DAO)
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{ AppConfig.class };
    }

    /**
     * Config của web layer (Controller, ViewResolver)
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{ WebConfig.class };
    }

    /**
     * URL mapping: "/" nghĩa là DispatcherServlet xử lý mọi request
     */
    @Override
    protected String[] getServletMappings() {
        return new String[]{ "/" };
    }

    /**
     * Hỗ trợ upload file (Version 2 trở đi sẽ cần)
     */
    @Override
    protected boolean isAsyncSupported() {
        return true;
    }
}