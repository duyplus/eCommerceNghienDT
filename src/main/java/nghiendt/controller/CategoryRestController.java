package nghiendt.controller;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import nghiendt.entity.Category;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@SecurityRequirement(name = "nghiendt")
@RequestMapping(value = "/api/category")
public class CategoryRestController {
    @Autowired
    private CategoryRepository cateRepository;

    @GetMapping
    public ResponseEntity<List<Category>> getAllCategories() {
        List<Category> listCategory = cateRepository.findAll();
        if (listCategory.isEmpty()) {
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Category>>(listCategory, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Category> getCategoriesById(@PathVariable int id) {
        Category category = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        return ResponseEntity.ok(category);
    }

    @PostMapping
    public Category createCategories(@RequestBody Category category) {
        return cateRepository.save(category);
    }

    @PutMapping("{id}")
    public ResponseEntity<Category> updateCategories(@PathVariable("id") int id, @RequestBody Category category) {
        Category updateCategory = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        cateRepository.save(category);
        return ResponseEntity.ok(updateCategory);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteCategories(@PathVariable int id) {
        Category category = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        cateRepository.delete(category);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
