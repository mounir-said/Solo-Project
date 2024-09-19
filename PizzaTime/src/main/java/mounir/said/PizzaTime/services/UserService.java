package mounir.said.PizzaTime.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import mounir.said.PizzaTime.dto.UserUpdateDto;
import mounir.said.PizzaTime.models.*;
import mounir.said.PizzaTime.repositories.*;

@Service
public class UserService {
	private final UserRepository userRepo;
	private final OrderRepository orderRepo;

	public UserService(UserRepository userRepo, OrderRepository orderRepo) {
        this.userRepo = userRepo;
        this.orderRepo = orderRepo;
    }

    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }

    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	return u.orElse(null);
    }

    public boolean authenticateUser(String email, String password) {
        User user = userRepo.findByEmail(email);
        if(user == null) {
            return false;
        } else {
            return BCrypt.checkpw(password, user.getPassword());
        }
    }

    public List<Order> getAllOrdersByUser(Long userId) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
        return user.getOrders();
    }

    public void favoriteOrderById(Long userId, Long orderId) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
        Order order = orderRepo.findById(orderId).orElseThrow(() -> new RuntimeException("Order not found"));

        if (order.getFavoritedBy() != null && order.getFavoritedBy().getId().equals(userId)) {
            // Unfavorite the order
            order.setFavoritedBy(null);
        } else {
            // Make favorite
            order.setFavoritedBy(user);
        }

        orderRepo.save(order);
    }

    public List<Order> getFavoriteOrdersByUser(Long userId) {
        return orderRepo.findAllByFavoritedById(userId);
    }

    public void updateUser(Long userId, UserUpdateDto userDto) {
        User userToUpdate = userRepo.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        userToUpdate.setFirstName(userDto.getFirstName());
        userToUpdate.setLastName(userDto.getLastName());
        userToUpdate.setEmail(userDto.getEmail());
        userToUpdate.setAddress(userDto.getAddress());
        userToUpdate.setCity(userDto.getCity());
        userToUpdate.setState(userDto.getState());

        userRepo.save(userToUpdate);
    }

}