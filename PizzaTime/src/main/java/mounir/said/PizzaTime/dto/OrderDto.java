package mounir.said.PizzaTime.dto;

import java.util.List;

public class OrderDto {
    private String deliveryMethod;
    private String pizzaSize;
    private String crustType;
    private Long qty;
    private List<String> toppings;

    // Constructors
    public OrderDto() {}

    public OrderDto(String deliveryMethod, String pizzaSize, String crustType, Long qty, List<String> toppings) {
        this.deliveryMethod = deliveryMethod;
        this.pizzaSize = pizzaSize;
        this.crustType = crustType;
        this.qty = qty;
        this.toppings = toppings;
    }

    // Getters and Setters
    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public String getPizzaSize() {
        return pizzaSize;
    }

    public void setPizzaSize(String pizzaSize) {
        this.pizzaSize = pizzaSize;
    }

    public String getCrustType() {
        return crustType;
    }

    public void setCrustType(String crustType) {
        this.crustType = crustType;
    }

    public Long getQty() {
        return qty;
    }

    public void setQty(Long qty) {
        this.qty = qty;
    }

    public List<String> getToppings() {
        return toppings;
    }

    public void setToppings(List<String> toppings) {
        this.toppings = toppings;
    }
}
