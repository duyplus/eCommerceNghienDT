package nghiendt.controller;

import nghiendt.entity.OrderDetail;
import nghiendt.entity.Product;
import nghiendt.entity.User;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.ProductRepository;
import nghiendt.service.ProductService;
import nghiendt.temporary.DailyRevenue;
import nghiendt.temporary.TopCustomer;
import nghiendt.temporary.TopProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
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

    @GetMapping("/search/{name}")
    public ResponseEntity<List<Product>> getProductsByName(@PathVariable String name) {
        List<Product> product = productRepository.searchByNameLike(name);
        if (product.isEmpty()) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Product>>(product, HttpStatus.OK);
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

    @GetMapping("getTopProduct")
    public List<TopProduct> getTop5Product() {
        return productRepository.getTopProduct();
    }

    @GetMapping("getTopCustomer")
    public List<TopCustomer> getTop5Customer() {
        return productRepository.getTopCustomer();
    }

    @GetMapping("getDailyRevenue")
    public List<DailyRevenue> getDailyRevenue() {
        return productRepository.getDailyRevenue();
    }

    @GetMapping("getFeaturedProducts")
    public List<TopProduct> getFeaturedProducts() {
        return productRepository.getFeaturedProducts();
    }
}
