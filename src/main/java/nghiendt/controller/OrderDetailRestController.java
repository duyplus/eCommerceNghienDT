package nghiendt.controller;

import nghiendt.entity.OrderDetail;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/orderdetail")
public class OrderDetailRestController {
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @GetMapping
    public ResponseEntity<List<OrderDetail>> getAllOrderDetail() {
        List<OrderDetail> listOrderDetail = orderDetailRepository.findAll();
        if (listOrderDetail.isEmpty()) {
            return new ResponseEntity<List<OrderDetail>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<OrderDetail>>(listOrderDetail, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<OrderDetail> getOrderDetailById(@PathVariable int id) {
        OrderDetail orderDetail = orderDetailRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("OrderDetail not exist with id: " + id));
        return ResponseEntity.ok(orderDetail);
    }

    @PostMapping
    public OrderDetail createOrderDetail(@RequestBody OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

    @PutMapping("{id}")
    public ResponseEntity<OrderDetail> updateOrderDetail(@PathVariable("id") int id, @RequestBody OrderDetail orderDetail) {
        OrderDetail updateorderDetail = orderDetailRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("OrderDetail not exist with id: " + id));
        orderDetailRepository.save(orderDetail);
        return ResponseEntity.ok(updateorderDetail);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteOrderDetail(@PathVariable int id) {
        OrderDetail orderDetail = orderDetailRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("OrderDetail not exist with id: " + id));
        orderDetailRepository.delete(orderDetail);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

        @GetMapping("/approval/{status}")
    public ResponseEntity<List<OrderDetail>> getAllOrdersApproval(@PathVariable int status) {
        List<OrderDetail> listOrder = orderDetailRepository.findOrderByStatusApproval(status);
        if (listOrder.isEmpty())  {
            return new ResponseEntity<List<OrderDetail>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<OrderDetail>>(listOrder, HttpStatus.OK);
    }
}
