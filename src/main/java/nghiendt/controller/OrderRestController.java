package nghiendt.controller;

import nghiendt.entity.Order;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.OrderRepository;
import nghiendt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/order")
public class OrderRestController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping
    public ResponseEntity<List<Order>> getAllCompanies() {
        List<Order> listOrder = orderRepository.findAll();
        if (listOrder.isEmpty()) {
            return new ResponseEntity<List<Order>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Order>>(listOrder, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Order> getCompaniesById(@PathVariable int id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not exist with id: " + id));
        return ResponseEntity.ok(order);
    }

    @PostMapping
    public Order create(@RequestBody Order order) {
        return orderRepository.save(order);
    }

    @PutMapping("{id}")
    public ResponseEntity<Order> update(@PathVariable("id") int id, @RequestBody Order order) {
        Order updateOrder = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not exist with id: " + id));
        orderRepository.save(order);
        return ResponseEntity.ok(updateOrder);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> delete(@PathVariable int id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not exist with id: " + id));
        orderRepository.delete(order);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
