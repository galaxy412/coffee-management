package vn.edu.coffee.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import vn.edu.coffee.dao.DrinkDao;
import vn.edu.coffee.model.Drink;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * DrinkDaoImpl: thực thi các query SQL bằng JdbcTemplate
 *
 * @Repository: báo Spring đây là bean tầng DAO
 */
@Repository
public class DrinkDaoImpl implements DrinkDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // ===== RowMapper: chuyển từng hàng ResultSet → Drink object =====
    private static final RowMapper<Drink> DRINK_ROW_MAPPER = new RowMapper<Drink>() {
        @Override
        public Drink mapRow(ResultSet rs, int rowNum) throws SQLException {
            Drink drink = new Drink();
            drink.setId(rs.getLong("id"));
            drink.setName(rs.getString("name"));
            drink.setPrice(rs.getDouble("price"));
            drink.setCategory(rs.getString("category"));
            drink.setAvailable(rs.getBoolean("available"));
            return drink;
        }
    };

    // ===== Lấy tất cả món =====
    @Override
    public List<Drink> findAll() {
        String sql = "SELECT * FROM drinks ORDER BY category, name";
        return jdbcTemplate.query(sql, DRINK_ROW_MAPPER);
    }

    // ===== Tìm theo ID =====
    @Override
    public Drink findById(Long id) {
        String sql = "SELECT * FROM drinks WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, DRINK_ROW_MAPPER, id);
    }

    // ===== Thêm món mới =====
    @Override
    public void save(Drink drink) {
        String sql = "INSERT INTO drinks (name, price, category, available) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                drink.getName(),
                drink.getPrice(),
                drink.getCategory(),
                drink.isAvailable() ? 1 : 0
        );
    }

    // ===== Cập nhật món =====
    @Override
    public void update(Drink drink) {
        String sql = "UPDATE drinks SET name=?, price=?, category=?, available=? WHERE id=?";
        jdbcTemplate.update(sql,
                drink.getName(),
                drink.getPrice(),
                drink.getCategory(),
                drink.isAvailable() ? 1 : 0,
                drink.getId()
        );
    }

    // ===== Xóa món =====
    @Override
    public void delete(Long id) {
        String sql = "DELETE FROM drinks WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}