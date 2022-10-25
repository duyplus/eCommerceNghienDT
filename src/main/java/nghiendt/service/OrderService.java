package nghiendt.service;

import nghiendt.entity.Order;

import java.util.List;

public interface OrderService {

    List<Order> findAll();

    Order findById(int id);

    Order create(Order order);

    Order update(Order order);

    void delete(int id);
}
