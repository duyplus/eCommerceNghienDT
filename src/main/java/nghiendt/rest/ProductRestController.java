package nghiendt.rest;

import nghiendt.entity.Product;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.ProductRepository;
import nghiendt.service.ProductService;
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
        public ResponseEntity<List<Product>> getAllCompanies() {
            List<Product> listProduct = productRepository.findAll();
            if (listProduct.isEmpty()) {
                return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<List<Product>>(listProduct, HttpStatus.OK);
        }

        @GetMapping("{id}")
        public ResponseEntity<Product> getCompaniesById(@PathVariable int id) {
            Product product = productRepository.findById(id)
                    .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
            return ResponseEntity.ok(product);
        }

        @PostMapping
        public Product create(@RequestBody Product product) {
            return productRepository.save(product);
        }

        @PutMapping("{id}")
        public ResponseEntity<Product> update(@PathVariable("id") int id, @RequestBody Product product) {
            Product updateProduct = productRepository.findById(id)
                    .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
            productRepository.save(product);
            return ResponseEntity.ok(updateProduct);
        }

        @DeleteMapping("{id}")
        public ResponseEntity<HttpStatus> delete(@PathVariable int id) {
            Product product = productRepository.findById(id)
                    .orElseThrow(() -> new ResourceNotFoundException("Product not exist with id: " + id));
            productRepository.delete(product);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
}
