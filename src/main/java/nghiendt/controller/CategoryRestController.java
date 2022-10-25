package nghiendt.controller;

import nghiendt.entity.Category;
import nghiendt.exception.ResourceNotFoundException;
import nghiendt.repository.CategoryRepository;
import nghiendt.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping(value = "/api/category")
public class CategoryRestController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository cateRepository;

    @GetMapping
    public ResponseEntity<List<Category>> getAllCompanies() {
        List<Category> listCategory = cateRepository.findAll();
        if (listCategory.isEmpty()) {
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Category>>(listCategory, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<Category> getCompaniesById(@PathVariable int id) {
        Category category = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        return ResponseEntity.ok(category);
    }

    @PostMapping
    public Category create(@RequestBody Category category) {
        return cateRepository.save(category);
    }

    @PutMapping("{id}")
    public ResponseEntity<Category> update(@PathVariable("id") int id, @RequestBody Category category) {
        Category updateCategory = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        cateRepository.save(category);
        return ResponseEntity.ok(updateCategory);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> delete(@PathVariable int id) {
        Category category = cateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category not exist with id: " + id));
        cateRepository.delete(category);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
