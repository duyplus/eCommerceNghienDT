package nghiendt.repository;

import nghiendt.entity.Product;
import nghiendt.temporary.DailyRevenue;
import nghiendt.temporary.TopCustomer;
import nghiendt.temporary.TopProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

//    @Modifying
//    @Query(value = "CALL getTopProduct", nativeQuery = true)
//    List<TopProduct> getTopProduct();
//
//    @Modifying
//    @Query(value = "CALL getTopCustomer", nativeQuery = true)
//    List<TopCustomer> getTopCustomer();
//
//    @Modifying
//    @Query(value = "CALL getDailyRevenue", nativeQuery = true)
//    List<DailyRevenue> getDailyRevenue();
//
//    @Modifying
//    @Query(value = "CALL getFeaturedProducts", nativeQuery = true)
//    List<TopProduct> getFeaturedProducts();
//
//    @Modifying
//    @Query("SELECT p FROM Product p WHERE p.name LIKE %:name%")
//    List<Product> searchByNameLike(String name);

    @Modifying
    @Query(value = "exec getTopProduct", nativeQuery = true)
    List<TopProduct> getTopProduct();

    @Modifying
    @Query(value = "exec getTopCustomer", nativeQuery = true)
    List<TopCustomer> getTopCustomer();

    @Modifying
    @Query(value = "exec getDailyRevenue", nativeQuery = true)
    List<DailyRevenue> getDailyRevenue();

    @Modifying
    @Query(value = "exec getFeaturedProducts", nativeQuery = true)
    List<TopProduct> getFeaturedProducts();

    @Modifying
    @Query("SELECT p FROM Product p WHERE p.name LIKE '%'+?1+'%'")
    List<Product> searchByNameLike(String name);
}