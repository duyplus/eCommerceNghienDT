package nghiendt.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import nghiendt.entity.Product;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.ProductRepository;
import nghiendt.service.ProductService;
import nghiendt.temporary.DailyRevenue;
import nghiendt.temporary.Top5Customer;
import nghiendt.temporary.Top5Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@SecurityRequirement(name = "nghiendt")
@RequestMapping(value = "/api/product")
public class ProductRestController {
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        List<Product> listProduct = productRepository.findAll();
        if (listProduct.isEmpty()) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Product>>(listProduct, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Product> getProductsById(@PathVariable int id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
        return ResponseEntity.ok(product);
    }

    @PostMapping
    public Product createProducts(@RequestBody Product product) {
        return productRepository.save(product);
    }

    @PutMapping("{id}")
    public ResponseEntity<Product> updateProducts(@PathVariable("id") int id, @RequestBody Product product) {
        Product updateProduct = productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
        productRepository.save(product);
        return ResponseEntity.ok(updateProduct);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteProducts(@PathVariable int id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
        productRepository.delete(product);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("getTop5Product")
    public List<Top5Product> getTop5Product() {
        return productRepository.getTop5Product();
    }

    @GetMapping("getTop5Customer")
    public List<Top5Customer> getTop5Customer() {
        return productRepository.getTop5Customer();
    }

    @GetMapping("getDailyRevenue")
    public List<DailyRevenue> getDailyRevenue() {
        return productRepository.getDailyRevenue();
    }
}
