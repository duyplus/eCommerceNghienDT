package nghiendt.service.impl;

import nghiendt.entity.Category;
import nghiendt.repository.CategoryRepository;
import nghiendt.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
     @Autowired
     CategoryRepository categoryRepository;

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category findById(int cateid) {
        return categoryRepository.findById(cateid).get();
    }


    @Override
    public Category create(Category cate) {
        return categoryRepository.save(cate);
    }

    @Override
    public Category update(Category cate) {
        return categoryRepository.save(cate);
    }

    @Override
    public void delete(int cateid) {
        categoryRepository.deleteById(cateid);
    }
}
