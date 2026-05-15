package vn.edu.coffee.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

/**
 * AppConfig: cấu hình DataSource và JdbcTemplate
 * @PropertySource đọc file database.properties trong resources/
 */
@Configuration
@ComponentScan(basePackages = "vn.edu.coffee")          // Quét toàn bộ package này
@PropertySource("classpath:database.properties")        // Đọc file properties
public class AppConfig {

    // Inject giá trị từ database.properties
    @Value("${db.driver}")   private String driver;
    @Value("${db.url}")      private String url;
    @Value("${db.username}") private String username;
    @Value("${db.password}") private String password;

    /**
     * Bean DataSource: kết nối MySQL
     */
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName(driver);
        ds.setUrl(url);
        ds.setUsername(username);
        ds.setPassword(password);
        return ds;
    }

    /**
     * Bean JdbcTemplate: dùng trong DAO để query SQL
     */
    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}