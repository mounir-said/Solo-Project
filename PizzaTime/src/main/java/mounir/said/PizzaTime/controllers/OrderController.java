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
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import mounir.said.PizzaTime.models.Order;
import mounir.said.PizzaTime.services.OrderService;
import mounir.said.PizzaTime.services.UserService;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;
    
    

    @GetMapping("/reorder/favorite")
    public String reorderFavorite(HttpSession session, Model model) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }

        List<Order> favoriteOrders = orderService.getFavoriteOrders(currentUserId);
        model.addAttribute("favoriteOrders", favoriteOrders);

        return "reorderFavorite.jsp"; 
    }
    
    

    @GetMapping("/order/reorder/{id}")
    public String reorderPizza(@PathVariable("id") Long orderId, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        Order order = orderService.getOneOrder(orderId);
        if (order != null) {
            
            orderService.createOrder(order);
        }

        return "redirect:/account/" + currentUserId;
    }
    
    

    @GetMapping("/order/surprise")
    public String surpriseMe(HttpSession session, Model model) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }

        Order randomOrder = orderService.createRandomOrder(currentUserId);
        model.addAttribute("order", randomOrder);
        return "surpriseMe.jsp";
    }
    
    

    @PostMapping("/order/random")
    public String orderRandomPizza(HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/login"; 
        }

        Order randomOrder = orderService.createRandomOrder(currentUserId);

        return "redirect:/checkout/" + randomOrder.getId();
    }

    
    
    @GetMapping("/order")
    public String orderForm(@ModelAttribute("order") Order order, Model model, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }

        model.addAttribute("user", userService.findUserById(currentUserId));
        return "createOrder.jsp"; 
    }

    
    
    @PostMapping("/createorder")
    public String createOrder(Model model, HttpSession session, @Valid @ModelAttribute("order") Order order,
                              BindingResult result) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        Order currentOrder = orderService.createOrder(order);
        session.setAttribute("currentOrder", currentOrder);
        return "redirect:/checkout/" + currentOrder.getId();
    }
    
    
    
    @GetMapping("/checkout/{id}")
    public String checkoutPage(Model model, @PathVariable("id") Long orderId, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        Order currentOrder = (Order) session.getAttribute("currentOrder");
        model.addAttribute("currentOrder", currentOrder);
        Double price = 9.99 + currentOrder.getToppings().size() * 0.50;
        model.addAttribute("price", price);
        return "checkout.jsp";
    }
    
    
    
    @PostMapping("/purchase/{id}")
    public String purchaseOrder(@PathVariable("id") Long id, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        session.removeAttribute("currentOrder");
        return "redirect:/home";
    }

    
    
    
    @DeleteMapping("/checkout/{id}/delete")
    public String deleteOrder(@PathVariable("id") Long id, HttpSession session) {
        Long currentUserId = (Long) session.getAttribute("userId");
        if (currentUserId == null) {
            return "redirect:/";
        }
        orderService.deleteOrder(id);
        session.removeAttribute("currentOrder");
        return "redirect:/order";
    }
}
