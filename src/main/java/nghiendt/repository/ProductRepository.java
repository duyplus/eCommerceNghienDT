package nghiendt.repository;

import nghiendt.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = "SELECT DISTINCT TOP 5 p.id as id, p.name as product_name, p.price as product_price, p.quantity product_quantity, c.name as company_name, u.username as user_name, p.available as product_available\n" +
            "\tFROM Products as p\n" +
            "\t\tINNER JOIN Users u ON u.id = p.user_id\n" +
            "\t\tINNER JOIN Companies c ON c.id = p.company_id\n" +
            "\tORDER BY product_quantity DESC", nativeQuery = true)
    List getTop5SP();
}