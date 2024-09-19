package mounir.said.PizzaTime.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import mounir.said.PizzaTime.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    
    List<User> findAll();
    
    User findByEmail(String email);
    
    // Use the existing findById method from CrudRepository
    Optional<User> findById(Long id);
}
