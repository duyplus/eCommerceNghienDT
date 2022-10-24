package nghiendt.service;

import nghiendt.entity.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAll();

    Category findById(int cateid);

    Category create(Category category);

    Category update(Category category);

    void delete(int cateid);
}
