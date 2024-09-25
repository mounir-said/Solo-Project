package mounir.said.PizzaTime.repositories;


import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import mounir.said.PizzaTime.models.Order;


@Repository
public interface OrderRepository extends CrudRepository<Order, Long>{
    Optional<Order> findById(Long id);
    List<Order> findAll();
    List<Order> findAllByFavoritedById(Long userId);
    public List<Order> findAllByUserId(Long userId);
    List<Order> findFavoriteOrdersByUserId(Long userId);
    List<Order> findPastOrdersByUserId(Long userId);

}