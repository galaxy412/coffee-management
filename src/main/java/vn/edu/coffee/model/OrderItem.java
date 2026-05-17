package vn.edu.coffee.model;
/**
 * Lớp đại diện cho một món đã được chọn trong đơn hàng.
 */
public class OrderItem {

    private Drink drink;
    private int quantity;

    public OrderItem(Drink drink, int quantity) {
        this.drink = drink;
        this.quantity = quantity;
    }

    public Drink getDrink() {
        return drink;
    }

    public void setDrink(Drink drink) {
        this.drink = drink;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Tự động tính thành tiền của món này
    public double getSubTotal() {
        return drink.getPrice() * quantity;
    }
}
