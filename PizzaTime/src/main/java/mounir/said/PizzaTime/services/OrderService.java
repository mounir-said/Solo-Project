package mounir.said.PizzaTime.services;


import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mounir.said.PizzaTime.models.Order;
import mounir.said.PizzaTime.models.User;
import mounir.said.PizzaTime.repositories.OrderRepository;

@Service
public class OrderService {
	@Autowired
	private final OrderRepository oRepo;
	
	private final List<String> deliveryMethods = Arrays.asList("Delivery", "Pickup");
    private final List<String> pizzaSizes = Arrays.asList("Small", "Medium", "Large");
    private final List<String> crustTypes = Arrays.asList("Thin", "Thick", "Stuffed");

    public Order createRandomOrder() {
        Random random = new Random();
        User defaultUser = new User(); // Replace with actual user fetching logic
        defaultUser.setId(1L); // Set a default user ID or fetch from session

        String deliveryMethod = getRandomElement(deliveryMethods);
        String pizzaSize = getRandomElement(pizzaSizes);
        String crustType = getRandomElement(crustTypes);
        Long qty = (long) (random.nextInt(5) + 1); // Quantity between 1 and 5
        List<String> toppings = Arrays.asList("Cheese", "Pepperoni", "Mushrooms", "Onions", "Olives");
        Collections.shuffle(toppings); // Randomize toppings order
        toppings = toppings.subList(0, random.nextInt(4) + 1); // Random number of toppings

        Order randomOrder = new Order(defaultUser, deliveryMethod, pizzaSize, crustType, qty, toppings);
        return randomOrder;
    }

    private <T> T getRandomElement(List<T> list) {
        Random random = new Random();
        return list.get(random.nextInt(list.size()));
    }

	public OrderService(OrderRepository repository) {
		this.oRepo = repository;
	}

	public List<Order> getAllOrders() {
		return this.oRepo.findAll();
	}

	public Order getOneOrder(Long id) {
		return this.oRepo.findById(id).orElse(null);
	}

	public Order createOrder(Order order) {
		return this.oRepo.save(order);
	}

	public Order editOrder(Order order) {
		return oRepo.save(order);
	}

	public String deleteOrder(Long id) {
		this.oRepo.deleteById(id);
		return "DELETED";
	}
	
	public List<Order> getFavoriteOrders(Long userId) {
        return oRepo.findAllByFavoritedById(userId);
    }
	
	
}
