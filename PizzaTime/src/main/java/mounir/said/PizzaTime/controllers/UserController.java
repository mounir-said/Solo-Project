package mounir.said.PizzaTime.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import mounir.said.PizzaTime.dto.UserUpdateDto;
import mounir.said.PizzaTime.models.Order;
import mounir.said.PizzaTime.models.User;
import mounir.said.PizzaTime.services.OrderService;
import mounir.said.PizzaTime.services.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    
    
    
    @GetMapping("/")
    public String landingPage(HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/home";
        }
        return "redirect:/login";
    }

    
    
    
    @GetMapping("/login")
    public String loginForm(HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/home";
        }
        return "login.jsp";
    }

    
    
    @GetMapping("/register")
    public String registerForm(@ModelAttribute("user") User user, HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/home";
        }
        return "registration.jsp";
    }

    
    
    
    @PostMapping("/registration")
    public String registerUser(Model model, @Valid @ModelAttribute("user") User user, BindingResult result,
                               HttpSession session) {
        if (result.hasErrors()) {
            model.addAttribute("register_error", "Couldn't register user. Please try again.");
            return "registration.jsp";
        }
        if (userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("register_error", "That email is already in use. Please try again.");
            return "registration.jsp";
        }
        if (!user.getPassword().equals(user.getPasswordConfirmation())) {
            model.addAttribute("register_error", "Passwords don't match. Please try again.");
            return "registration.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/home";
    }

    
    
    
    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password,
                            Model model, HttpSession session) {
        if (userService.authenticateUser(email, password)) {
            session.setAttribute("userId", userService.findByEmail(email).getId());
            return "redirect:/home";
        }
        model.addAttribute("login_error", "User authentication error. Please try again.");
        return "login.jsp";
    }

    
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    
    
    
    @GetMapping("/home")
    public String dashboard(Model model, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        model.addAttribute("userId", currentUserId);
        return "home.jsp";
    }

    
    
    
    @GetMapping("/account/{id}")
    public String account(Model model, HttpSession session, @PathVariable("id") Long id) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        List<Order> pastOrders = userService.getAllOrdersByUser(id);
        List<Order> favoriteOrders = userService.findUserById(id).getFavoriteOrders();
        for (Order order : favoriteOrders) {
            pastOrders.remove(order);
        }
        model.addAttribute("user", userService.findUserById(currentUserId));
        model.addAttribute("pastOrders", pastOrders);
        model.addAttribute("favoriteOrders", favoriteOrders);
        return "account.jsp";
    }

    
    
    
    @PutMapping("/editaccount/{id}")
    public String editAccount(HttpSession session,
                              @PathVariable("id") Long userId,
                              @Valid @ModelAttribute("userDto") UserUpdateDto userDto,
                              BindingResult result) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        if (result.hasErrors()) {
            return "account.jsp";
        }
        userService.updateUser(currentUserId, userDto);
        return "redirect:/account/" + currentUserId;
    }



    
    @GetMapping("/favorite/{id}")
    public String favoriteAnOrder(@PathVariable("id") Long orderId, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        userService.favoriteOrderById(currentUserId, orderId);
        return "redirect:/account/" + currentUserId;
    }
    
    

    @DeleteMapping("/account/{id}")
    public String deleteAccountOrder(@PathVariable("id") Long id, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        orderService.deleteOrder(id);
        return "redirect:/account/" + currentUserId;
    }
}
