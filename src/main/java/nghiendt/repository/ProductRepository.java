package nghiendt.repository;

import nghiendt.entity.Product;
import nghiendt.temporary.DailyRevenue;
import nghiendt.temporary.Top5Customer;
import nghiendt.temporary.Top5Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
//    //    MYSQL
//    @Modifying
//    @Query(value = "SELECT DISTINCT p.id as id, p.name as product_name, p.price as product_price, od.quantity as order_quantity,\n" +
//            "\tp.available as product_available, p.image product_image, c.name as company_name, u.fullname as full_name\n" +
//            "\tFROM order_details od\n" +
//            "\t\tJOIN orders o ON o.id = od.order_id\n" +
//            "\t\tJOIN users u ON u.id = o.user_id\n" +
//            "\t\tJOIN products as p ON p.user_id = u.id\n" +
//            "\t\tJOIN companies c ON c.id = p.company_id\n" +
//            "\tORDER BY order_quantity DESC\n" +
//            "\tLIMIT 5", nativeQuery = true)
//    List<Top5Product> getTop5Product();
//
//    @Modifying
//    @Query(value = "SELECT DISTINCT u.id as id, u.fullname as full_name, u.phone as user_phone, u.address as user_address,\n" +
//            "\tod.quantity as order_quantity, sum(od.price) as sum_order\n" +
//            "\tFROM order_details od\n" +
//            "\t\tJOIN orders o ON o.id = od.order_id\n" +
//            "\t\tJOIN users u ON u.id = o.user_id\n" +
//            "\tGROUP BY u.id, u.fullname, u.phone, u.address, od.quantity\n" +
//            "\tORDER BY order_quantity DESC\n" +
//            "\tLIMIT 5", nativeQuery = true)
//    List<Top5Customer> getTop5Customer();
//
//    @Modifying
//    @Query(value = "SELECT sum(od.quantity) as order_quantity, CAST(o.created_at as DATE) as today,\n" +
//            "\tSUM(od.price) as revenue_order, (SELECT SUM(price) FROM order_details) as sum_revenue\n" +
//            "\tFROM order_details od\n" +
//            "\t\tJOIN orders o ON o.id = od.order_id\n" +
//            "\t\tJOIN users u ON u.id = o.user_id\n" +
//            "\tWHERE CAST(o.created_at as DATE) = CAST(NOW(3) as DATE)\n" +
//            "\tGROUP BY CAST(o.created_at as DATE)\n" +
//            "\tORDER BY today DESC", nativeQuery = true)
//    List<DailyRevenue> getDailyRevenue();

//    SQL SERVER
    @Modifying
    @Query(value = "SELECT DISTINCT TOP 5 p.id as id, p.name as product_name, p.price as product_price, od.quantity as order_quantity,\n" +
            "\tp.available as product_available, p.image product_image, c.name as company_name, u.fullname as full_name\n" +
            "\tFROM order_details od\n" +
            "\t\tJOIN orders o ON o.id = od.order_id\n" +
            "\t\tJOIN users u ON u.id = o.user_id\n" +
            "\t\tJOIN products as p ON p.user_id = u.id\n" +
            "\t\tJOIN companies c ON c.id = p.company_id\n" +
            "\tORDER BY order_quantity DESC", nativeQuery = true)
    List<Top5Product> getTop5Product();

    @Modifying
    @Query(value = "SELECT DISTINCT TOP 5 u.id as id, u.fullname as full_name, u.phone as user_phone, u.address as user_address,\n" +
            "\tod.quantity as order_quantity, sum(od.price) as sum_order\n" +
            "\tFROM order_details od\n" +
            "\t\tJOIN orders o ON o.id = od.order_id\n" +
            "\t\tJOIN users u ON u.id = o.user_id\n" +
            "\tGROUP BY u.id, u.fullname, u.phone, u.address, od.quantity\n" +
            "\tORDER BY order_quantity DESC", nativeQuery = true)
    List<Top5Customer> getTop5Customer();

    @Modifying
    @Query(value = "SELECT sum(od.quantity) as order_quantity, CAST(o.created_at as DATE) as today,\n" +
            "\tSUM(od.price) as revenue_order, (SELECT SUM(price) FROM Order_Details) as sum_revenue\n" +
            "\tFROM order_details od\n" +
            "\t\tJOIN orders o ON o.id = od.order_id\n" +
            "\t\tJOIN users u ON u.id = o.user_id\n" +
            "\tWHERE CAST(o.created_at as DATE) = CAST(GETDATE() as DATE)\n" +
            "\tGROUP BY CAST(o.created_at as DATE)\n" +
            "\tORDER BY today DESC", nativeQuery = true)
    List<DailyRevenue> getDailyRevenue();
}