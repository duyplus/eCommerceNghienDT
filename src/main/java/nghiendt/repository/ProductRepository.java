package nghiendt.repository;

import nghiendt.entity.Product;
import nghiendt.temporary.DailyRevenue;
import nghiendt.temporary.TopCustomer;
import nghiendt.temporary.TopProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = "exec getTopProduct", nativeQuery = true)
    List<TopProduct> getTopProduct();

    @Query(value = "exec getTopCustomer", nativeQuery = true)
    List<TopCustomer> getTopCustomer();

    @Query(value = "exec getDailyRevenue", nativeQuery = true)
    List<DailyRevenue> getDailyRevenue();

    @Query(value = "exec getFeaturedProducts", nativeQuery = true)
    List<TopProduct> getFeaturedProducts();
}