package vn.edu.coffee.dto;

/**
 * DTO chứa thông tin món bán chạy nhất.
 * Dùng cho báo cáo Top 5 (Module V4).
 */
public class TopDrinkDto {

    private String drinkName;
    private int totalSold;

    // ===== Constructors =====
    public TopDrinkDto() {
    }

    public TopDrinkDto(String drinkName, int totalSold) {
        this.drinkName = drinkName;
        this.totalSold = totalSold;
    }

    // ===== Getters & Setters =====
    public String getDrinkName() {
        return drinkName;
    }

    public void setDrinkName(String drinkName) {
        this.drinkName = drinkName;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }
}
