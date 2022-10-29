package nghiendt.repository;

import nghiendt.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Modifying
    @Query(value = "SELECT DISTINCT TOP 5 p.id as id, p.name as product_name, p.price as product_price, od.quantity order_quantity,\n" +
            "\tp.available as product_available, p.image product_image, c.name as company_name, u.fullname as full_name\n" +
            "\tFROM OrderDetails od\n" +
            "\t\tJOIN Orders o ON o.id = od.order_id\n" +
            "\t\tJOIN Users u ON u.id = o.user_id\n" +
            "\t\tJOIN Products as p ON p.user_id = u.id\n" +
            "\t\tJOIN Companies c ON c.id = p.company_id\n" +
            "\tORDER BY order_quantity DESC", nativeQuery = true)
    List<Top5> getTop5SP();

    public static interface Top5 {
        String getId();
        String getProduct_name();
        String getProduct_price();
        String getProduct_quantity();
        String getProduct_available();
        String getProduct_image();
        String getCompany_name();
        String getFull_name();
    }
}