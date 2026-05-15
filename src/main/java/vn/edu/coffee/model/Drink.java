package vn.edu.coffee.model;

/**
 * Model Drink: ánh xạ với bảng drinks trong MySQL
 */
public class Drink {

    private Long   id;
    private String name;
    private double price;
    private String category;
    private boolean available;

    // ===== Constructors =====

    public Drink() {}

    public Drink(Long id, String name, double price, String category, boolean available) {
        this.id        = id;
        this.name      = name;
        this.price     = price;
        this.category  = category;
        this.available = available;
    }

    // ===== Getters & Setters =====

    public Long getId()               { return id; }
    public void setId(Long id)        { this.id = id; }

    public String getName()           { return name; }
    public void setName(String name)  { this.name = name; }

    public double getPrice()              { return price; }
    public void setPrice(double price)    { this.price = price; }

    public String getCategory()               { return category; }
    public void setCategory(String category)  { this.category = category; }

    public boolean isAvailable()                 { return available; }
    public void setAvailable(boolean available)  { this.available = available; }

    @Override
    public String toString() {
        return "Drink{id=" + id + ", name='" + name + "', price=" + price + "}";
    }
}